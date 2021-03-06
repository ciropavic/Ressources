local truckplate = false
local truckcoords
local inTruck
local missionBlip = nil
local binCoords = false
local maxruns = 0
local runs = 0
local arrived 
local jobBlip
local submitBlip
ESX = nil
local submitCoords = vector3(-1722.66,583.67,2.72)
local clockRoom = vector3(-1731.78,571.79, 2.72)
local doingGarbage = false
local jobCompleted = false
local garbageHQBlip = 0
local truckTaken = false

local JobCoords = {
    {x = -1169.07, y = 548.66,z = 2.92},
    {x = 1627.12, y = 1355.75,z = 25.42},
    {x = -865.92, y = 1885,75 ,z =20.63},
    {x = -1266.08, y = 2558.69,z = 27.08},
    {x = -1038.3, y = 1166.75,z = 4.5},
    {x = -372.08, y = 2043.96,z = 14.37},
    {x = -104.93, y = 2464.56, z =20.42},
    {x = 167.49,  y =1500.74,z = 14.7},
    {x = -330.14, y = 1080.61,z =13.97},
    {x = 317.33, y = 538.97,z = 8.09},
    {x = -88.58,y = 186.42,z = 14.75},
    {x = 1033.9,y = 221.01,z = 14.23},
    {x = 1523.64,y = 867.97,z = 24.71},
    {x = 1632.4,y = 1474.8,z = 28.79},
    {x =1920.18,y = 1595.59,z = 25.72},
    {x = 786.84,y =2209.06,z = 14.26},
    {x = 366.79,y = 2655.82,z = 17.77},
    {x = 1428.22,y = 2482.98,z = 16.68},
}

local Dumpsters = {
    "prop_dumpster_01a",
    "prop_dumpster_02a",
    "prop_dumpster_02b",
    "prop_dumpster_3a",
    "prop_dumpster_4a",
    "prop_dumpster_4b",
    "prop_skip_01a",
    "prop_skip_02a",
    "prop_skip_06a",
    "prop_skip_05a",
    "prop_skip_03",
    "prop_skip_10a"
}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end
	PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(2000)
        if ESX.PlayerData.job and ESX.PlayerData.job.name == 'garbage' then
            havingGarbageJob = true
            if garbageHQBlip == nil or garbageHQBlip == 0 then
                garbageHQBlip = AddBlipForCoord(clockRoom)
                SetBlipSprite(garbageHQBlip, 318)
                SetBlipDisplay(garbageHQBlip, 4)
                SetBlipScale(garbageHQBlip, 1.0)
                SetBlipColour(garbageHQBlip, 25)
                SetBlipAsShortRange(garbageHQBlip, false)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString("Basurero LibertyCity")
                EndTextCommandSetBlipName(garbageHQBlip)
            end    
        else
            havingGarbageJob = false
            if garbageHQBlip ~= nil or garbageHQBlip ~= 0 then
                RemoveBlip(garbageHQBlip)
                garbageHQBlip = 0
            end
        end
    end
end)


