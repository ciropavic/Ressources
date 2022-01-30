ESX = nil
ESXLoaded = false

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
        Citizen.Wait(0)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end

    ESX.PlayerData = ESX.GetPlayerData()
    ESXLoaded = true
end)
RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function()
    TriggerEvent('ev-inventory:refreshInventory')
end)



RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job
end)

local dropSecondaryInventory = {
    type = 'drop',
    owner = 'x123y123z123'
}

local gloveBoxSecondaryInventory = {
    type = 'glovebox',
    owner = 'XYZ123'
}

local isInInventory = false

RegisterNUICallback('NUIFocusOff', function(data)
    closeInventory()
end)

RegisterCommand('hideinv', function(source, args, raw)
    closeInventory()
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlJustReleased(0, Config.OpenControl) and IsInputDisabled(0) then
            local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1)))
            local _, floorZ = GetGroundZFor_3dCoord(x, y, z)
            local playerPed = PlayerPedId()
            local vehicle = GetVehiclePedIsIn(playerPed)
            if DoesEntityExist(vehicle) then
                gloveBoxSecondaryInventory.owner = GetVehicleNumberPlateText(vehicle)
                openInventory(gloveBoxSecondaryInventory)
            else
                dropSecondaryInventory.owner = getOwnerFromCoords(vector3(x, y, floorZ))
                openInventory(dropSecondaryInventory)
            end
        end
    end
end
)

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        closeInventory()
    end
end)

AddEventHandler('onResourceStart', function(resource)
    if resource ~= GetCurrentResourceName() then return end
    TriggerServerEvent('ev-inventory:deleteNilInventory')
end)

RegisterNetEvent('InventoryAnim')
AddEventHandler('InventoryAnim', function()
    if not Config.OpenAnim then return end
    loadAnimDict('pickup_object')
    TaskPlayAnim(PlayerPedId(),'pickup_object', 'putdown_low',5.0, 1.5, 1.0, 48, 0.0, 0, 0, 0)
    Wait(1000)
    ClearPedSecondaryTask(PlayerPedId())
end)

function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end
