ESX              = nil
local PlayerData = {}

Citizen.CreateThread(function()
        while ESX == nil do
                TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
                Citizen.Wait(0)
        end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if NetworkIsSessionStarted() then
            Citizen.Wait(500)
            TriggerEvent("multicharacter:client:WelcomePage")
            TriggerEvent("multicharacter:client:SetupCharacters")
            return -- break the loop
        end
    end
end)

local cam = nil
local cam2 = nil


RegisterCommand('logout', function(source)
    TriggerEvent("multicharacter:client:WelcomePage")
    TriggerEvent("multicharacter:client:SetupCharacters")
end)

RegisterNetEvent('multicharacter:client:loadDefaultModel')
AddEventHandler('multicharacter:client:loadDefaultModel', function()
        Citizen.CreateThread(function()
                while not HasModelLoaded('mp_m_freemode_01') do
                        RequestModel('mp_m_freemode_01')
                        Citizen.Wait(0)
                end

                SetPlayerModel(PlayerId(), 'mp_m_freemode_01')
                SetPedDefaultComponentVariation(PlayerPedId())

                SetModelAsNoLongerNeeded('mp_m_freemode_01')
    end)

end)

RegisterNetEvent('multicharacter:client:SetupCharacters')
AddEventHandler('multicharacter:client:SetupCharacters', function()
    FreezeEntityPosition(GetPlayerPed(-1), true)
    cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", 2672.53,1248.33,5.81, 0.00,0.00,10.00, 251.00, false, 0)
    SetCamActive(cam, true)
    RenderScriptCams(true, false, 1, true, true)
end)

RegisterNetEvent('multicharacter:client:WelcomePage')
AddEventHandler('multicharacter:client:WelcomePage', function()
    SetNuiFocus(true, true)
        SendNUIMessage({
        action = "openwelcome"
    })
end)

RegisterNetEvent('multicharacter:client:SetupUI')
AddEventHandler('multicharacter:client:SetupUI', function(Characters)
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = "openui",
        characters = Characters,
    })
end)

RegisterNetEvent('multicharacter:client:SpawnCharacter')
AddEventHandler('multicharacter:client:SpawnCharacter', function(spawn, isnew)
    TriggerServerEvent('es:firstJoinProper')
    TriggerEvent('es:allowedToSpawn')

 if isnew == 'true' then
    TriggerEvent('spawnselector:setNui',spawn)
 else
    local pos = spawn
    SetEntityCoords(GetPlayerPed(-1), pos.x, pos.y, pos.z)
        SetEntityCoords(GetPlayerPed(-1), pos.x, pos.y, pos.z)
    DoScreenFadeIn(500)
    Citizen.Wait(500)
    cam2 = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA",  2672.53,1248.33,5.81, 300.00,0.00,0.00, 100.00, false, 0)
    PointCamAtCoord(cam2, pos.x,pos.y,pos.z+200)
    SetCamActiveWithInterp(cam2, cam, 900, true, true)
	Citizen.Wait(900)
	TriggerEvent('esx_identity:showRegisterIdentity')
	Citizen.Wait(1000)
    exports.spawnmanager:setAutoSpawn(false)
    cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", pos.x,pos.y,pos.z+200, 300.00,0.00,0.00, 100.00, false, 0)
    PointCamAtCoord(cam, pos.x,pos.y,pos.z+2)
    SetCamActiveWithInterp(cam, cam2, 3700, true, true)
    Citizen.Wait(3700)
    PlaySoundFrontend(-1, "Zoom_Out", "DLC_HEIST_PLANNING_BOARD_SOUNDS", 1)
    RenderScriptCams(false, true, 500, true, true)
    PlaySoundFrontend(-1, "CAR_BIKE_WHOOSH", "MP_LOBBY_SOUNDS", 1)
    FreezeEntityPosition(GetPlayerPed(-1), false)
    Citizen.Wait(500)
        SetEntityCoords(GetPlayerPed(-1), pos.x, pos.y, pos.z)
    SetCamActive(cam, false)
    DestroyCam(cam, true)
    IsChoosing = false
    DisplayHud(true)
    DisplayRadar(true)
    end
end)

RegisterNetEvent('multicharacter:client:ReloadCharacters')
AddEventHandler('multicharacter:client:ReloadCharacters', function()
    TriggerServerEvent("multicharacter:server:SetupCharacters")
    TriggerEvent("multicharacter:client:SetupCharacters")
end)

RegisterNUICallback("CharacterChosen", function(data, cb)
    SetNuiFocus(false,false)
    TriggerServerEvent('multicharacter:server:CharacterChosen', data.charid, data.ischar, data.spawnid or "1")
    cb("ok")
end)

RegisterNUICallback("DeleteCharacter", function(data, cb)
    SetNuiFocus(false,false)
    TriggerServerEvent('multicharacter:server:DeleteCharacter', data.charid)
    cb("ok")
end)

RegisterNUICallback("ShowSelection", function(data, cb)
        TriggerServerEvent("multicharacter:server:SetupCharacters")
end)