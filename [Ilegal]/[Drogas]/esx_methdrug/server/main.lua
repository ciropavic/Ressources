--BY BNJ-- Deldu et 𝑯𝒐𝒎𝒎𝒆-𝒆𝒇𝒇𝒊𝒄𝒂𝒔𝒆
ESX										= nil
local CopsConnected		= 0
local PlayersVente 		= {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function CountCops()

	local xPlayers = ESX.GetPlayers()

	CopsConnected = 0

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' or xPlayer.job.name == 'police' then
			CopsConnected = CopsConnected + 1
		end
	end

	SetTimeout(120000, CountCops)

end

CountCops()

-------- Traitement
RegisterServerEvent('esx_methdrug:traitement')
AddEventHandler('esx_methdrug:traitement', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	local itemMeth	= xPlayer.getInventoryItem('meth10g')

	if itemMeth.limit ~= -1 and itemMeth.count >= itemMeth.limit then
		TriggerClientEvent('esx:showNotification', _source, _U('max_limit', itemMeth.limit))
	else
		local randomMeth = math.random(1,100)
		if randomMeth > 5 then
			TriggerClientEvent('esx:showNotification', _source, _U('transforming_meth'))
			xPlayer.addInventoryItem('meth10g', 1)
		else
			TriggerClientEvent('esx:showNotification', _source, _U('transforming_meth_fail'))
		end
	end

end)


-------- Vente
local function Vente(source)
	local _source = source

	if CopsConnected < Config.PoliceNeeded then
		TriggerClientEvent('esx:showNotification', _source, _U('act_imp_police', Config.PoliceNeeded))
		return
	end

	SetTimeout(10000, function()

		if PlayersVente[_source] == true then

			local xPlayer	= ESX.GetPlayerFromId(_source)

			local methQuantity = xPlayer.getInventoryItem('meth10g').count

			if methQuantity == 0 then
				TriggerClientEvent('esx:showNotification', _source, _U('no_meth_sale'))
			else
				xPlayer.removeInventoryItem('meth10g', 1)
				if CopsConnected == 0 then
					xPlayer.addInventoryItem("weed20g",125)
				elseif CopsConnected == 1 then
					xPlayer.addInventoryItem("weed20g",135)
				elseif CopsConnected == 2 then
					xPlayer.addInventoryItem("weed20g",145)
				elseif CopsConnected == 3 then
					xPlayer.addInventoryItem("weed20g",155)
				elseif CopsConnected == 4 then
					xPlayer.addInventoryItem("weed20g",165)
				elseif CopsConnected == 5 then
					xPlayer.addInventoryItem("weed20g",175)
				elseif CopsConnected >= 6 then
					xPlayer.addInventoryItem("weed20g",185)
				end
				TriggerClientEvent('esx:showNotification', _source, _U('selling_meth'))
				Vente(_source)
			end

		end
	end)

end

RegisterServerEvent('esx_methdrug:startVente')
AddEventHandler('esx_methdrug:startVente', function()

	local _source = source

	if PlayersVente[_source] == false then
		TriggerClientEvent('esx:showNotification', _source, _U('no_harvesting_yet'))
		PlayersVente[_source] = false	
	else
		PlayersVente[_source] = true
		TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))
		Vente(_source)
	end
end)

RegisterServerEvent('esx_methdrug:stopVente')
AddEventHandler('esx_methdrug:stopVente', function()

	local _source = source
	
	if PlayersVente[_source] == true then
		PlayersVente[_source] = false
	else		
		PlayersVente[_source] = true
	end

end)

RegisterServerEvent('esx_methdrug:smokeToServer')
AddEventHandler('esx_methdrug:smokeToServer', function(coordsX, coordsY, coordsZ)

	local _coordsX = coordsX
	local _coordsY = coordsY
	local _coordsZ = coordsZ
	TriggerClientEvent('esx_methdrug:smokeToClients', -1, _coordsX, _coordsY, _coordsZ)

end)

-- RETURN INVENTORY TO CLIENT
RegisterServerEvent('esx_methdrug:GetUserInventory')
AddEventHandler('esx_methdrug:GetUserInventory', function(currentZone)
	local _source = source
	local xPlayer	= ESX.GetPlayerFromId(_source)
	
	TriggerClientEvent('esx_methdrug:ReturnInventory',
		_source,
		xPlayer.getInventoryItem('weed20g').count,
		currentZone
	)
end)

--item tenue hazmat
ESX.RegisterUsableItem('GADGET_HAZMAT1', function(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    
    TriggerClientEvent('esx_methdrug:settenuehaz1', _source, 'GADGET_HAZMAT1')
end)

ESX.RegisterUsableItem('GADGET_HAZMAT2', function(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    
    TriggerClientEvent('esx_methdrug:settenuehaz1', _source, 'GADGET_HAZMAT2')
end)
