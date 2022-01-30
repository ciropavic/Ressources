ESX = nil
LastDelivery = 0.0


TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function GetCopsOnline()

	local PoliceConnected = 0
	local xPlayers = ESX.GetPlayers()

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])

		if xPlayer.job.name == 'police' then
			PoliceConnected = PoliceConnected + 1
		end
	end

	return PoliceConnected
end

RegisterServerEvent('mg_live:resetEvent')
AddEventHandler('mg_live:resetEvent', function()
	LastDelivery = 0.0
end)

ESX.RegisterServerCallback('mg_live:getCopsOnline', function(source, cb)
	cb(GetCopsOnline())
end)






ESX.RegisterServerCallback('mg_live:sellVehRun', function(source, cb, price)
	local xPlayer = ESX.GetPlayerFromId(source)
	print(":: El receptor del vehículo ha pagado  " .. price .. " $")

	--xPlayer.addAccountMoney('black_money', price)
	xPlayer.addInventoryItem("cash",price)
	TriggerClientEvent("pNotify:SendNotification", source, {
            text = "Habéis ganado <b style='color:red'>" .. price .. "</b> para esta entrega.",
            type = "success",
            timeout = 10000,
            layout = "centerRight"
        })
	cb(true)

	LastDelivery = 0.0

end)





ESX.RegisterServerCallback('mg_live:buyVehRun', function(source, cb, price)

	local xPlayer = ESX.GetPlayerFromId(source)
    local item = xPlayer.getInventoryItem("cash")["count"]

	--if os.time() < police_alarm_time
	if (os.time() - LastDelivery) < 30.0 and LastDelivery ~= 0.0 then

		TriggerClientEvent("pNotify:SendNotification", source, {
            text = "Eh ! No soy un comerciante !</br>Proporciono solo un vehículo a la vez.",
            type = "error",
            timeout = 10000,
            layout = "centerRight"
        })
		cb(false)

	else

		police_alarm_time = os.time() + math.random(10000, 20000)

    if item >= price then
		--if xPlayer.getAccount('cash').money >= price then
			--xPlayer.removeAccountMoney('black_money', price)
			xPlayer.removeInventoryItem("cash",price)

			LastDelivery = os.time()

			cb(true)
		else

			TriggerClientEvent('esx:showNotification', source, "No es suficiente' ~r~dinero sucio~w~.")

			cb(false)
		end

	end

end)
