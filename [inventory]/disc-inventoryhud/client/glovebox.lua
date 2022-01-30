local gloveBoxSecondaryInventory = {
    type = 'glovebox',
    owner = 'XYZ123'
}

RegisterNetEvent('gloveBox:open')
AddEventHandler('gloveBox:open', function()
        local playerPed = GetPlayerPed(-1)
        local vehicle = GetVehiclePedIsIn(playerPed)
        gloveBoxSecondaryInventory.owner = GetVehicleNumberPlateText(vehicle)
        openInventory(gloveBoxSecondaryInventory)
end)