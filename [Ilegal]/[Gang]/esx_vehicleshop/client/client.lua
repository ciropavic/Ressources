
local lastSelectedVehicleEntity

local hashListLoadedOnMemory = {}

local inTheShop = false
local profileName
local profileMoney

ESX                           = nil

Citizen.CreateThread(function ()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)


local rgbColorSelected = {
    R = 255,
    G = 255,
    B = 255,
}

local rgbSecondaryColorSelected = {
    R = 255,
    G = 255,
    B = 255,
}

local vehicleshopCoords = {
    vector3(-56.49, -1096.58, 26.42),

}

Citizen.CreateThread(
    function()
        while true do
            Citizen.Wait(3)
            local ped = PlayerPedId()
            for i = 1, #vehicleshopCoords do
            local actualShop = vehicleshopCoords[i]
            local dist = #(actualShop - GetEntityCoords(ped))
            DisplayRadar(true)
                if dist <= 10.0 then                    
                    DrawText3Ds(actualShop.x, actualShop.y, actualShop.z, _U('press_to_open'))
                    DrawMarker(23, actualShop.x, actualShop.y, actualShop.z - 0.97, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.7, 200, 10, 10, 100, 0, 0, 0, 0, 0, 0, 0)
                    if dist <= 2.5 then
                        if IsControlJustPressed(0, 38) then
                            OpenVehicleShop()
                        end
                    end
                end
            end
        end
    end
)

function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())

    SetTextScale(0.32, 0.32)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 255)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 500
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 80)
end

RegisterNetEvent('vehicleshop.receiveInfo')
AddEventHandler('vehicleshop.receiveInfo', function(bank, name)
    if name then
        profileName = name
    end
    profileMoney = bank
end)


RegisterNetEvent('vehicleshop.sussessbuy')
AddEventHandler('vehicleshop.sussessbuy', function(vehicleName,vehiclePlate,value)    
    SendNUIMessage(
        {
            type = "sussess-buy",
            vehicleName = vehicleName,
            vehiclePlate = vehiclePlate,
            value = value
        }
    ) 
end)

RegisterNetEvent('vehicleshop.notify')
AddEventHandler('vehicleshop.notify', function(type, message)    
    SendNUIMessage(
        {
            type = "notify",
            typenotify = type,
            message = message,
        }
    ) 
end)

local vehiclesTable = {}

local provisoryObject = {}

RegisterNetEvent('vehicleshop.vehiclesInfos')
AddEventHandler('vehicleshop.vehiclesInfos', function(tableVehicles)      

    for _,value in pairs(tableVehicles) do
        vehiclesTable[value.category] = {}
    end

    for _,value in pairs(tableVehicles) do

        local vehicleModel = GetHashKey(value.model)
        local brandName

        if Config.Build2060 then
            brandName = GetLabelText(Citizen.InvokeNative(0xF7AF4F159FF99F97, vehicleModel, Citizen.ResultAsString()))    
        else
            brandName = nil
        end

        if brandName == nil then
            brandName = 'Custom'
        end    

        local vehicleName   

        if GetLabelText(value.model) == "NULL" then
            vehicleName = value.model:gsub("^%l", string.upper)
        else 
            vehicleName = GetLabelText(value.model)
        end

        provisoryObject = 
        {
            brand = brandName,
            name = vehicleName,
            handling = 'none',
            topspeed = math.ceil(GetVehicleModelEstimatedMaxSpeed(vehicleModel)*3.605936),
            power = math.ceil(GetVehicleModelAcceleration(vehicleModel)*1000),
            price = value.price,
            model = value.model,
            qtd = value.stock
        }
        table.insert(vehiclesTable[value.category], provisoryObject)
    end
end)

function OpenVehicleShop()
    inTheShop = true
    local ped = PlayerPedId()

    TriggerServerEvent("vehicleshop.requestInfo")

    Citizen.Wait(1000)

    SendNUIMessage(
        {
            data = vehiclesTable,
            type = "display",
            playerName = profileName,
            playerMoney = profileMoney
        }
    )

    SetNuiFocus(true, true)

    RequestCollisionAtCoord(x, y, z)

    --SetEntityVisible(ped, false, 0)
    --SetEntityCoords(ped, 404.90, -949.58, -99.71, 0, 0, 0, false)

    cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", 404.60, -945.44, -98.50, 360.00, 0.00, 0.00, 80.00, false, 0)
    PointCamAtCoord(cam, 404.90, -950.58, -100.00)


    SetCamActive(cam, true)
    RenderScriptCams(true, true, 1, true, true)
    
    SetFocusPosAndVel(404.90, -949.58, -99.71, 0.0, 0.0, 0.0)

    DisplayHud(false)
    DisplayRadar(false)

    while inTheShop do
        Citizen.Wait(0)        
   --    DrawLightWithRange(404.99, -949.60, -98.98, 255, 255, 255, 20.000, 100.000)
    end

    if lastSelectedVehicleEntity ~= nil then
        DeleteEntity(lastSelectedVehicleEntity)
    end

