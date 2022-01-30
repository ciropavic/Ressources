  
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local handscuffs = {}
local url = 'https://discordapp.com/api/webhooks/741989199682732072/fqqRKwQYGhcK2fD9fCIqAljJhFqEyxvVuqzf58lDFr_mR3uQqdq1oU7dcUVKQi2THZPs'

TriggerEvent('esx_society:registerSociety', 'mechanic', 'mechanic', 'society_mechanic', 'society_mechanic', 'society_mechanic', {type = 'public'})

RegisterServerEvent('mecanico:logs')
AddEventHandler('mecanico:logs', function(data, src)
    local identifiers = {discord = "", steam = "", license = "", ip = "", live = "", xbl = ""}
    local num = GetNumPlayerIdentifiers(source)

    for i = 0, num-1 do
        local a = GetPlayerIdentifier(source, i)
        local f = string.find(a, ":")
        if f then
            local b = string.sub(a, 1, f-1)
            identifiers[b] = a
        end
    end

    local id = source or src
    local time = os.date("%Y/%m/%d %X")
	PerformHttpRequest(url, function(err, text, headers) end, 'POST', json.encode({username = "mecanico logs", content = "```css\n[" .. time .. "] " .. data .. "```"}), {['Content-Type'] = 'application/json'})
end)

RegisterServerEvent("mecanico:server:CuffPlayer")
AddEventHandler("mecanico:server:CuffPlayer", function(playerId, isSoftcuff)
    local source = source
    local playerId = playerId
    local isSoftcuff = isSoftcuff
    TriggerClientEvent('mecanico:client:GetCuffed', playerId, source, isSoftcuff)
end)

RegisterServerEvent("mecanico:server:UnCuffPlayer")
AddEventHandler("mecanico:server:UnCuffPlayer", function(playerId)
    local source = source
    local playerId = playerId
    TriggerClientEvent('mecanico:client:GetUnCuffed', playerId, source)
end)

RegisterServerEvent("mecanico:server:SetHandcuffStatus")
AddEventHandler("mecanico:server:SetHandcuffStatus", function(isHandsCuff)
    local source = source
    handscuffs[source] = isHandsCuff
end)

RegisterServerEvent("mecanico:server:EscortPlayer")
AddEventHandler("mecanico:server:EscortPlayer", function(playerId)
    local source = source
    local playerId = playerId
    TriggerClientEvent('mecanico:client:GetEscorted', playerId, source)
end)

RegisterServerEvent("mecanico:server:SeizeCash")
AddEventHandler("mecanico:server:SeizeCash", function(playerId)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xTarget = ESX.GetPlayerFromId(playerId)
    local targetMoney = xTarget.getMoney()
    xTarget.removeMoney(targetMoney)
    xPlayer.addMoney(targetMoney)
end)

RegisterServerEvent("mecanico:server:PutPlayerInVehicle")
AddEventHandler("mecanico:server:PutPlayerInVehicle", function(playerId)
    local playerId = playerId
    TriggerClientEvent('mecanico:client:PutInVehicle', playerId)
end)

RegisterServerEvent("mecanico:server:SetPlayerOutVehicle")
AddEventHandler("mecanico:server:SetPlayerOutVehicle", function(playerId)
    local playerId = playerId
    TriggerClientEvent('mecanico:client:SetOutVehicle', playerId)
end)

AddEventHandler('esx:onRemoveInventoryItem', function(source, item, count)
    local player = ESX.GetPlayerFromId(source)
    if item.name == 'mecanicoradar' then
        TriggerEvent("mecanico:server:UpdateBlips")
    end
end)

AddEventHandler('esx:onAddInventoryItem', function(source, item, count)
    local player = ESX.GetPlayerFromId(source)
    if item.name == 'mecanicoradar' then
        TriggerEvent("mecanico:server:UpdateBlips")
    end
end)

RegisterServerEvent("mecanico:server:UpdateBlips")
AddEventHandler("mecanico:server:UpdateBlips", function()
    local Players = ESX.GetPlayers()
    local dutyPlayers = {}
    for k,v in pairs(Players) do
        local xPlayer = ESX.GetPlayerFromId(v)
        if xPlayer.getInventoryItem('policeradar').count > 0 and (xPlayer.job.name == "mechanic" or xPlayer.job.name == "ambulance")then
            dutyPlayers[v] = xPlayer
        end
    end
    TriggerClientEvent('mecanico:client:UpdateBlips', -1, dutyPlayers)
end)


