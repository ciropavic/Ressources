Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

isHandcuffed = false
cuffType = 1
isEscorted = false
draggerId = 0

databankOpen = false

Citizen.CreateThread(function()
    for k, station in pairs(Config.Locations["stations"]) do
        local blip = AddBlipForCoord(station.coords.x, station.coords.y, station.coords.z)
        SetBlipSprite(blip, 566)
        SetBlipAsShortRange(blip, true)
        SetBlipScale(blip, 0.8)
        SetBlipColour(blip, 17)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(station.label)
        EndTextCommandSetBlipName(blip)
    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(playerData)
    isHandcuffed = false
    TriggerServerEvent("mecanico:server:SetHandcuffStatus", false)
    TriggerServerEvent("mecanico:server:UpdateBlips")
    TriggerServerEvent("mecanico:server:UpdateCurrentCops")
    TriggerServerEvent("mecanico:server:CheckBills")

    if DutyBlips ~= nil then 
        for k, v in pairs(DutyBlips) do
            RemoveBlip(v)
        end
    end
    DutyBlips = {}
end)


local tabletProp = nil
RegisterNetEvent('mecanico:client:toggleDatabank')
AddEventHandler('mecanico:client:toggleDatabank', function()
    databankOpen = not databankOpen
    if databankOpen then
        RequestAnimDict("amb@code_human_in_bus_passenger_idles@female@tablet@base")
        while not HasAnimDictLoaded("amb@code_human_in_bus_passenger_idles@female@tablet@base") do
            Citizen.Wait(0)
        end
        local tabletModel = GetHashKey("prop_cs_tablet")
        local bone = GetPedBoneIndex(GetPlayerPed(-1), 60309)
        RequestModel(tabletModel)
        while not HasModelLoaded(tabletModel) do
            Citizen.Wait(100)
        end
        tabletProp = CreateObject(tabletModel, 1.0, 1.0, 1.0, 1, 1, 0)
        AttachEntityToEntity(tabletProp, GetPlayerPed(-1), bone, 0.03, 0.002, -0.0, 10.0, 160.0, 0.0, 1, 0, 0, 0, 2, 1)
        TaskPlayAnim(GetPlayerPed(-1), "amb@code_human_in_bus_passenger_idles@female@tablet@base", "base", 3.0, 3.0, -1, 49, 0, 0, 0, 0)
        SetNuiFocus(true, true)
        SendNUIMessage({
            type = "databank",
        })
    else
        DetachEntity(tabletProp, true, true)
        DeleteObject(tabletProp)
        TaskPlayAnim(GetPlayerPed(-1), "amb@code_human_in_bus_passenger_idles@female@tablet@base", "exit", 3.0, 3.0, -1, 49, 0, 0, 0, 0)
        SetNuiFocus(false, false)
        SendNUIMessage({
            type = "closedatabank",
        })
    end
end)


RegisterNUICallback("closeDatabank", function(data, cb)
    databankOpen = false
    DetachEntity(tabletProp, true, true)
    DeleteObject(tabletProp)
    SetNuiFocus(false, false)
    TaskPlayAnim(GetPlayerPed(-1), "amb@code_human_in_bus_passenger_idles@female@tablet@base", "exit", 3.0, 3.0, -1, 49, 0, 0, 0, 0)
end)

AddEventHandler('playerDropped', function ()
    TriggerServerEvent('mecanico:server:UpdateBlips')
    TriggerServerEvent("mecanico:server:SetHandcuffStatus", false)
    TriggerServerEvent("mecanico:server:UpdateCurrentCops")
    isHandcuffed = false
    isEscorted = false
    ClearPedTasks(GetPlayerPed(-1))
    DetachEntity(GetPlayerPed(-1), true, false)
    if DutyBlips ~= nil then 
        for k, v in pairs(DutyBlips) do
            RemoveBlip(v)
        end
        DutyBlips = {}
    end
end)


local DutyBlips = {}
RegisterNetEvent('mecanico:client:UpdateBlips')
AddEventHandler('mecanico:client:UpdateBlips', function(players)

    if DutyBlips ~= nil then 
        for k, v in pairs(DutyBlips) do
            RemoveBlip(v)
        end
    end
    DutyBlips = {}

    while ESX == nil or ESX.PlayerData.job == nil do Wait(1) end

    if (ESX.PlayerData.job ~= nil and players[GetPlayerServerId(PlayerId())]) and (ESX.PlayerData.job.name == 'mechanic' or ESX.PlayerData.job.name == 'ambulance') then
        if players ~= nil then
            for k, data in pairs(players) do
                local id = GetPlayerFromServerId(data.source)
                if NetworkIsPlayerActive(id) then
                    if data.job.name == 'mechanic' then
                        CreateDutyBlips(id, 'Officer | ' .. GetPlayerName(id), data.job.name)
                    elseif data.job.name == 'ambulance' then
                        CreateDutyBlips(id, 'Paramedic | ' .. GetPlayerName(id), data.job.name)
                    end
                end
            end
        end
	end
end)