end


function rotation(dir)
    local entityRot = GetEntityHeading(lastSelectedVehicleEntity) + dir
    SetEntityHeading(lastSelectedVehicleEntity, entityRot % 360)
end

RegisterNUICallback(
    "rotate",
    function(data, cb)
        if (data["key"] == "left") then
            rotation(2)
        else
            rotation(-2)
        end
        cb("ok")
    end
)

function updateSelectedVehicle(model)
    local hash = GetHashKey(model)

    if not HasModelLoaded(hash) then
        RequestModel(hash)
        while not HasModelLoaded(hash) do
            Citizen.Wait(10)
        end
    end

    if lastSelectedVehicleEntity ~= nil then
        DeleteEntity(lastSelectedVehicleEntity)
    end

    lastSelectedVehicleEntity = CreateVehicle(hash, 404.99, -949.60, -99.98, 10, 0, 1)

  --  SetVehicleCustomPrimaryColour(lastSelectedVehicleEntity, rgbColorSelected.R, rgbColorSelected.G, rgbColorSelected.B)
 --   SetVehicleCustomSecondaryColour(lastSelectedVehicleEntity, rgbSecondaryColorSelected.R, rgbSecondaryColorSelected.G, rgbSecondaryColorSelected.B)

    SetEntityHeading(lastSelectedVehicleEntity, 50.117)
end

RegisterNUICallback(
    "SpawnVehicle",
    function(data, cb)
        updateSelectedVehicle(data.modelcar)
    end
)

RegisterNUICallback(
    "RGBVehicle",
    function(data, cb)

        if data.primary then
            rgbColorSelected = data
            SetVehicleCustomPrimaryColour(lastSelectedVehicleEntity, data.R, data.G, data.B)
        else
            rgbSecondaryColorSelected = data
            SetVehicleCustomSecondaryColour(lastSelectedVehicleEntity, data.R, data.G, data.B)
        end
    end
)


RegisterNUICallback(
    "Buy",
    function(data, cb)

        local newPlate     = GeneratePlate()
        local vehicleProps = ESX.Game.GetVehicleProperties(lastSelectedVehicleEntity)
        vehicleProps.plate = newPlate
        SetVehicleNumberPlateText(vehicle, newPlate)

        TriggerServerEvent('vehicleshop.CheckMoneyForVeh',data.modelcar, data.sale*1000, data.name, vehicleProps)

        Wait(1500)
        
        SendNUIMessage(
            {
                type = "updateMoney",
                playerMoney = profileMoney
            }
        )

    end
)


RegisterNUICallback(
    "menuSelected",
    function(data, cb)
        local categoryVehicles

        local playerIdx = GetPlayerFromServerId(source)
        local ped = GetPlayerPed(playerIdx)
        
        if data.menuId ~= 'all' then
            categoryVehicles = vehiclesTable[data.menuId]
        else
            SendNUIMessage(
                {
                    data = vehiclesTable,
                    type = "display",
                    playerName = GetPlayerName(ped)
                }
            )
            return
        end

        SendNUIMessage(
            {
                data = categoryVehicles,
                type = "menu"
            }
        )
    end
)


RegisterNUICallback(
    "Close",
    function(data, cb)
        CloseNui()       

    end
)

function CloseNui()
    SendNUIMessage(
        {
            type = "hide"
        }
    )
    SetNuiFocus(false, false)

    if inTheShop then
        if lastSelectedVehicleEntity ~= nil then
            DeleteEntity(lastSelectedVehicleEntity)
        end

        local ped = PlayerPedId()
    --  SetEntityVisible(ped, true, 0)        
    --  SetEntityCoords(ped, -44.80, -1097.82, 26.42, 0, 0, 0, false)        
        RenderScriptCams(false)
        DestroyAllCams(true)
        ClearFocus()
        DisplayHud(true)
        DisplayRadar(true)
    end

    inTheShop = false
end

local blip 

-- Create Blips
Citizen.CreateThread(function ()

    for i = 1, #vehicleshopCoords do    
        local actualShop = vehicleshopCoords[i]
        blip = AddBlipForCoord(actualShop.x, actualShop.y, actualShop.z)

        SetBlipSprite (blip, 326)
        SetBlipDisplay(blip, 4)
        SetBlipScale  (blip, 0.8)
        SetBlipAsShortRange(blip, true)

        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(_U('car_dealer'))
        EndTextCommandSetBlipName(blip)
    end
end)

AddEventHandler(
    "onResourceStop",
    function(resourceName)
        if resourceName == GetCurrentResourceName() then
           CloseNui()
           RemoveBlip(blip)
        end
    end
)
