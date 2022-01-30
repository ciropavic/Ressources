ESX = nil

local currentMeals = 0

if GetCurrentResourceName() == 'dgrp_mcdonalds' or GetCurrentResourceName() == 'dgrp_mcdonaldsjob' or GetCurrentResourceName() == 'dgrp_mcdonaldsjob-master' then
  print("DefectGaming's McDonalds Job Successfully Loaded")

	TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) 

	RegisterServerEvent('dgrp_mcdonalds:setCleanJob')
		AddEventHandler('dgrp_mcdonalds:setCleanJob', function()
		local xPlayer = ESX.GetPlayerFromId(source)
		xPlayer.setJob('McDonalds', 0)
	end)

	RegisterServerEvent('dgrp_mcdonalds:setCashierJob')
		AddEventHandler('dgrp_mcdonalds:setCashierJob', function()
		local xPlayer = ESX.GetPlayerFromId(source)
		xPlayer.setJob('McDonalds', 1)
	end)

	RegisterServerEvent('dgrp_mcdonalds:setCookJob')
		AddEventHandler('dgrp_mcdonalds:setCookJob', function()
		local xPlayer = ESX.GetPlayerFromId(source)
		xPlayer.setJob('McDonalds', 2)
	end)

	RegisterServerEvent('dgrp_mcdonalds:setDelivJob')
		AddEventHandler('dgrp_mcdonalds:setDelivJob', function()
		local xPlayer = ESX.GetPlayerFromId(source)
		xPlayer.setJob('McDonalds', 3)
	end)

	RegisterServerEvent('dgrp_mcdonalds:fireWorker')
		AddEventHandler('dgrp_mcdonalds:fireWorker', function()
		local xPlayer = ESX.GetPlayerFromId(source)
		xPlayer.setJob('unemployed', 0)
	end)

	RegisterServerEvent('dgrp_mcdonalds:addToMealInvent')
		AddEventHandler('dgrp_mcdonalds:addToMealInvent', function()
			currentMeals = currentMeals + 1
			print("Current Meals are now: "..currentMeals)
			TriggerClientEvent("dgrp_mcdonalds:setInvent", -1, currentMeals)
	end)

	RegisterServerEvent('dgrp_mcdonalds:removeFromMealInvent')
		AddEventHandler('dgrp_mcdonalds:removeFromMealInvent', function()
			currentMeals = currentMeals - 1
			print("Current Meals are now: "..currentMeals)
			TriggerClientEvent("dgrp_mcdonalds:setInvent", -1, currentMeals)
	end)

	RegisterServerEvent('dgrp_mcdonalds:getMealAmount')
		AddEventHandler('dhrp_mcdonalds:getMealAmount', function()
		TriggerClientEvent("dgrp_mcdonalds:setInvent", source, currentMeals)
		print("Current Meals are: "..currentMeals)
	end)

	RegisterServerEvent('dgrp_mcdonalds:getPaid')
		AddEventHandler('dgrp_mcdonalds:getPaid', function(amount)
		local xPlayer = ESX.GetPlayerFromId(source)	
		xPlayer.addMoney(math.floor(amount))	
	end)

	RegisterServerEvent('dgrp_mcdonalds:payDeposit')
		AddEventHandler('dgrp_mcdonalds:payDeposit', function(amount)
		local xPlayer = ESX.GetPlayerFromId(source)	
		xPlayer.removeMoney(math.floor(amount))	
	end)

	RegisterServerEvent('dgrp_mcdonalds:returnDeposit')
		AddEventHandler('dgrp_mcdonalds:returnDeposit', function(amount)
		local xPlayer = ESX.GetPlayerFromId(source)	
		xPlayer.addMoney(math.floor(amount))	
	end)

	RegisterServerEvent('dgrp_mcdonalds:addItem')
		AddEventHandler('dgrp_mcdonalds:addItem', function(item)
		local xPlayer = ESX.GetPlayerFromId(source)	
		xPlayer.addInventoryItem(item, 1)
	end)

	RegisterServerEvent('dgrp_mcdonalds:removeItem')
		AddEventHandler('dgrp_mcdonalds:removeItem', function(item)
		local xPlayer = ESX.GetPlayerFromId(source)	
		xPlayer.removeInventoryItem(item, 1)
	end)

	ESX.RegisterUsableItem('mcdonalds_drink', function(source)
		local xPlayer = ESX.GetPlayerFromId(source)
		xPlayer.removeInventoryItem('mcdonalds_drink', 1)

		TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
		TriggerClientEvent('esx_basicneeds:onDrink', source)
		TriggerClientEvent('dgrp_mcdonalds:consumedItem', source, 1)
		xPlayer.showNotification("~b~Bebiste un ~y~McDonalds ~b~ Bebida.")
	end)

	ESX.RegisterUsableItem('mcdonalds_fries', function(source)
		local xPlayer = ESX.GetPlayerFromId(source)
		xPlayer.removeInventoryItem('mcdonalds_fries', 1)

		TriggerClientEvent('esx_status:add', source, 'hunger', 50000)
		TriggerClientEvent('esx_basicneeds:onEat', source)
		TriggerClientEvent('dgrp_mcdonalds:consumedItem', source, 2)
		xPlayer.showNotification("~b~Comiste ~y~McDonalds ~b~ Patatas.")
	end)

	ESX.RegisterUsableItem('mcdonalds_burger', function(source)
		local xPlayer = ESX.GetPlayerFromId(source)
		xPlayer.removeInventoryItem('mcdonalds_burger', 1)

		TriggerClientEvent('esx_status:add', source, 'hunger', 150000)
		TriggerClientEvent('esx_basicneeds:onEat', source)
		TriggerClientEvent('dgrp_mcdonalds:consumedItem', source, 3)
		xPlayer.showNotification("~b~Comiste ~y~McDonalds ~b~ Burger.")
	end)

	ESX.RegisterUsableItem('mcdonalds_meal', function(source)
		local xPlayer = ESX.GetPlayerFromId(source)
		xPlayer.removeInventoryItem('mcdonalds_meal', 1)

		TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
		TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
		TriggerClientEvent('esx_basicneeds:onEat', source)
		TriggerClientEvent('dgrp_mcdonalds:consumedItem', source, 4)
		xPlayer.showNotification("~b~Comiste y bebiste un ~y~McDonalds ~b~Menu.")
	end)
else
    print("\nA weird error has occurred with dgrp_mcdonalds... Please open a GitHub Issue using the Bug Template with this error code in the title: 14mdvmb")
end

TriggerEvent('esx_phone:registerNumber', 'macdonals', true, true)