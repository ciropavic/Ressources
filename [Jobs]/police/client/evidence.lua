StatusList = {
	["fight"] = "Manos rojas",
	["widepupils"] = "Pupilas dilatadas",
	["redeyes"] = "ojos rojos",
	["weedsmell"] = "Huele a hierba",
	["alcohol"] = "Aliento huele a alcohol",
	["gunpowder"] = "Rastros de polvo en la ropa",
	["chemicals"] = "Huele a químico",
	["heavybreath"] = "Está respirando pesadamente",
	["sweat"] = "Suda mucho",
    ["handbleed"] = "Sangre en tus manos",
	["confused"] = "Confundido",
	["alcohol"] = "Huele a alcohol",
	["heavyalcohol"] = "Huele mucho a alcohol",
}

CurrentStatusList = {}
Casings = {}
CasingsNear = {}
CurrentCasing = nil
Blooddrops = {}
BlooddropsNear = {}
CurrentBlooddrop = nil
Fingerprints = {}
FingerprintsNear = {}
CurrentFingerprint = 0

RegisterNetEvent('evidence:client:SetStatus')
AddEventHandler('evidence:client:SetStatus', function(statusId, time)
	if time > 0 and StatusList[statusId] ~= nil then 
		if (CurrentStatusList == nil or CurrentStatusList[statusId] == nil) or (CurrentStatusList[statusId] ~= nil and CurrentStatusList[statusId].time < 20) then
			CurrentStatusList[statusId] = {text = StatusList[statusId], time = time}
			--TriggerEvent("chatMessage", "STATUS", "warning", CurrentStatusList[statusId].text)
		end
	elseif StatusList[statusId] ~= nil then
		CurrentStatusList[statusId] = nil
	end
	TriggerServerEvent("evidence:server:UpdateStatus", CurrentStatusList)
end)

RegisterNetEvent('evidence:client:AddBlooddrop')
AddEventHandler('evidence:client:AddBlooddrop', function(bloodId, citizenid, bloodtype, coords)
    Blooddrops[bloodId] = {
		citizenid = citizenid,
		bloodtype = bloodtype,
		coords = {
			x = coords.x,
			y = coords.y, 
			z = coords.z - 0.9,
		}
	}
end)

RegisterNetEvent("evidence:client:RemoveBlooddrop")
AddEventHandler("evidence:client:RemoveBlooddrop", function(bloodId)
	Blooddrops[bloodId] = nil
	BlooddropsNear[bloodId] = nil
    CurrentBlooddrop = 0
end)

RegisterNetEvent('evidence:client:AddFingerPrint')
AddEventHandler('evidence:client:AddFingerPrint', function(fingerId, fingerprint, coords)
    Fingerprints[fingerId] = {
		fingerprint = fingerprint,
		coords = {
			x = coords.x,
			y = coords.y, 
			z = coords.z - 0.9,
		}
	}
end)

RegisterNetEvent("evidence:client:RemoveFingerprint")
AddEventHandler("evidence:client:RemoveFingerprint", function(fingerId)
	Fingerprints[fingerId] = nil
	FingerprintsNear[fingerId] = nil
    CurrentFingerprint = 0
end)

RegisterNetEvent("evidence:client:ClearBlooddropsInArea")
AddEventHandler("evidence:client:ClearBlooddropsInArea", function()
	local pos = GetEntityCoords(GetPlayerPed(-1))
	local blooddropList = {}
	Progressbar("clear_blooddrops", "Sacando sangre..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
	}, {}, {}, {}, function() -- Done
		if Blooddrops ~= nil and next(Blooddrops) ~= nil then 
			for bloodId, v in pairs(Blooddrops) do
				if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Blooddrops[bloodId].coords.x, Blooddrops[bloodId].coords.y, Blooddrops[bloodId].coords.z, true) < 10.0 then
					table.insert(blooddropList, bloodId)
				end
			end
			TriggerServerEvent("evidence:server:ClearBlooddrops", blooddropList)
			TriggerEvent('notification', "Sangre quitada :)")
		end
    end, function() -- Cancel
        TriggerEvent('notification', "Sangre no extraída!", 2)
    end)
end)

RegisterNetEvent('evidence:client:AddCasing')
AddEventHandler('evidence:client:AddCasing', function(casingId, weapon, coords, serie)
    Casings[casingId] = {
		type = weapon,
		serie = serie ~= nil and serie or "Número de serie no visible..",
		coords = {
			x = coords.x,
			y = coords.y, 
			z = coords.z - 0.9,
		}
	}
end)

RegisterNetEvent("evidence:client:RemoveCasing")
AddEventHandler("evidence:client:RemoveCasing", function(casingId)
	Casings[casingId] = nil
	CasingsNear[casingId] = nil
    CurrentCasing = 0
end)