ESX.RegisterServerCallback("mecanico:GetImpoundedVehicles", function(source, cb, category)
    local vehicles = {}

    MySQL.Async.fetchAll("SELECT * FROM `owned_vehicles` WHERE `garage` = 'mechanic'", {}, cb)
end)

RegisterServerEvent("mecanico:server:impound")
AddEventHandler("mecanico:server:impound", function(plate)
    MySQL.Sync.execute("UPDATE owned_vehicles SET garage=@garage WHERE plate=@plate",{['@garage'] = "mechanic" , ['@plate'] = plate})
    MySQL.Sync.execute("UPDATE owned_vehicles SET state=@state WHERE plate=@plate",{['@state'] = true , ['@plate'] = plate})
end)

RegisterServerEvent("mecanico:server:outOfImpound")
AddEventHandler("mecanico:server:outOfImpound", function(plate)
    MySQL.Sync.execute("UPDATE owned_vehicles SET garage=@garage WHERE plate=@plate",{['@garage'] = "A" , ['@plate'] = plate})
    MySQL.Sync.execute("UPDATE owned_vehicles SET state=@state WHERE plate=@plate",{['@state'] = true , ['@plate'] = plate})
end)

ESX.RegisterServerCallback('mecanico:FineList', function(source, cb, category)
	MySQL.Async.fetchAll('SELECT * FROM fine_types', {}, function(fines)
		cb(fines)
	end)
end)

ObjectList = {}

RegisterServerEvent("mecanico:server:spawnObject")
AddEventHandler("mecanico:server:spawnObject", function(object)
    TriggerClientEvent('mecanico:client:spawnObject', -1,#ObjectList+1, object, source)
end)

RegisterServerEvent("mecanico:server:deleteObject")
AddEventHandler("mecanico:server:deleteObject", function(id)
    TriggerClientEvent('mecanico:client:removeObject', -1,id)
end)

RegisterServerEvent("mecanico:server:setObjects")
AddEventHandler("mecanico:server:setObjects", function(table)
    ObjectList = table
end)

RegisterServerEvent("mecanico:server:wantObjects")
AddEventHandler("mecanico:server:wantObjects", function()
    TriggerClientEvent("mecanico:client:setObjects", source, ObjectList)
end)

RegisterNetEvent('mecanico:addLicense')
AddEventHandler('mecanico:addLicense', function(id)
    local _target = id
    local _source = source
	local xPlayer = ESX.GetPlayerFromId(_target)

    if not xPlayer then return end

    TriggerEvent('esx_license:checkLicense', _target, 'weapon', function(has)
        if not has then
	        TriggerEvent('esx_license:addLicense', _target, 'weapon', function()
		        TriggerEvent('esx_license:getLicenses', _target, function(licenses)
                    TriggerClientEvent('esx_dmvschool:loadLicenses', _target, licenses)
		        end)
            end)

            TriggerClientEvent('notification', _target, 'You just receive weapon license.', 1)

        else
            TriggerClientEvent('notification', _source, GetPlayerName(_target) .. ' already have weapon license.', 2)
        end
    end)

	if xPlayer.getInventoryItem('license_weapon').count == 0 then
		xPlayer.addInventoryItem('license_weapon', 1)
	end
end)

RegisterServerEvent('mecanico:duty')
AddEventHandler('mecanico:duty' , function(state)
    local player = ESX.GetPlayerFromId(source)
    local job = player.job

    if state == true then
        player.setJob('mechanic', job.grade)
    else
        player.setJob('offmechanic', job.grade)
    end
end)

RegisterServerEvent('mecanico:personalStash')
AddEventHandler('mecanico:personalStash' , function()
    local Steam = GetPlayerIdentifiers(source)[1]

    TriggerClientEvent('inventory:stash', source, 'mecanico Personal Stash ' .. Steam)
end)

RegisterServerEvent('mecanico:remmaskGranted')
AddEventHandler('mecanico:remmaskGranted' , function(id)
    TriggerClientEvent('mecanico:remmaskAccepted', id or source)
end)

RegisterServerEvent('mecanico:targetCheckBank')
AddEventHandler('mecanico:targetCheckBank' , function(id)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xTarget = ESX.GetPlayerFromId(id)
 
    TriggerClientEvent('notification', source,'Target bank balance: $' .. xTarget.getBank())
end)
