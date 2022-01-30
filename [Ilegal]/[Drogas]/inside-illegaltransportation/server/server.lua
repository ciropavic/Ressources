ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

AddEventHandler('playerDropped', function()
    TriggerClientEvent('inside-illegaltransportation:playerdropped', source)
end)

RegisterServerEvent('inside-illegaltransportation:PoliceNotfiy')
AddEventHandler('inside-illegaltransportation:PoliceNotfiy', function(coords)
    TriggerClientEvent('inside-illegaltransportation:PoliceNotifyC', -1, coords)
end)

ESX.RegisterServerCallback('inside-illegaltransportation:payout', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
    local money = Config.Payout
	xPlayer.addMoney(money)
    cb(money)
end)