local serverDrops = {}
local drops = {}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        local coords = GetEntityCoords(GetPlayerPed(-1))
        for k, v in pairs(serverDrops) do
            local dropCoords = getCoordsFromOwner(k)
            if GetDistanceBetweenCoords(dropCoords.x, dropCoords.y, dropCoords.z, coords.x, coords.y, coords.z, true) < 20 then
               if drops[k] then
                    drops[k].active = true
                else
                    drops[k] = {
                        name = k,
                        coords = dropCoords,
                        active = true
                    }
                end
            end
        end

        for k, v in pairs(drops) do
            if v.active then
                local x, y, z = table.unpack(v.coords)
                local marker = {
                    name = v.name .. '_drop',
                    type = 2,
                    coords = vector3(x, y, z + 1.0),
                    rotate = true,
                    colour = { r = 255, b = 255, g = 255 },
                    size = vector3(0.3, 0.3, 0.3),
                }
                drops[k].active = false
                TriggerEvent('disc-base:registerMarker', marker)
            else
                TriggerEvent('disc-base:removeMarker', v.name .. '_drop')
                drops[k] = nil
            end
        end
    end
end)

RegisterNetEvent('ev-inventory:updateDrops')
AddEventHandler('ev-inventory:updateDrops', function(newDrops)
    print('Receive Drops')
    serverDrops = newDrops
end)