Citizen.CreateThread(function()
    TriggerEvent('disc-inventoryhud:RegisterInventory', {
        name = 'stash',
        label = _U('stash'),
        slots = 50
    })
end)

Citizen.CreateThread(function()
    TriggerEvent('disc-inventoryhud:RegisterInventory', {
        name = 'case',
        label = _U('policecase'),
        slots = 15
    })
end)