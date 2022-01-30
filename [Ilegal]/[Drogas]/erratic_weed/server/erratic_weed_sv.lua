ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local hiddenprocess = vector3(0.0, 0.0, 0) -- Change this to whatever location you want. This is server side to prevent people from dumping the coords
local hiddenstart = vector3(694.17, 2281.15, 11.79) -- Change this to whatever location you want. This is server side to prevent people from dumping the coords

RegisterNetEvent('weed:updateTable')
AddEventHandler('weed:updateTable', function(bool)
    TriggerClientEvent('weed:syncTable', -1, bool)
end)

ESX.RegisterUsableItem('weed', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('weed', 1)
	TriggerClientEvent('weed:onUse', source)
end)

ESX.RegisterServerCallback('weed:processcoords', function(source, cb)
    cb(hiddenprocess)
end)

ESX.RegisterServerCallback('weed:startcoords', function(source, cb)
    cb(hiddenstart)
end)

ESX.RegisterServerCallback('weed:pay', function(source, cb)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local price = Config.price
	local check = xPlayer.getMoney()
	if check >= price then
		xPlayer.removeMoney(price)
    	cb(true)
    else
      if Config.useMythic then
    	 TriggerClientEvent('mythic_notify:client:SendAlert:long', _source, { type = 'error', text = _U'no_money'})
      end
    	cb(false)
    end
end)

RegisterServerEvent("weed:processed")
AddEventHandler("weed:processed", function(x,y,z)
  	local _source = source
  	local xPlayer = ESX.GetPlayerFromId(_source)
  	local pick = Config.randBrick
	xPlayer.removeInventoryItem('weedbrick', Config.takeBrick)
	xPlayer.addInventoryItem('weed', pick)
end)

ESX.RegisterServerCallback('weed:process', function(source, cb)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local check = xPlayer.getInventoryItem('weedbrick').count
	if check >= 1 then
    	cb(true)
    else
      if Config.useMythic then
    	 TriggerClientEvent('mythic_notify:client:SendAlert:long', _source, { type = 'error', text = _U'no_brick'})
      end
    	cb(false)
    end
end)

RegisterServerEvent("weed:GiveItem")
AddEventHandler("weed:GiveItem", function()
  	local _source = source
  	local xPlayer = ESX.GetPlayerFromId(_source)
    xPlayer.addInventoryItem('weedbrick', 4)
end)
