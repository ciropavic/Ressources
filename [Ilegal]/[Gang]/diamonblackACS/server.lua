--------------------------------
------- Created by Hamza -------
-------------------------------- 

local ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent("esx_diamonblackArmory:weaponTakenOut")
AddEventHandler("esx_diamonblackArmory:weaponTakenOut", function(weapon,giveAmmo)
    local xPlayer = ESX.GetPlayerFromId(source)
    local id = ESX.GetPlayerFromId(source).getIdentifier()
	
    if xPlayer then
    local id = ESX.GetPlayerFromId(source).getIdentifier()
		MySQL.Async.fetchAll("SELECT weapons FROM user_diamonblackArmory WHERE identifier='".. id .."'", {}, function(weapRow)
			local addWeaponToDB
			for k,v in pairs(weapRow) do
				addWeaponToDB = v.weapons
			end
			addWeaponToDB = addWeaponToDB .. weapon .. ", "
			MySQL.Async.execute("UPDATE user_diamonblackArmory SET weapons='".. addWeaponToDB .."' WHERE identifier='".. id .."'", {}, function ()
			end)
		end)
        xPlayer.addWeapon(weapon, Config.AmmountOfAmmo)
		local DATE = os.date("%H:%M (%d.%m.%y)")
		local message = "**" ..GetPlayerName(source).. "** [" ..xPlayer.getIdentifier().. "] **|** has **taken** " .. ESX.GetWeaponLabel(weapon) .. " de la Armería de la Policía **|** " ..DATE
		PerformHttpRequest(""..Config.DiscordWebook.."", function(err, text, headers) end, 'POST', json.encode({username = "Armeria Policial", content = message}), { ['Content-Type'] = 'application/json' })
		TriggerClientEvent("esx:showNotification", source, "Usted ~y~tomó~s~ 1x ~r~" .. ESX.GetWeaponLabel(weapon).."~r~")
    end
	
end)

RegisterServerEvent("esx_diamonblackArmory:weaponInStock")
AddEventHandler("esx_diamonblackArmory:weaponInStock", function(weapon,ammo,giveAmmo)
    local xPlayer = ESX.GetPlayerFromId(source)
    local id = ESX.GetPlayerFromId(source).getIdentifier()

    if xPlayer then
        xPlayer.removeWeapon(weapon, ammo)
		MySQL.Async.fetchAll("SELECT weapons FROM user_diamonblackArmory WHERE identifier='".. id .."'", {}, function(weapRow)
			for k,v in pairs(weapRow) do
				removeWeaponFromDB = string.gsub(v.weapons,weapon .. ", ", "")
			end
			MySQL.Async.execute("UPDATE user_diamonblackArmory SET weapons='".. removeWeaponFromDB .."' WHERE identifier='".. id .."'", {}, function ()
			end)
		end)
		local DATE = os.date("%H:%M (%d.%m.%y)")
		local message = "**" ..GetPlayerName(source).. "** [" ..xPlayer.getIdentifier().. "] **|** has **put** " .. ESX.GetWeaponLabel(weapon) .. " back into the diamonblack Armory **|** " ..DATE
		PerformHttpRequest(""..Config.DiscordWebook.."", function(err, text, headers) end, 'POST', json.encode({username = "diamondblack Armory", content = message}), { ['Content-Type'] = 'application/json' })
        TriggerClientEvent("esx:showNotification", source, "Tu ~y~ volviste~s~ 1x ~r~" .. ESX.GetWeaponLabel(weapon) .. "~r~")
    end
	
end)

ESX.RegisterServerCallback("esx_diamonblackArmory:getWeaponState", function(source, cb)
    local id = ESX.GetPlayerFromId(source).getIdentifier()
    MySQL.Async.fetchAll('SELECT weapons FROM user_diamonblackArmory WHERE identifier = \"' .. id .. '\"', {}, function(rowsChanged)
        if next(rowsChanged) == nil then
            MySQL.Async.execute("INSERT INTO user_diamonblackArmory (identifier,weapons) VALUES(\"" ..id .. "\",\"\")", {}, function () end)
            cb(nil)
        end
        cb(rowsChanged)
    end)
end)

ESX.RegisterServerCallback("esx_diamonblackArmory:checkdiamonblackOnline", function(source, cb)
    MySQL.Async.fetchAll('SELECT * FROM user_diamonblackArmory', {}, function(rowsChanged)
        local diamonblack = {}
        for k,v in pairs(rowsChanged) do
            local xPlayer = ESX.GetPlayerFromIdentifier(v.identifier)
            if xPlayer ~= nil then
                table.insert(diamonblack,{id = v.identifier,name = GetPlayerName(source),job = xPlayer.getJob()})
            end
        end
        cb(diamonblack)
    end)
end)

RegisterServerEvent("esx_diamonblackArmory:restockWeapons")
AddEventHandler("esx_diamonblackArmory:restockWeapons", function(id)
    MySQL.Async.execute("UPDATE user_diamonblackArmory SET weapons= \"\" WHERE identifier=\"" .. id .. "\"", {}, function ()
    end)
	local xPlayer = ESX.GetPlayerFromId(source)
	local target = ESX.GetPlayerFromIdentifier(id)
	local DATE = os.date("%H:%M (%d.%m.%y)")
	local message = "**" ..GetPlayerName(source).. "** [" ..xPlayer.getIdentifier().. "] **|** has **restocked** weapons for **" ..target.getName().. "** **|** " ..DATE
	PerformHttpRequest(""..Config.DiscordWebook.."", function(err, text, headers) end, 'POST', json.encode({username = "diamonblack Armory", content = message}), { ['Content-Type'] = 'application/json' })	
end)