Citizen.CreateThread(function() 
    local wait = 100
    while true do 
        Citizen.Wait(wait)
        if havingGarbageJob then
            local playerPed = GetPlayerPed(-1)
            local plyCoords = GetEntityCoords(playerPed)
            local distance = GetDistanceBetweenCoords(plyCoords, clockRoom, true)
            local vehicleCoords = vector3(-1727.07, 584.17, 2.72)
            local heading = 0.07
            if distance < 20 then
                wait = 5
                DrawMarker(2, clockRoom, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 0, 0, 150, false, true, 2, false, false, false, false)
                if distance < 1.5 then
                    ESX.ShowHelpNotification("Presiona ~INPUT_CONTEXT~ Comenzar trabajo", true, true, 5000)
                    if IsControlJustReleased(1,46) then
                        if not truckTaken then 
                            if ESX.Game.IsSpawnPointClear(vehicleCoords, 5) then
                                truckTaken = true
                                local random = math.random(1, #JobCoords)
                                local coordVec = vector3(JobCoords[random].x, JobCoords[random].y, JobCoords[random].z)
                                inTruck = false
                                ESX.Game.SpawnVehicle("trash", vehicleCoords, heading , function(vehicle)
                                    truckplate = GetVehicleNumberPlateText(vehicle)
                                    truckcoords = GetEntityCoords(vehicle)
                                    Citizen.CreateThread(function() 
                                        while not inTruck do 
                                            Citizen.Wait(5)
                                            DrawMarker(2, truckcoords + vector3(0.0,0.0,3.5), 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 0, 0, 150, false, true, 2, false, false, false, false)
                                            if IsPedInAnyVehicle(GetPlayerPed(-1)) then
                                                local truck = GetVehiclePedIsIn(GetPlayerPed(-1),false)
                                                if truck == vehicle then
                                                    inTruck = true
                                                    Citizen.Wait(1000)
                                                    missionStart(coordVec,vehicle)
                                                    TriggerEvent('ndrp_carkeys:carkeys', vehicle)
                                                end
                                            end
                                        end
                                    end)
                                end)
                            else
                                exports['mythic_notify']:SendAlert('inform', 'Por favor, borre el punto de generaci??n.')
                            end
                        else
                            exports['mythic_notify']:SendAlert('inform', 'Ya tomaste un cami??n para el trabajo')
                        end
                    end
                end
            end
        end
    end
end)

function submit()
    Citizen.CreateThread(function()
        local pressed = false
        local wait = 100
        while true do
            Citizen.Wait(wait)
            local playerPed = GetPlayerPed(-1)
            local plyCoords = GetEntityCoords(playerPed)
            local distance = GetDistanceBetweenCoords(plyCoords,submitCoords, true) 
            if distance < 20 then
                wait = 5
                if IsPedInAnyVehicle(playerPed) then
                    DrawMarker(2, submitCoords+vector3(0.0,0.0,2.0), 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 0, 0, 150, false, true, 2, false, false, false, false)
                    local truck = GetVehiclePedIsIn(playerPed, false)
                    local plate = GetVehicleNumberPlateText(truck)
                    if distance < 2.0 then
                        ESX.ShowHelpNotification("Presiona ~INPUT_CONTEXT~ tirar la basura", true, true, 5000)
                        if IsControlJustReleased(1,46) and not pressed then
                            truckTaken = false
                            pressed = true
                            RemoveBlip(submitBlip)
                            if plate == truckplate then
                                jobCompleted = true
                                exports['progressBars']:startUI(5000, "Dropping off trash")
                                TriggerServerEvent('ndrp-garbage:pay',jobCompleted)
                                jobCompleted = false
                                ESX.Game.DeleteVehicle(truck)
                                for i=1,200,1 do 
                                    if DoesEntityExist(truck) then
                                        ESX.Game.DeleteVehicle(truck)
                                    else
                                        truckplate = false
                                        truckTaken = false
                                        return
                                    end
                                end
                                truckplate = false
                                Citizen.Wait(1000)
                                pressed = false    
                                return
                            else
                                exports['mythic_notify']:SendAlert('error', 'Este no es nuestro veh??culo.')
                                Citizen.Wait(1000)
                                pressed = false
                            end
                            Citizen.Wait(1000)
                            pressed = false
                        end
                    end
                end
            else
                wait = 100
            end
        end
    end)
end

function missionStart(coordVec,xtruck)
    local vehicle = xtruck
    arrived = false
    missionBlip = AddBlipForCoord(coordVec)
    SetBlipRoute(missionBlip, true)
    SetBlipRouteColour(missionBlip, 25)
    SetBlipColour(missionBlip, 25)
    Citizen.CreateThread(function()
        local wait = 100
        while not arrived do
            Citizen.Wait(wait)
            local tempdist = GetDistanceBetweenCoords(coordVec, GetEntityCoords(GetPlayerPed(-1)),true)
            if  tempdist < 50 then
                wait = 5
                DrawMarker(20, coordVec + vector3(0.0,0.0,3.5), 0.0, 0.0, 0.0, 0, 0.0, 0.0, 2.0, 2.0, 1.0, 0, 120, 0, 200, false, true, 2, false, false, false, false)
                if tempdist < 2 then
                    arrived = true
                    maxruns  = math.random(6,10)
                    Citizen.Wait(1000)
                    SetBlipRoute(missionBlip, false)
                    RemoveBlip(missionBlip)
                    findtrashbins(coordVec,vehicle,0)
                end
            else
                wait = 100
            end
        end
    end)      
end

function findtrashbins(coordVec,xtruck,pickup)
    doingGarbage = true
    local location = coordVec
    local vehicle = xtruck
    local playerPed = GetPlayerPed(-1)
    local boneindex = GetPedBoneIndex(playerPed, 57005)
    runs = pickup

    if not HasAnimDictLoaded("anim@heists@narcotics@trash") then
        RequestAnimDict("anim@heists@narcotics@trash")
    end
    while not HasAnimDictLoaded("anim@heists@narcotics@trash") do
        Citizen.Wait(0)
    end

    if runs < maxruns then
        angle = math.random()*math.pi*2;
        r = math.sqrt(math.random());
        x = coordVec.x + r * math.cos(angle) * 100;     
        y = coordVec.y + r * math.sin(angle) * 100;
        for i = 0, #Dumpsters, 1 do 
            local NewBin = GetClosestObjectOfType(x, y, coordVec.z, 100.0, GetHashKey(Dumpsters[i]), false)
            if NewBin ~= 0 then
                local dumpCoords = GetEntityCoords(NewBin)
                jobBlip = AddBlipForCoord(dumpCoords)
                SetBlipSprite(jobBlip, 420)
                SetBlipScale (jobBlip, 0.8)
                SetBlipColour(jobBlip, 25)
                while true do
                    Wait(5) 
                    local userDist = GetDistanceBetweenCoords(dumpCoords,GetEntityCoords(GetPlayerPed(-1)),true) 
                    if userDist < 20 then
                        DrawMarker(20, dumpCoords + vector3(0.0,0.0,2.5), 0.0, 0.0, 0.0, 0, 0.0, 0.0, 2.0, 2.0, 1.0, 0, 120, 0, 200, false, true, 2, false, false, false, false)
                        if userDist < 2 then
                            ESX.ShowHelpNotification("Presiona ~INPUT_CONTEXT~ recoger basura", true, true, 5000)
                            if IsControlJustReleased(1,46) then
                                local geeky = CreateObject(GetHashKey("hei_prop_heist_binbag"), 0, 0, 0, true, true, true)
                                AttachEntityToEntity(geeky, playerPed, boneindex, 0.12, 0.0, 0.00, 25.0, 270.0, 180.0, true, true, false, true, 1, true)
                                TaskPlayAnim(PlayerPedId(-1), 'anim@heists@narcotics@trash', 'walk', 1.0, -1.0,-1,49,0,0, 0,0)
                                RemoveBlip(jobBlip)
                                collectedtrash(geeky,vehicle,location,runs)
                                return
                            end
                        end
                    end
                end
                return
            end
        end
    else
        submit()
        doingGarbage = false
        exports['mythic_notify']:SendAlert('inform', '??Trabajo hecho! Regresar a la sede',10000)
        submitBlip = AddBlipForCoord(submitCoords)
        SetBlipColour(submitBlip, 25)
    end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        if havingGarbageJob then
            if not IsPedInAnyVehicle(GetPlayerPed(-1)) then
                if doingGarbage then
                    DisplayRadar(true)
                else
                    DisplayRadar(false)
                end
            end
        end
    end
end)

