local ObjectList = {}

RegisterNetEvent('mecanico:client:spawnCone')
AddEventHandler('mecanico:client:spawnCone', function()
    Progressbar("spawn_object", "Place object..", 2500, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "anim@narcotics@trash",
        anim = "drop_front",
        flags = 16,
    }, {}, {}, function() -- Done
        StopAnimTask(GetPlayerPed(-1), "anim@narcotics@trash", "drop_front", 1.0)
        TriggerServerEvent("mecanico:server:spawnObject", "cone")
    end, function() -- Cancel
        StopAnimTask(GetPlayerPed(-1), "anim@narcotics@trash", "drop_front", 1.0)
        TriggerEvent('notification', "Canceled..", 2)
    end)
end)

RegisterNetEvent('mecanico:client:spawnBarier')
AddEventHandler('mecanico:client:spawnBarier', function()
    Progressbar("spawn_object", "Place object..", 2500, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "anim@narcotics@trash",
        anim = "drop_front",
        flags = 16,
    }, {}, {}, function() -- Done
        StopAnimTask(GetPlayerPed(-1), "anim@narcotics@trash", "drop_front", 1.0)
        TriggerServerEvent("mecanico:server:spawnObject", "barier")
    end, function() -- Cancel
        StopAnimTask(GetPlayerPed(-1), "anim@narcotics@trash", "drop_front", 1.0)
        TriggerEvent('notification', "Canceled..", 2)
    end)
end)

RegisterNetEvent('mecanico:client:spawnSchotten')
AddEventHandler('mecanico:client:spawnSchotten', function()
    Progressbar("spawn_object", "Place object..", 2500, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "anim@narcotics@trash",
        anim = "drop_front",
        flags = 16,
    }, {}, {}, function() -- Done
        StopAnimTask(GetPlayerPed(-1), "anim@narcotics@trash", "drop_front", 1.0)
        TriggerServerEvent("mecanico:server:spawnObject", "schotten")
    end, function() -- Cancel
        StopAnimTask(GetPlayerPed(-1), "anim@narcotics@trash", "drop_front", 1.0)
        TriggerEvent('notification', "Canceled..", 2)
    end)
end)

RegisterNetEvent('mecanico:client:spawnTent')
AddEventHandler('mecanico:client:spawnTent', function()
    Progressbar("spawn_object", "Place object..", 2500, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "anim@narcotics@trash",
        anim = "drop_front",
        flags = 16,
    }, {}, {}, function() -- Done
        StopAnimTask(GetPlayerPed(-1), "anim@narcotics@trash", "drop_front", 1.0)
        TriggerServerEvent("mecanico:server:spawnObject", "tent")
    end, function() -- Cancel
        StopAnimTask(GetPlayerPed(-1), "anim@narcotics@trash", "drop_front", 1.0)
        TriggerEvent('notification', "Canceled..", 2)
    end)
end)

RegisterNetEvent('mecanico:client:spawnLight')
AddEventHandler('mecanico:client:spawnLight', function()
    local coords = GetEntityCoords(GetPlayerPed(-1))
    Progressbar("spawn_object", "Place object..", 2500, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "anim@narcotics@trash",
        anim = "drop_front",
        flags = 16,
    }, {}, {}, function() -- Done
        StopAnimTask(GetPlayerPed(-1), "anim@narcotics@trash", "drop_front", 1.0)
        TriggerServerEvent("mecanico:server:spawnObject", "light")
    end, function() -- Cancel
        StopAnimTask(GetPlayerPed(-1), "anim@narcotics@trash", "drop_front", 1.0)
        TriggerEvent('notification', "Canceled..", 2)
    end)
end)

