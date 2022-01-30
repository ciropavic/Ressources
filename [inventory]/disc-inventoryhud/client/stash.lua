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
        }
        TriggerEvent('disc-base:registerMarker', marker)
    end
end)

-- Police Storage
local PoliceSecondaryInventory = {
    type = 'stash',
    owner = 'Police',
} 

RegisterNetEvent('inventory:Police')
AddEventHandler('inventory:Police', function()
    openInventory(PoliceSecondaryInventory)
end)

-- Police Cases
local PoliceCaseInventory = {
    type = 'case',
    owner = 'Case Number',
} 

RegisterNetEvent('inventory:PoliceCase')
AddEventHandler('inventory:PoliceCase', function(CaseNumber)
    PoliceCaseInventory.owner = 'Case Number ' .. CaseNumber .. ''
    openInventory(PoliceCaseInventory)
end)

-- Vagos Storage
local VagosSecondaryInventory = {
    type = 'stash',
    owner = 'Vagos',
}

  
RegisterNetEvent('inventory:Vagos')
AddEventHandler('inventory:Vagos', function()
    openInventory(VagosSecondaryInventory)
end)

-- Bloods Storage
local BloodsSecondaryInventory = {
    type = 'stash',
    owner = 'Bloods',
}

  
RegisterNetEvent('inventory:Bloods')
AddEventHandler('inventory:Bloods', function()
    openInventory(BloodsSecondaryInventory)
end)

-- blackmarket Storage
local BlackmarketSecondaryInventory = {
    type = 'stash',
    owner = 'Blackmarket',
}

  
RegisterNetEvent('inventory:Blackmarket')
AddEventHandler('inventory:Blackmarket', function()
    openInventory(BlackmarketSecondaryInventory)
end)


-- bloods Storage
local BloodsSecondaryInventory = {
    type = 'stash',
    owner = 'Bloods',
} 

RegisterNetEvent('inventory:Bloods')
AddEventHandler('inventory:Bloods', function()
    openInventory(BloodsSecondaryInventory)
end)

-- Ballas Storage
local BallasSecondaryInventory = {
    type = 'stash',
    owner = 'Ballas',
}

  
RegisterNetEvent('inventory:Ballas')
AddEventHandler('inventory:Ballas', function()
    openInventory(BallasSecondaryInventory)
end)

-- Grove Storage
local GroveSecondaryInventory = {
    type = 'stash',
    owner = 'Grove St.',
}


  
RegisterNetEvent('inventory:Grove')
AddEventHandler('inventory:Grove', function()
    openInventory(GroveSecondaryInventory)
end)

-- Mechanic Storage
local MechSecondaryInventory = {
    type = 'stash',
    owner = 'Mechanic',
}

  
RegisterNetEvent('inventory:Mech')
AddEventHandler('inventory:Mech', function()
    openInventory(MechSecondaryInventory)
end)

-- Motel Storage
local MotelSecondaryInventory = {
    type = 'stash',
    owner = 'Motel',
}

  
RegisterNetEvent('inventory:Motel')
AddEventHandler('inventory:Motel', function(owner)
    MotelSecondaryInventory.owner = owner
    openInventory(MotelSecondaryInventory)
end)

-- Motel Bed Storage
local MotelBedSecondaryInventory = {
    type = 'stash',
    owner = 'Motel Bed',
}

  
RegisterNetEvent('inventory:MotelBed')
AddEventHandler('inventory:MotelBed', function(owner)
    MotelBedSecondaryInventory.owner = owner
    openInventory(MotelBedSecondaryInventory)
end)


RegisterNetEvent('inventory:stash')
AddEventHandler('inventory:stash', function(ow)
    local Stash = { type = 'stash', owner = ow }
    openInventory(Stash)
end)