RegisterNetEvent("evidence:client:ClearCasingsInArea")
AddEventHandler("evidence:client:ClearCasingsInArea", function()
	local pos = GetEntityCoords(GetPlayerPed(-1))
	local casingList = {}
	Progressbar("clear_casings", "Retire las mangas de la bola..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
	}, {}, {}, {}, function() -- Done
		if Casings ~= nil and next(Casings) ~= nil then 
			for casingId, v in pairs(Casings) do
				if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Casings[casingId].coords.x, Casings[casingId].coords.y, Casings[casingId].coords.z, true) < 10.0 then
					table.insert(casingList, casingId)
				end
			end
			TriggerServerEvent("evidence:server:ClearCasings", casingList)
			TriggerEvent('notification', "Se quitaron las mangas de bala :) ")
end
    end, function() -- Cancel
        TriggerEvent('notification', "No se quitaron las mangas de la bola!", 2)
    end)
end)

local shotAmount = 0

--[[
	Decrease time of every status every 10 seconds
]]
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10000)
		if CurrentStatusList ~= nil and next(CurrentStatusList) ~= nil then
			for k, v in pairs(CurrentStatusList) do
				if CurrentStatusList[k].time > 0 then
					CurrentStatusList[k].time = CurrentStatusList[k].time - 10
				else
					CurrentStatusList[k].time = 0
				end
			end
			TriggerServerEvent("evidence:server:UpdateStatus", CurrentStatusList)
		end
		if shotAmount > 0 then
			shotAmount = 0
		end
	end
end)

--[[
	Gunpowder Status when shooting
]]
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if IsPedShooting(GetPlayerPed(-1)) or IsPedDoingDriveby(GetPlayerPed(-1)) then
			local weapon = GetSelectedPedWeapon(GetPlayerPed(-1))
			if weapon ~= GetHashKey("WEAPON_UNARMED") and weapon ~= GetHashKey("WEAPON_SNOWBALL") and weapon ~= GetHashKey("WEAPON_STUNGUN") and weapon ~= GetHashKey("WEAPON_PETROLCAN") and weapon ~= GetHashKey("WEAPON_FIREEXTINGUISHER") then
				shotAmount = shotAmount + 1
				if shotAmount > 5 and (CurrentStatusList == nil or CurrentStatusList["gunpowder"] == nil) then
					if math.random(1, 10) <= 7 then
						TriggerEvent("evidence:client:SetStatus", "gunpowder", 200)
					end
				end
				DropBulletCasing(weapon)
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do

		while not ESX or not ESX.PlayerData.job do
			Citizen.Wait(10)
		end

		Citizen.Wait(10)
		if true then 
			if ESX.PlayerData.job.name == "police" then
				if IsPlayerFreeAiming(PlayerId()) and GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_FLASHLIGHT") then
					if next(Casings) ~= nil then
						local pos = GetEntityCoords(GetPlayerPed(-1), true)
						for k, v in pairs(Casings) do
							if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, v.coords.x, v.coords.y, v.coords.z, true) < 12.5 then
								CasingsNear[k] = v
								if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, v.coords.x, v.coords.y, v.coords.z, true) < 1.5 then
									CurrentCasing = k
								end
							else
								CasingsNear[k] = nil
							end
						end
					else
						CasingsNear = {}
					end
					if next(Blooddrops) ~= nil then
						local pos = GetEntityCoords(GetPlayerPed(-1), true)
						for k, v in pairs(Blooddrops) do
							if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, v.coords.x, v.coords.y, v.coords.z, true) < 12.5 then
								BlooddropsNear[k] = v
								if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, v.coords.x, v.coords.y, v.coords.z, true) < 1.5 then
									CurrentBlooddrop = k
								end
							else
								BlooddropsNear[k] = nil
							end
						end
					else
						BlooddropsNear = {}
					end
					if next(Fingerprints) ~= nil then
						local pos = GetEntityCoords(GetPlayerPed(-1), true)
						for k, v in pairs(Fingerprints) do
							if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, v.coords.x, v.coords.y, v.coords.z, true) < 12.5 then
								FingerprintsNear[k] = v
								if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, v.coords.x, v.coords.y, v.coords.z, true) < 1.5 then
									CurrentFingerprint = k
								end
							else
								FingerprintsNear[k] = nil
							end
						end
					else
						FingerprintsNear = {}
					end
				else
					Citizen.Wait(1000)
				end
			else
				Citizen.Wait(5000)
			end
		end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
		if true and BlooddropsNear ~= nil then
			if IsPlayerFreeAiming(PlayerId()) and GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_FLASHLIGHT") then
				if ESX.PlayerData.job.name == "police" then
					for k, v in pairs(BlooddropsNear) do
						if v ~= nil then
							DrawMarker(27, v.coords.x, v.coords.y, v.coords.z - 0.05, 0.0, 0.0, 0.0, 180.0, 0.0, 0.0, 0.11, 0.11, 0.3, 250, 0, 50, 255, false, true, 2, false, false, false, false)
						end
					end
				end
			else
				Citizen.Wait(1000)
			end
		else
			Citizen.Wait(1000)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
		if true and CasingsNear ~= nil then
			if IsPlayerFreeAiming(PlayerId()) and GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_FLASHLIGHT") then
				if ESX.PlayerData.job.name == "police" then
					for k, v in pairs(CasingsNear) do
						if v ~= nil then
							DrawMarker(27, v.coords.x, v.coords.y, v.coords.z - 0.05, 0.0, 0.0, 0.0, 180.0, 0.0, 0.0, 0.11, 0.11, 0.3, 50, 0, 250, 255, false, true, 2, false, false, false, false)
						end
					end
				end
			else
				Citizen.Wait(1000)
			end
		else
			Citizen.Wait(1000)
        end
    end
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
		if true and FingerprintsNear ~= nil then
			if IsPlayerFreeAiming(PlayerId()) and GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_FLASHLIGHT") then
				if ESX.PlayerData.job.name == "police" then
					for k, v in pairs(FingerprintsNear) do
						if v ~= nil then
							DrawMarker(27, v.coords.x, v.coords.y, v.coords.z - 0.05, 0.0, 0.0, 0.0, 180.0, 0.0, 0.0, 0.11, 0.11, 0.3, 23, 173, 12, 255, false, true, 2, false, false, false, false)
						end
					end
				end
			else
				Citizen.Wait(1000)
			end
		else
			Citizen.Wait(1000)
        end
    end