RegisterNetEvent('mecanico:client:deleteObject')
AddEventHandler('mecanico:client:deleteObject', function()
    local objectId, dist = GetClosestmecanicoObject()
    if dist < 5.0 then
        Progressbar("remove_object", "Remove Object..", 2500, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = "weapons@first_person@aim_rng@generic@projectile@thermal_charge@",
            anim = "plant_floor",
            flags = 16,
        }, {}, {}, function() -- Done
            StopAnimTask(GetPlayerPed(-1), "weapons@first_person@aim_rng@generic@projectile@thermal_charge@", "plant_floor", 1.0)
            TriggerServerEvent("mecanico:server:deleteObject", objectId)
        end, function() -- Cancel
            StopAnimTask(GetPlayerPed(-1), "weapons@first_person@aim_rng@generic@projectile@thermal_charge@", "plant_floor", 1.0)
            TriggerEvent('notification', "Canceled..", 2)
        end)
    end
end)

RegisterNetEvent('mecanico:client:removeObject')
AddEventHandler('mecanico:client:removeObject', function(objectId)
    NetworkRequestControlOfEntity(ObjectList[objectId].object)
    DeleteObject(ObjectList[objectId].object)
    ObjectList[objectId] = nil
    TriggerServerEvent("mecanico:server:setObjects",ObjectList)
end)

RegisterNetEvent('mecanico:client:spawnObject')
AddEventHandler('mecanico:client:spawnObject', function(objectId, type, player)
    local coords = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(player)))
    local heading = GetEntityHeading(GetPlayerPed(GetPlayerFromServerId(player)))
    local forward = GetEntityForwardVector(GetPlayerPed(-1))
    local x, y, z = table.unpack(coords + forward * 0.5)
    local spawnedObj = CreateObject(Config.Objects[type].model, x, y, z, false, false, false)
    PlaceObjectOnGroundProperly(spawnedObj)
    SetEntityHeading(spawnedObj, heading)
    FreezeEntityPosition(spawnedObj, Config.Objects[type].freeze)
    ObjectList[objectId] = {
        id = objectId,
        object = spawnedObj,
        coords = {
            x = x,
            y = y,
            z = z - 0.3,
        },
    }
    TriggerServerEvent("mecanico:server:setObjects",ObjectList)
end)


function GetClosestmecanicoObject()
    local pos = GetEntityCoords(GetPlayerPed(-1), true)
    local current = nil
    local dist = nil

    for id, data in pairs(ObjectList) do
        if current ~= nil then
            if(GetDistanceBetweenCoords(pos, ObjectList[id].coords.x, ObjectList[id].coords.y, ObjectList[id].coords.z, true) < dist)then
                current = id
                dist = GetDistanceBetweenCoords(pos, ObjectList[id].coords.x, ObjectList[id].coords.y, ObjectList[id].coords.z, true)
            end
        else
            dist = GetDistanceBetweenCoords(pos, ObjectList[id].coords.x, ObjectList[id].coords.y, ObjectList[id].coords.z, true)
            current = id
        end
    end
    return current, dist
end

local SpikeConfig = {
    MaxSpikes = 5
}
local SpawnedSpikes = {}
local spikemodel = "P_ld_stinger_s"
local nearSpikes = false
local spikesSpawned = false
local ClosestSpike = nil

Citizen.CreateThread(function()
    while true do

        if true then
            GetClosestSpike()
        end

        Citizen.Wait(500)
    end
end)

function GetClosestSpike()
    local pos = GetEntityCoords(GetPlayerPed(-1), true)
    local current = nil

    for id, data in pairs(SpawnedSpikes) do
        if current ~= nil then
            if(GetDistanceBetweenCoords(pos, SpawnedSpikes[id].coords.x, SpawnedSpikes[id].coords.y, SpawnedSpikes[id].coords.z, true) < dist)then
                current = id
            end
        else
            dist = GetDistanceBetweenCoords(pos, SpawnedSpikes[id].coords.x, SpawnedSpikes[id].coords.y, SpawnedSpikes[id].coords.z, true)
            current = id
        end
    end
    ClosestSpike = current
end

