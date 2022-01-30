Citizen.CreateThread(function()
    TriggerEvent('ev-inventory:RegisterInventory', {
        name = 'stash',
        label = _U('stash'),
        slots = 100
    })
end)
