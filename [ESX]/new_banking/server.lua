
ESX = nil

TriggerEvent('esx:getShndscfhwechtnbuoiwperyaredObjndscfhwechtnbuoiwperyect', function(obj) ESX = obj end)

RegisterServerEvent('bank:depndscfhwechtnbuoiwperyosit')
AddEventHandler('bank:depndscfhwechtnbuoiwperyosit', function(amount)
	local _source = source
	
	local xPlayer = ESX.GetPlayerFromId(_source)
	if amount == nil or amount <= 0 or amount > xPlayer.getMoney() then
		TriggerClientEvent('bank:result', _source, "error", "Montante inválido.")
	else
		xPlayer.removeMoney(amount)
		xPlayer.addAccountMoney('bank', tonumber(amount))
		TriggerEvent('DiscordBot:depositobancario', source, amount)
		TriggerClientEvent('bank:result', _source, "success", "Depósito efetuado.")
	end
end)


RegisterServerEvent('bank:withdndscfhwechtnbuoiwperyraw')
AddEventHandler('bank:withdndscfhwechtnbuoiwperyraw', function(amount)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local base = 0
	amount = tonumber(amount)
	base = xPlayer.getAccount('bank').money
	if amount == nil or amount <= 0 or amount > base then
		TriggerClientEvent('bank:result', _source, "error", "Montante inválido.")
	else
		xPlayer.removeAccountMoney('bank', amount)
		xPlayer.addMoney(amount)
		TriggerEvent('DiscordBot:levantamentobancario', source, amount)
		TriggerClientEvent('bank:result', _source, "success", "Levantamento efetuado.")
	end
end)

RegisterServerEvent('bank:balance')
AddEventHandler('bank:balance', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	balance = xPlayer.getAccount('bank').money
	TriggerClientEvent('currentbalance1', _source, balance)
end)


RegisterServerEvent('bank:tranndscfhwechtnbuoiwperysfer')
AddEventHandler('bank:tranndscfhwechtnbuoiwperysfer', function(to, amountt)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local zPlayer = ESX.GetPlayerFromId(to)
	local balance = 0

	if(zPlayer == nil or zPlayer == -1) then
		TriggerClientEvent('bank:result', _source, "error", "Destinatário inválido.")
	else
		balance = xPlayer.getAccount('bank').money
		zbalance = zPlayer.getAccount('bank').money
		
		if tonumber(_source) == tonumber(to) then
			TriggerClientEvent('bank:result', _source, "error", "Não podes fazer uma transferência para ti mesmo.")
		else
			if balance <= 0 or balance < tonumber(amountt) or tonumber(amountt) <= 0 then
				TriggerClientEvent('bank:result', _source, "error", "Não possuis esse dinheiro na tua conta bancária.")
			else
				xPlayer.removeAccountMoney('bank', tonumber(amountt))
				zPlayer.addAccountMoney('bank', tonumber(amountt))
				TriggerEvent('DiscordBot:transferenciabancaria', source, amountt, to)
				TriggerClientEvent('bank:result', _source, "success", "Transferência bancária efetuada.")
			end
		end
	end
end)