end)


function IsPedNearby()
	local retval = false
	local PlayerPeds = {}
    for _, player in ipairs(GetActivePlayers()) do
        local ped = GetPlayerPed(player)
        table.insert(PlayerPeds, ped)
    end
    local player = GetPlayerPed(-1)
    local coords = GetEntityCoords(player)
	local closestPed, closestDistance = GetClosestPed(coords, PlayerPeds)
	if not IsEntityDead(closestPed) and closestDistance < 100.0 then
		retval = true
	end
	return retval
end

function GetClosestPed(coords, ignoreList)
	local ignoreList      = ignoreList or {}
	local peds            = GetPeds(ignoreList)
	local closestDistance = -1
    local closestPed      = -1
    
    if coords == nil then
        coords = GetEntityCoords(GetPlayerPed(-1))
    end

	for i=1, #peds, 1 do
		local pedCoords = GetEntityCoords(peds[i])
		local distance  = GetDistanceBetweenCoords(pedCoords, coords.x, coords.y, coords.z, true)

		if closestDistance == -1 or closestDistance > distance then
			closestPed      = peds[i]
			closestDistance = distance
		end
	end

	return closestPed, closestDistance
end

function EnumerateEntities(initFunc, moveFunc, disposeFunc)
	return coroutine.wrap(function()
		local iter, id = initFunc()
		if not id or id == 0 then
			disposeFunc(iter)
			return
		end

		local enum = {handle = iter, destructor = disposeFunc}
		setmetatable(enum, entityEnumerator)

		local next = true
		repeat
		coroutine.yield(id)
		next, id = moveFunc(iter)
		until not next

		enum.destructor, enum.handle = nil, nil
		disposeFunc(iter)
    end)
end

function GetPeds(ignoreList)
    local ignoreList = ignoreList or {}
	local peds       = {}
	for ped in EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed) do
		local found = false

        for j=1, #ignoreList, 1 do
			if ignoreList[j] == ped then
				found = true
			end
		end

		if not found then
			table.insert(peds, ped)
		end
	end

	return peds
end

function IsSilentWeapon(weapon)
	local retval = false
	
	for k, v in pairs(SilentWeapons) do
		if GetHashKey(v) == weapon then 
			retval = true
		end
	end

	if not retval then 
		return IsPedCurrentWeaponSilenced(PlayerPedId())
	else
		return retval
	end
end

function DropBulletCasing(weapon)
	local randX = math.random() + math.random(-1, 1)
	local randY = math.random() + math.random(-1, 1)
	local coords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(GetPlayerFromServerId(playerId)), randX, randY, 0)
	TriggerServerEvent("evidence:server:CreateCasing", weapon, coords)
	Citizen.Wait(300)
end

function DnaHash(s)
    local h = string.gsub(s, ".", function(c)
		return string.format("%02x", string.byte(c))
	end)
    return h
end