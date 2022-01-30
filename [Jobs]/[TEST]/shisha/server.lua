ESX = nil 
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent("chema_shisha:pay")
AddEventHandler("chema_shisha:pay", function(entity)
local xPlayer = ESX.GetPlayerFromId(source)

xPlayer.removeMoney(20)
end)

RegisterServerEvent("eff_smokes")
AddEventHandler("eff_smokes", function(entity)
	TriggerClientEvent("c_eff_smokes", -1, entity)
end)

ESX.RegisterUsableItem('hookah', function(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    xPlayer.removeInventoryItem('hookah', 1)
	xPlayer.showNotification('~g~El Cachimba fue establecido.')
	TriggerClientEvent("chema_shisha:spawn", -1, entity)
end)

RegisterCommand("delcachimba", function(source, args, rawCommand)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent("chema_shisha:delete", -1, entity)
	--xPlayer.addInventoryItem("hookah", 1)
end)
RegisterCommand("hookah", function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
	
	TriggerClientEvent("chema_shisha:spawn", -1, entity, xPlayer)
end)