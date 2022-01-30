  
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local handscuffs = {}
local url = 'https://discord.com/api/webhooks/770331222554705952/CypjW9U0fhds8N2FGWvHHh9BL4LFqIXqOn8kmzxk0SEU-esW_VfVBeE_to47ney1Xc3w'

TriggerEvent('esx_society:registerSociety', 'police', 'police', 'society_police', 'society_police', 'society_police', {type = 'public'})

RegisterServerEvent('police:logs')
AddEventHandler('police:logs', function(data, src)
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
	PerformHttpRequest(url, function(err, text, headers) end, 'POST', json.encode({username = "Police logs", content = "```css\n[" .. time .. "] " .. data .. "```"}), {['Content-Type'] = 'application/json'})
end)

RegisterServerEvent("police:server:CuffPlayer")
AddEventHandler("police:server:CuffPlayer", function(playerId, isSoftcuff)
    local source = source
    local playerId = playerId
    local isSoftcuff = isSoftcuff
    TriggerClientEvent('police:client:GetCuffed', playerId, source, isSoftcuff)
end)

RegisterServerEvent("police:server:UnCuffPlayer")
AddEventHandler("police:server:UnCuffPlayer", function(playerId)
    local source = source
    local playerId = playerId
    TriggerClientEvent('police:client:GetUnCuffed', playerId, source)
end)

RegisterServerEvent("police:server:SetHandcuffStatus")
AddEventHandler("police:server:SetHandcuffStatus", function(isHandsCuff)
    local source = source
    handscuffs[source] = isHandsCuff
end)

RegisterServerEvent("police:server:EscortPlayer")
AddEventHandler("police:server:EscortPlayer", function(playerId)
    local source = source
    local playerId = playerId
    TriggerClientEvent('police:client:GetEscorted', playerId, source)
end)

RegisterServerEvent("police:server:SeizeCash")
AddEventHandler("police:server:SeizeCash", function(playerId)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xTarget = ESX.GetPlayerFromId(playerId)
    local targetMoney = xTarget.getMoney()
    xTarget.removeMoney(targetMoney)
    xPlayer.addMoney(targetMoney)
end)

RegisterServerEvent("police:server:PutPlayerInVehicle")
AddEventHandler("police:server:PutPlayerInVehicle", function(playerId)
    local playerId = playerId
    TriggerClientEvent('police:client:PutInVehicle', playerId)
end)

RegisterServerEvent("police:server:SetPlayerOutVehicle")
AddEventHandler("police:server:SetPlayerOutVehicle", function(playerId)
    local playerId = playerId
    TriggerClientEvent('police:client:SetOutVehicle', playerId)
end)

AddEventHandler('esx:onRemoveInventoryItem', function(source, item, count)
    local player = ESX.GetPlayerFromId(source)
    if item.name == 'policeradar' then
        TriggerEvent("police:server:UpdateBlips")
    end
end)

AddEventHandler('esx:onAddInventoryItem', function(source, item, count)
    local player = ESX.GetPlayerFromId(source)
    if item.name == 'policeradar' then
        TriggerEvent("police:server:UpdateBlips")
    end
end)

RegisterServerEvent("police:server:UpdateBlips")
AddEventHandler("police:server:UpdateBlips", function()
    local Players = ESX.GetPlayers()
    local dutyPlayers = {}
    for k,v in pairs(Players) do
        local xPlayer = ESX.GetPlayerFromId(v)
        if xPlayer.getInventoryItem('policeradar').count > 0 and (xPlayer.job.name == "police" or xPlayer.job.name == "ambulance")then
            dutyPlayers[v] = xPlayer
        end
    end
    TriggerClientEvent('police:client:UpdateBlips', -1, dutyPlayers)
end)


ESX.RegisterServerCallback("police:GetImpoundedVehicles", function(source, cb, category)
    local vehicles = {}

    MySQL.Async.fetchAll("SELECT * FROM `owned_vehicles` WHERE `garage` = 'Police'", {}, cb)
end)

RegisterServerEvent("police:server:impound")
AddEventHandler("police:server:impound", function(plate)
    MySQL.Sync.execute("UPDATE owned_vehicles SET garage=@garage WHERE plate=@plate",{['@garage'] = "Police" , ['@plate'] = plate})
    MySQL.Sync.execute("UPDATE owned_vehicles SET state=@state WHERE plate=@plate",{['@state'] = true , ['@plate'] = plate})
end)

RegisterServerEvent("police:server:outOfImpound")
AddEventHandler("police:server:outOfImpound", function(plate)
    MySQL.Sync.execute("UPDATE owned_vehicles SET garage=@garage WHERE plate=@plate",{['@garage'] = "A" , ['@plate'] = plate})
    MySQL.Sync.execute("UPDATE owned_vehicles SET state=@state WHERE plate=@plate",{['@state'] = true , ['@plate'] = plate})
end)

ESX.RegisterServerCallback('police:FineList', function(source, cb, category)
	MySQL.Async.fetchAll('SELECT * FROM fine_types', {}, function(fines)
		cb(fines)
	end)
end)

ObjectList = {}

RegisterServerEvent("police:server:spawnObject")
AddEventHandler("police:server:spawnObject", function(object)
    TriggerClientEvent('police:client:spawnObject', -1,#ObjectList+1, object, source)
end)

RegisterServerEvent("police:server:deleteObject")
AddEventHandler("police:server:deleteObject", function(id)
    TriggerClientEvent('police:client:removeObject', -1,id)
end)

RegisterServerEvent("police:server:setObjects")
AddEventHandler("police:server:setObjects", function(table)
    ObjectList = table
end)

RegisterServerEvent("police:server:wantObjects")
AddEventHandler("police:server:wantObjects", function()
    TriggerClientEvent("police:client:setObjects", source, ObjectList)
end)

RegisterNetEvent('police:addLicense')
AddEventHandler('police:addLicense', function(id)
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

            TriggerClientEvent('notification', _target, 'Recibe la licencia de armas.', 1)

        else
            TriggerClientEvent('notification', _source, GetPlayerName(_target) .. ' ya tengo licencia de armas.', 2)
        end
    end)

	if xPlayer.getInventoryItem('license_weapon').count == 0 then
		xPlayer.addInventoryItem('license_weapon', 1)
	end
end)

RegisterServerEvent('police:duty')
AddEventHandler('police:duty' , function(state)
    local player = ESX.GetPlayerFromId(source)
    local job = player.job

    if state == true then
        player.setJob('police', job.grade)
    else
        player.setJob('offpolice', job.grade)
    end
end)

RegisterServerEvent('police:personalStash')
AddEventHandler('police:personalStash' , function()
    local Steam = GetPlayerIdentifiers(source)[1]

    TriggerClientEvent('inventory:stash', source, 'Alijo personal de la policía ' .. Steam)
end)

RegisterServerEvent('police:remmaskGranted')
AddEventHandler('police:remmaskGranted' , function(id)
    TriggerClientEvent('police:remmaskAccepted', id or source)
end)

RegisterServerEvent('police:targetCheckBank')
AddEventHandler('police:targetCheckBank' , function(id)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xTarget = ESX.GetPlayerFromId(id)
 
    TriggerClientEvent('notification', source,'Target bank balance: $' .. xTarget.getBank())
end)