function CreateDutyBlips(playerId, playerLabel, job)
	local ped = GetPlayerPed(playerId)
	local blip = GetBlipFromEntity(ped)
	if not DoesBlipExist(blip) then
		blip = AddBlipForEntity(ped)
		SetBlipSprite(blip, 1)
		ShowHeadingIndicatorOnBlip(blip, true)
		SetBlipRotation(blip, math.ceil(GetEntityHeading(ped)))
        SetBlipScale(blip, 0.8)
        SetBlipShowCone(blip, true)
        if job == "mechanic" then
            SetBlipColour(blip, 38)
        else
            SetBlipColour(blip, 5)
        end
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString(playerLabel)
        EndTextCommandSetBlipName(blip)
		
		table.insert(DutyBlips, blip)
	end
end


RegisterNetEvent('mecanico:PlaySound')
AddEventHandler('mecanico:PlaySound', function()
    PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
end)

RegisterNetEvent('mecanico:client:mecanicoEmergencyAlert')
AddEventHandler('mecanico:client:mecanicoEmergencyAlert', function(callsign, streetLabel, coords)
    if (ESX.PlayerData.job.name == 'mechanic' or ESX.PlayerData.job.name == 'ambulance') then
        local transG = 250
        local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
        SetBlipSprite(blip, 487)
        SetBlipColour(blip, 4)
        SetBlipDisplay(blip, 4)
        SetBlipAlpha(blip, transG)
        SetBlipScale(blip, 1.2)
        SetBlipFlashes(blip, true)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString("Assistance colleague")
        EndTextCommandSetBlipName(blip)
        while transG ~= 0 do
            Wait(180 * 4)
            transG = transG - 1
            SetBlipAlpha(blip, transG)
            if transG == 0 then
                SetBlipSprite(blip, 2)
                RemoveBlip(blip)
                return
            end
        end
    end
end)

RegisterNetEvent('mecanico:server:SendEmergencyMessageCheck')
AddEventHandler('mecanico:server:SendEmergencyMessageCheck', function(MainPlayer, message, coords)
    local PlayerData = ESX.GetPlayerData()
    if ((PlayerData.job.name == "mechanic" or PlayerData.job.name == "ambulance")) then
        TriggerEvent('chatMessage', "112 MELDING - " .. MainPlayer.PlayerData.charinfo.firstname .. " " .. MainPlayer.PlayerData.charinfo.lastname .. " ("..MainPlayer.PlayerData.source..")", "warning", message)
        TriggerEvent("mecanico:client:EmergencySound")
        local transG = 250
        local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
        SetBlipSprite(blip, 280)
        SetBlipColour(blip, 4)
        SetBlipDisplay(blip, 4)
        SetBlipAlpha(blip, transG)
        SetBlipScale(blip, 0.9)
        SetBlipAsShortRange(blip, false)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString("112 Melding")
        EndTextCommandSetBlipName(blip)
        while transG ~= 0 do
            Wait(180 * 4)
            transG = transG - 1
            SetBlipAlpha(blip, transG)
            if transG == 0 then
                SetBlipSprite(blip, 2)
                RemoveBlip(blip)
                return
            end
        end
    end
end)

RegisterNetEvent('mecanico:client:SendToJail')
AddEventHandler('mecanico:client:SendToJail', function(time)
    TriggerServerEvent("mecanico:server:SetHandcuffStatus", false)
    isHandcuffed = false
    isEscorted = false
    ClearPedTasks(GetPlayerPed(-1))
    DetachEntity(GetPlayerPed(-1), true, false)
    TriggerEvent("prison:client:Enter", time)
end)

function RadarSound()
    PlaySoundFrontend( -1, "Beep_Green", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1 )
    Citizen.Wait(100)
    PlaySoundFrontend( -1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1 )
    Citizen.Wait(100)
    PlaySoundFrontend( -1, "Beep_Green", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1 )
    Citizen.Wait(100)
    PlaySoundFrontend( -1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1 )
    Citizen.Wait(100)   
end

function GetClosestPlayer()
    local coords = GetEntityCoords(PlayerPedId())
	return ESX.Game.GetClosestPlayer(coords)
end

function DrawText3D(x,y,z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local p = GetGameplayCamCoords()
    local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
    local scale = (1 / distance) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov
    if onScreen then
        SetTextScale(0.3, 0.3)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextOutline()
        SetTextColour(255, 255, 255, 215)
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
        --local factor = (string.len(text)) / 370
		--DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 100)
      end
  end

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(10)
    end
end 

RegisterNetEvent('impound')
AddEventHandler('impound', function()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local vehicle = ESX.Game.GetClosestVehicle(coords)
    if not IsPedInAnyVehicle(ped, false) and DoesEntityExist(vehicle) and ( Vdist2(GetEntityCoords(vehicle), coords) < 5 ) then
        TaskStartScenarioInPlace(ped, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
        local finished = exports["taskbar"]:taskBar(5000,"Impound")
        ClearPedTasks(playerPed)

        if ( Vdist2(GetEntityCoords(vehicle), coords) < 5 ) then
            TriggerServerEvent("mecanico:server:impound", GetVehicleNumberPlateText(vehicle))
            TriggerEvent('notification', "Impound Successful.", 1) 
            ESX.Game.DeleteVehicle(vehicle)
            Wait(500)

            if DoesEntityExist(vehicle) then
                DeleteVehicle(vehicle)
            end
        else
            TriggerEvent('notification', "Where is the fucking vehicle?", 2) 
        end

    else
        TriggerEvent('notification', "No vehicle nearby.", 2) 
    end
end)
