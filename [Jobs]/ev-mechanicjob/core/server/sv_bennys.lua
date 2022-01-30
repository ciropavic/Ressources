local ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

--local repairCost = vehicleBaseRepairCost
local repairCost = 0

RegisterServerEvent("mechanic:updateRepairCost")
AddEventHandler("mechanic:updateRepairCost", function(price)
   -- repairCost = price
end)

RegisterServerEvent("mechanic:attemptPurchase")
AddEventHandler("mechanic:attemptPurchase", function(type, upgradeLevel)
    local player = ESX.GetPlayerFromId(source)
    local price = 0

    if type then
        if type == 'repair' then
            price = 0
        elseif upgradeLevel then
            price = vehicleCustomisationPrices[type].prices[upgradeLevel]
        else
            price = vehicleCustomisationPrices[type].price
        end
    end

    if player.getMoney() >= price then
        TriggerClientEvent("mechanic:purchaseSuccessful", source)
        player.removeMoney(price)
    else
        TriggerClientEvent("mechanic:purchaseFailed", source)
    end
end)

RegisterServerEvent('mechanic:refreshVehicle')
AddEventHandler('mechanic:refreshVehicle', function(vehicleProps)
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.execute('UPDATE owned_vehicles SET vehicle = @vehicle WHERE plate = @plate', {
		['@plate'] = vehicleProps.plate,
		['@vehicle'] = json.encode(vehicleProps)
	})
end)