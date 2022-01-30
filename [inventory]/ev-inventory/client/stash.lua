local stashSecondaryInventory = {
    type = 'stash',
    owner = ''
}

Citizen.CreateThread(function()
    while not ESXLoaded do
        Citizen.Wait(10)
    end
    for k, v in pairs(Config.Stash) do
        local marker = {
            name = k,
            type = v.markerType or 1,
            coords = v.coords,
            colour = v.markerColour or { r = 55, b = 255, g = 55 },
            size = v.size or vector3(0.5, 0.5, 1.0),
            action = function()
                stashSecondaryInventory.owner = k
                openInventory(stashSecondaryInventory)
            end,
            shouldDraw = function()
                return ESX.PlayerData.job.name == v.job or v.job == 'all'
            end,
            msg = v.msg or _U('keystash'),
            show3D = v.show3D or false,
        }
        TriggerEvent('disc-base:registerMarker', marker)
    end
end)

-- Motel Storage
local MotelSecondaryInventory = {
    type = 'stash',
    owner = 'Motel',
}

  
RegisterNetEvent('ev-inventory:Motel')
AddEventHandler('ev-inventory:Motel', function(owner)
    MotelSecondaryInventory.owner = owner
    openInventory(MotelSecondaryInventory)
end)

-- Motel Bed Storage
local MotelBedSecondaryInventory = {
    type = 'stash',
    owner = 'Motel Bed',
}

  
RegisterNetEvent('ev-inventory:MotelBed')
AddEventHandler('ev-inventory:MotelBed', function(owner)
    MotelBedSecondaryInventory.owner = owner
    openInventory(MotelBedSecondaryInventory)
end)