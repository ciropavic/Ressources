ESX                = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- On Jail
local frozen = {}
TriggerEvent('es:addGroupCommand', 'adminjail', "superadmin", function(src, args, raw)

	local xPlayer = ESX.GetPlayerFromId(src)


		local jailPlayer = args[1]
		local jailTime = tonumber(args[2])
		local jailReason = table.concat(args, " ",3)
		local xTarget  = ESX.GetPlayerFromId(jailPlayer)

		if GetPlayerName(jailPlayer) ~= nil then

			if jailTime ~= nil then
				JailPlayer(jailPlayer, jailTime)

				TriggerClientEvent("notification", src, GetPlayerName(jailPlayer) .. " Encarcelado por " .. jailTime .. " minutos!")
				xTarget.addInventoryItem('bread', 10)
				xTarget.addInventoryItem('water', 10)

				sendToDiscord('** ' .. GetPlayerName(jailPlayer) .. ' Está en la cárcel administrativa | Por ' .. GetPlayerName(src) .. ' por ' .. jailTime .. ' Minutos**'  )

				args[3] = args[3] or ""
				if args[3] ~= nil then

					GetDiscord(jailPlayer, function(discord)
						TriggerClientEvent('chat:addMessage', -1, {
							template = '<div style="font-size: 18px;padding:1px; display:inline-block; direction: rtl;border-radius: 5px;"> <p><span style="background-color: rgba(255, 0, 0);border-radius:5px;"><span style="font-size:14px;"></span><b> 🔗 {0} </b></span></font></p></div>',
							args = { ( '^*' .. 'Admin Carcel : ' .. discord .. ' Está en la cárcel por '  .. jailTime .. ' Minutos^r ' .. jailReason .. '' ) }
						})
					end)
				end
			else
				TriggerClientEvent("notification", src, "¡Esta vez no es válida!", 2)
			end
		else
			TriggerClientEvent("notification", src, "¡Esta identificación no está en línea!", 2)
		end

end, function(source, args, user)

	TriggerClientEvent('chat:addMessage', source, {
		template = '<div class="chat-message server"><b>SYSTEMA</b> Permisos insuficientes!</div>',
		args = {}
	})

end, {help = "Admin Jail Player", params = {{name = "userid", help = "La identificación del jugador"}}})


TriggerEvent('es:addGroupCommand', 'unadminjail', "superadmin", function(src, args, raw)
	local xPlayer = ESX.GetPlayerFromId(src)
	local jailPlayer = args[1]

	if GetPlayerName(jailPlayer) ~= nil then
		UnJail(jailPlayer)
	else
		TriggerClientEvent("notification", src, "This ID is not online!", 2)
	end


end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, {
		template = '<div class="chat-message server"><b>SYSTEM</b> Insufficienct permissions!</div>',
		args = {}
	})
end, {help = "Un Admin Jail Player", params = {{name = "userid", help = "The ID of the player"}}})




RegisterServerEvent("ev-adminjail:unJailPlayer")
AddEventHandler("ev-adminjail:unJailPlayer", function(targetIdentifier)
	local src = source
	local xPlayer = ESX.GetPlayerFromIdentifier(targetIdentifier)

	if xPlayer ~= nil then
		UnJail(xPlayer.source)
	else
		MySQL.Async.execute(
			"UPDATE users SET ev-adminjail = @newJailTime WHERE identifier = @identifier",
			{
				['@identifier'] = targetIdentifier,
				['@newJailTime'] = 0
			}
		)
	end

	TriggerClientEvent("notification", src, xPlayer.name .. " Unjailed!")
end)

RegisterServerEvent("ev-adminjail:givefood")
AddEventHandler("ev-adminjail:givefood", function(target)
--	local source = target
	local xPlayer  = ESX.GetPlayerFromId(source)
	XPlayer.addInventoryItem('bread', 10)
	XPlayer.addInventoryItem('water', 10)

end)

RegisterServerEvent("ev-adminjail:updateJailTime")
AddEventHandler("ev-adminjail:updateJailTime", function(newJailTime)
	local src = source

	EditJailTime(src, newJailTime)
end)

function JailPlayer(jailPlayer, jailTime)
	TriggerClientEvent("ev-adminjail:jailPlayer", jailPlayer, jailTime)

	EditJailTime(jailPlayer, jailTime)
end

function UnJail(jailPlayer)
	TriggerClientEvent("ev-adminjail:unJailPlayer", jailPlayer)

	EditJailTime(jailPlayer, 0)
end

function EditJailTime(source, jailTime)

	local src = source

	local xPlayer = ESX.GetPlayerFromId(src)
	local Identifier = xPlayer.identifier

	MySQL.Async.execute(
       "UPDATE users SET adminjail = @newJailTime WHERE identifier = @identifier",
        {
			['@identifier'] = Identifier,
			['@newJailTime'] = tonumber(jailTime)
		}
	)
end

function GetRPName(playerId, data)
	local Identifier = ESX.GetPlayerFromId(playerId).identifier

	MySQL.Async.fetchAll("SELECT firstname, lastname FROM users WHERE identifier = @identifier", { ["@identifier"] = Identifier }, function(result)

		data(result[1].firstname, result[1].lastname)

	end)
end

ESX.RegisterServerCallback("ev-adminjail:retrieveJailedPlayers", function(source, cb)
	
	local jailedPersons = {}

	MySQL.Async.fetchAll("SELECT firstname, lastname, ev-adminjail, identifier FROM users WHERE jail > @jail", { ["@jail"] = 0 }, function(result)

		for i = 1, #result, 1 do
			table.insert(jailedPersons, { name = result[i].firstname .. " " .. result[i].lastname, jailTime = result[i].ev-adminjail, identifier = result[i].identifier })
		end

		cb(jailedPersons)
	end)
end)

ESX.RegisterServerCallback("ev-adminjail:retrieveJailTime", function(source, cb)

	local src = source

	local xPlayer = ESX.GetPlayerFromId(src)
	local Identifier = xPlayer.identifier


	MySQL.Async.fetchAll("SELECT adminjail FROM users WHERE identifier = @identifier", { ["@identifier"] = Identifier }, function(result)

		local JailTime = tonumber(result[1].adminjail)

		if JailTime > 0 then

			cb(true, JailTime)
		else
			cb(false, 0)
		end

	end)
end)

function sendToDiscord(message)
	local DiscordWebHook = Config.Discord
	PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
end

function GetDiscord(source,cb)
	local source = source
	local num = 0
	local num2 = GetNumPlayerIdentifiers(source)
	local discord = nil
	while num < num2 and not discord do
	local a = GetPlayerIdentifier(source, num)
	if string.find(a, "discord") then discord = string.sub(a, 9) end
		num = num+1
	end


	if not discord then
		cb(GetPlayerName(source))
	else
    	PerformHttpRequest("https://discordapp.com/api/users/"..discord, function(err, text, headers)
			if err == 200 then
				cb(json.decode(text).username .. '#' .. json.decode(text).discriminator)
			else
				cb(GetPlayerName(source))
			end

		end, "GET", "", {["Content-type"] = "application/json", ["Authorization"] = "Bot NzEyNjIzMjQ5MDQwNjA1Mjg1.XxoK-w.yXUPYOiMg1fBda1Adh8qO65cVz4"})
	end
end