RegisterNetEvent('mecanico:client:SpawnSpikeStrip')
AddEventHandler('mecanico:client:SpawnSpikeStrip', function()
    if #SpawnedSpikes + 1 < SpikeConfig.MaxSpikes then
        if ESX.PlayerData.job.name == "mechanic" then
            local spawnCoords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0.0, 2.0, 0.0)
            local spike = CreateObject(GetHashKey(spikemodel), spawnCoords.x, spawnCoords.y, spawnCoords.z, 1, 1, 1)
            local netid = NetworkGetNetworkIdFromEntity(spike)
            SetNetworkIdExistsOnAllMachines(netid, true)
            SetNetworkIdCanMigrate(netid, false)
            SetEntityHeading(spike, GetEntityHeading(GetPlayerPed(-1)))
            PlaceObjectOnGroundProperly(spike)
            table.insert(SpawnedSpikes, {
                coords = {
                    x = spawnCoords.x,
                    y = spawnCoords.y,
                    z = spawnCoords.z,
                },
                netid = netid,
                object = spike,
            })
            spikesSpawned = true
            TriggerServerEvent('mecanico:server:SyncSpikes', SpawnedSpikes)
        end
    else
        TriggerEvent('notification', 'There is no spikestrips left..', 'error')
    end
end)

RegisterNetEvent('mecanico:client:SyncSpikes')
AddEventHandler('mecanico:client:SyncSpikes', function(table)
    SpawnedSpikes = table
end)

Citizen.CreateThread(function()
    while true do
        if true then
            if ClosestSpike ~= nil then
                local tires = {
                    {bone = "wheel_lf", index = 0},
                    {bone = "wheel_rf", index = 1},
                    {bone = "wheel_lm", index = 2},
                    {bone = "wheel_rm", index = 3},
                    {bone = "wheel_lr", index = 4},
                    {bone = "wheel_rr", index = 5}
                }

                for a = 1, #tires do
                    local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
                    local tirePos = GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, tires[a].bone))
                    local spike = GetClosestObjectOfType(tirePos.x, tirePos.y, tirePos.z, 15.0, GetHashKey(spikemodel), 1, 1, 1)
                    local spikePos = GetEntityCoords(spike, false)
                    local distance = Vdist(tirePos.x, tirePos.y, tirePos.z, spikePos.x, spikePos.y, spikePos.z)

                    if distance < 1.8 then
                        if not IsVehicleTyreBurst(vehicle, tires[a].index, true) or IsVehicleTyreBurst(vehicle, tires[a].index, false) then
                            SetVehicleTyreBurst(vehicle, tires[a].index, false, 1000.0)
                        end
                    end
                end
            end
        end

        Citizen.Wait(3)
    end
end)

Citizen.CreateThread(function()
    while true do
        if true then
            if ClosestSpike ~= nil then
                local ped = GetPlayerPed(-1)
                local pos = GetEntityCoords(ped)
                local dist = GetDistanceBetweenCoords(pos, SpawnedSpikes[ClosestSpike].coords.x, SpawnedSpikes[ClosestSpike].coords.y, SpawnedSpikes[ClosestSpike].coords.z, true)

                if dist < 4 then
                    if not IsPedInAnyVehicle(GetPlayerPed(-1)) then
                        if ESX.PlayerData.job.name == "mechanic" then
                            DrawText3D(pos.x, pos.y, pos.z, '[E] Remove spike')
                            if IsControlJustPressed(0, Keys["E"]) then
                                NetworkRegisterEntityAsNetworked(SpawnedSpikes[ClosestSpike].object)
                                NetworkRequestControlOfEntity(SpawnedSpikes[ClosestSpike].object)            
                                SetEntityAsMissionEntity(SpawnedSpikes[ClosestSpike].object)        
                                DeleteEntity(SpawnedSpikes[ClosestSpike].object)
                                table.remove(SpawnedSpikes, ClosestSpike)
                                ClosestSpike = nil
                                TriggerServerEvent('mecanico:server:SyncSpikes', SpawnedSpikes)
                            end
                        end
                    end
                end
            end
        end
        Citizen.Wait(3)
    end
end)

RegisterCommand('remove', function()
    TriggerEvent('mecanico:client:deleteObject')
end)

CreateThread(function()
    Wait(100)
    TriggerServerEvent("mecanico:server:wantObjects",ObjectList)
end)


RegisterNetEvent("mecanico:client:setObjects")
AddEventHandler("mecanico:client:setObjects", function(table)
    ObjectList = table
end)