Citizen.CreateThread(function()
    TriggerEvent('ev-inventory:RegisterInventory', {
        name = 'glovebox',
        label = _U('glove'),
        slots = 5
    })
end)
