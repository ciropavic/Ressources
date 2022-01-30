ESX             = nil
local ShopItems = {}
local hasSqlRun = false

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Load items
AddEventHandler('onMySQLReady', function()
	hasSqlRun = true
	LoadShop()
end)

-- extremely useful when restarting script mid-game
Citizen.CreateThread(function()
	Citizen.Wait(2000) -- hopefully enough for connection to the SQL server

	if not hasSqlRun then
		LoadShop()
		hasSqlRun = true
	end
end)

function LoadShop()
	local itemResult = MySQL.Sync.fetchAll('SELECT * FROM items')
	local shopResult = MySQL.Sync.fetchAll('SELECT * FROM mcauto')

	local itemInformation = {}
	for i=1, #itemResult, 1 do

		if itemInformation[itemResult[i].name] == nil then
			itemInformation[itemResult[i].name] = {}
		end

		itemInformation[itemResult[i].name].label = itemResult[i].label
		itemInformation[itemResult[i].name].weight = itemResult[i].weight
	end

	for i=1, #shopResult, 1 do
		if ShopItems[shopResult[i].store] == nil then
			ShopItems[shopResult[i].store] = {}
		end

		if itemInformation[shopResult[i].item].weight == -1 then
			itemInformation[shopResult[i].item].weight = 30
		end

		table.insert(ShopItems[shopResult[i].store], {
			label = itemInformation[shopResult[i].item].label,
			item  = shopResult[i].item,
			price = shopResult[i].price,
			weight = itemInformation[shopResult[i].item].weight
		})
	end
end

ESX.RegisterServerCallback('McAuto:requestDBItems', function(source, cb)
	if not hasSqlRun then
		TriggerClientEvent('esx:showNotification', source, '~r~No se ha cargado bien el McAuto, revisa que están los items en la DataBase.')
	end

	cb(ShopItems)
end)

RegisterServerEvent('McAuto:buyItem')
AddEventHandler('McAuto:buyItem', function(itemName, amount, zone)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local sourceItem = xPlayer.getInventoryItem(itemName)

	amount = ESX.Round(amount)

	-- is the player trying to exploit?
	if amount < 0 then
		print('McAuto: ' .. xPlayer.identifier .. ' attempted to exploit the shop!')
		return
	end

	-- get price
	local price = 0
	local itemLabel = ''

	for i=1, #ShopItems[zone], 1 do
		if ShopItems[zone][i].item == itemName then
			price = ShopItems[zone][i].price
			itemLabel = ShopItems[zone][i].label
			break
		end
	end

	price = price * amount

	-- can the player afford this item?
	if xPlayer.getMoney() >= price then
		-- can the player carry the said amount of x item?
		if sourceItem.weight ~= -1 and (sourceItem.count + amount) > sourceItem.weight then
			TriggerClientEvent('esx:showNotification', _source, _U('player_cannot_hold'))
		else
			xPlayer.removeMoney(price)
			xPlayer.addInventoryItem(itemName, amount)
			TriggerClientEvent('esx:showNotification', _source, _U('bought', amount, itemLabel, price))
		end
	else
		local missingMoney = price - xPlayer.getMoney()
		TriggerClientEvent('esx:showNotification', _source, _U('not_enough', missingMoney))
	end
end)

RegisterServerEvent('McAuto:remove')
AddEventHandler('McAuto:remove', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('clip', 1)
end)

ESX.RegisterUsableItem('clip', function(source)
	TriggerClientEvent('McAuto:clipcli', source)
end)

ESX.RegisterUsableItem('silencieux', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)	
    TriggerClientEvent('McAuto:silencieux', source)

end)

ESX.RegisterUsableItem('conohelado', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)	
	
    TriggerClientEvent('McAuto:conolehalado', source)
	
end)

ESX.RegisterUsableItem('grip', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
		
    TriggerClientEvent('McAuto:grip', source)
	
end)


ESX.RegisterUsableItem('yusuf', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    TriggerClientEvent('McAuto:yusuf', source)

end)
