ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_jk_jobs:setJobt')
AddEventHandler('esx_jk_jobs:setJobt', function(job)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.setJob("taxi", 0)-- 0 is job grade
	TriggerClientEvent('esx:showNotification', source, 'Dirigete a la (Oficina) junto a (Aeropuerto) marcado en mapa ' .. xPlayer.getName())
end)

--RegisterServerEvent('esx_jk_jobs:setJobc')
--AddEventHandler('esx_jk_jobs:setJobc', function(job)
	--local _source = source
	--local xPlayer = ESX.GetPlayerFromId(_source)
	--xPlayer.setJob("fisherman", 0)-- 0 is job grade
	--TriggerClientEvent('esx:showNotification', source, 'Aceptaron tu curriculum  ~g~' .. xPlayer.getName())
--end)

RegisterServerEvent('esx_jk_jobs:setJobp')
AddEventHandler('esx_jk_jobs:setJobp', function(job)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.setJob("gopostal", 0)-- 0 is job grade
	TriggerClientEvent('esx:showNotification', source, 'Dirigete a la (G) marcado en mapa ' .. xPlayer.getName())
end)

RegisterServerEvent('esx_jk_jobs:setJobn')
AddEventHandler('esx_jk_jobs:setJobn', function(job)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.setJob("unemployed", 0) -- 0 is job grade
	TriggerClientEvent('esx:showNotification', source, 'Sin Empleo te sera dificil sobrevivir (VAGO) ' .. xPlayer.getName())	
end)

RegisterServerEvent('esx_jk_jobs:setJobb')
AddEventHandler('esx_jk_jobs:setJobb', function(job)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.setJob("delivery", 0) -- 0 is job grade  
	TriggerClientEvent('esx:showNotification', source, 'Aceptaron tu curriculum  ~g~' .. xPlayer.getName())	
end)

RegisterServerEvent('esx_jk_jobs:setJoba')
AddEventHandler('esx_jk_jobs:setJoba', function(job)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.setJob("busdriver", 0)-- 0 is job grade
	TriggerClientEvent('esx:showNotification', source, 'Dirigete al (Bus) marcado en mapa' .. xPlayer.getName())
end)



RegisterServerEvent('esx_jk_jobs:setJobe')
AddEventHandler('esx_jk_jobs:setJobe', function(job)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.setJob("salvage", 0)-- 0 is job grade
	TriggerClientEvent('esx:showNotification', source, 'Dirigete al (Submarino) marcado en mapa' .. xPlayer.getName())
end)

--RegisterServerEvent('esx_jk_jobs:setJobf')
--AddEventHandler('esx_jk_jobs:setJobf', function(job)
	--local _source = source
	--local xPlayer = ESX.GetPlayerFromId(_source)
	--xPlayer.setJob("taxi", 0)-- 0 is job grade
	--TriggerClientEvent('esx:showNotification', source, 'Aceptaron tu curriculum ~g~' .. xPlayer.getName())
--end)

--RegisterServerEvent('esx_jk_jobs:setJobg')
--AddEventHandler('esx_jk_jobs:setJobg', function(job)
	--local _source = source
	--local xPlayer = ESX.GetPlayerFromId(_source)
	--xPlayer.setJob("reporter", 0)-- 0 is job grade
	--TriggerClientEvent('esx:showNotification', source, 'Aceptaron tu curriculum ~g~' .. xPlayer.getName())
--end)

RegisterServerEvent('esx_jk_jobs:setJobi')
AddEventHandler('esx_jk_jobs:setJobi', function(job)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.setJob("McDonalds", 0)-- 0 is job grade
	TriggerClientEvent('esx:showNotification', source, 'Dirigete a la (M) marcado en mapa' .. xPlayer.getName())
end)

RegisterServerEvent('esx_jk_jobs:setJobj')
AddEventHandler('esx_jk_jobs:setJobj', function(job)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.setJob("gopostal", 0)-- 0 is job grade
	TriggerClientEvent('esx:showNotification', source, 'Dirigete a la (G) marcado en mapa ' .. xPlayer.getName())
end)

RegisterServerEvent('esx_jk_jobs:setJobk')
AddEventHandler('esx_jk_jobs:setJobk', function(job)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.setJob("garbage", 0)-- 0 is job grade
	TriggerClientEvent('esx:showNotification', source, 'Dirigete al (CAMION DE BASURA) marcado en mapa ' .. xPlayer.getName())
end)

--RegisterServerEvent('esx_jk_jobs:setJobh')
--AddEventHandler('esx_jk_jobs:setJobh', function(job)
	--local _source = source
	--local xPlayer = ESX.GetPlayerFromId(_source)
	--xPlayer.setJob("rally", 0)-- 0 is job grade
	--TriggerClientEvent('esx:showNotification', source, 'Aceptaron tu curriculum ~g~' .. xPlayer.getName())
--end)