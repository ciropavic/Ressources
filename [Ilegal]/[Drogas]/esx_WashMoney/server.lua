ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent("esx_WashMoney:wash")
AddEventHandler('esx_WashMoney:wash', function()

	local xPlayer = ESX.GetPlayerFromId(source) -- Gets the players data
	local money = xPlayer.getMoney() -- gets normal money

	local itemMeth	= xPlayer.getInventoryItem('black_money')

			if itemMeth = 20000 then
				TriggerClientEvent('esx:showNotification', _source, _U('no_meth_sale'))
			else
xPlayer.removeInventoryItem('black_money', 20000)
	            xPlayer.addMoney(15000)
            end

end)