local trashCollected = false

function collectedtrash(geeky,vehicle,location,pickup)
    local wait = 100
    local trashbag = geeky
    local pressed = false
    while true do
        Wait(wait)
        local trunkcoord = GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, "platelight"))
        local tdistance = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),trunkcoord)
        local runs = pickup
        if tdistance < 20 then
            wait = 5
            DrawMarker(20, trunkcoord + vector3(0.0,0.0,0.5), 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 0, 120, 0, 200, false, true, 2, false, false, false, false)
            if tdistance < 2 then
                ESX.ShowHelpNotification("Presiona ~INPUT_CONTEXT~ tirar basura", true, true, 5000)
                if IsControlJustReleased(1, 46) and not pressed then
                    pressed = true
                    local dropChance = math.random(1,4)
                    if dropChance > 1 then
                        local randomChance = math.random(1,100)
                        trashCollected  = true
                        local item = 'basura'
                        if randomChance < 20 then
                            item = 'basura'
                        elseif randomChance > 20 and randomChance < 40 then
                            item = 'basura'
                        elseif randomChance > 40 and randomChance < 50 then
                            item = 'glass'
                        elseif randomChance > 50 and randomChance < 52 then
                            item = 'basura'
                        elseif randomChance > 52 and randomChance < 80 then
                            item = 'glass'
                        elseif randomChance == 81 then  
                            item = 'WEAPON_PISTOL'
                        elseif randomChance > 81 and randomChance < 90 then
                            item = 'basura'
                        elseif randomChance > 90 and randomChance < 95 then
                            item = 'jewels'
                        elseif randomChance > 95 and randomChance < 97 then
                            item = 'basura'
                        else
                            item = 'basura'
                        end
                        TriggerServerEvent('ndrp-garbage:reward',item,trashCollected)
                        trashCollected = false
                    end
                    ClearPedTasksImmediately(GetPlayerPed(-1))
					TaskPlayAnim(GetPlayerPed(-1), 'anim@heists@narcotics@trash', 'throw_b', 1.0, -1.0,-1,2,0,0, 0,0)
                    Citizen.Wait(100)
                    DeleteObject(trashbag)
                    Citizen.Wait(3000)
                    ClearPedTasksImmediately(GetPlayerPed(-1))
                    findtrashbins(location,vehicle,runs+1)
                    pressed = false
                    return
                end
            end
        end
    end
end