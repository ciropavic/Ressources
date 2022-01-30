Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local firstSpawn, PlayerLoaded = true, false

EHeld = 500
isDead = false
ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(100)
	end

	PlayerLoaded = true
	ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
	PlayerLoaded = true
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

AddEventHandler('playerSpawned', function()
	isDead = false

	if firstSpawn then
		exports.spawnmanager:setAutoSpawn(false) -- disable respawn
		firstSpawn = false

		ESX.TriggerServerCallback('esx_ambulancejob:getDeathStatus', function(shouldDie)
			if shouldDie and Config.AntiCombatLog then
				while not PlayerLoaded do
					Citizen.Wait(1000)
				end

				ESX.ShowNotification(_U('combatlog_message'))
				RespawnPlayer()
			end
		end)
	else
		TriggerServerEvent('esx_ambulancejob:onPlayerSpawn')
		ExecuteCommand("/tp -1255.63 2112.18 23.33")
	end
end)

-- Create blips
Citizen.CreateThread(function()
	for k,v in pairs(Config.Hospitals) do
		local blip = AddBlipForCoord(v.Blip.coords)

		SetBlipSprite(blip, v.Blip.sprite)
		SetBlipScale(blip, v.Blip.scale)
		SetBlipColour(blip, v.Blip.color)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName('STRING')
		AddTextComponentSubstringPlayerName(_U('blip_hospital'))
		EndTextCommandSetBlipName(blip)
	end
end)

-- Disable most inputs when dead
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()

		if isDead then
			DisableInputGroup(0)
			DisableInputGroup(1)
			DisableInputGroup(2)
			DisableControlAction(1, 19, true)
			DisableControlAction(0, 34, true)
			DisableControlAction(0, 9, true)
	
			DisableControlAction(0, 288, true)
			DisableControlAction(0, 289, true)
			DisableControlAction(0, 170, true)
			DisableControlAction(0, 73, true)
			DisableControlAction(0, 79, true)
			DisableControlAction(0, 305, true)
			DisableControlAction(0, 82, true)
			DisableControlAction(0, 182, true)

			DisableControlAction(0, 32, true)
			DisableControlAction(0, 8, true)
			DisableControlAction(2, 31, true)
			DisableControlAction(2, 32, true)
			DisableControlAction(1, 33, true)
			DisableControlAction(1, 34, true)
			DisableControlAction(1, 35, true)
			DisableControlAction(1, 21, true)  -- space
			DisableControlAction(1, 22, true)  -- space
			DisableControlAction(1, 23, true)  -- F
			DisableControlAction(1, 24, true)  -- F
			DisableControlAction(1, 25, true)  -- F
	
	
			DisableControlAction(1, 106, true) -- VehicleMouseControlOverride
			DisableControlAction(1, 140, true) --Disables Melee Actions
			DisableControlAction(1, 141, true) --Disables Melee Actions
			DisableControlAction(1, 142, true) --Disables Melee Actions 
			DisableControlAction(1, 37, true) --Disables INPUT_SELECT_WEAPON (tab) Actions
			DisablePlayerFiring(playerPed, true) -- Disable weapon firing

			local currentVehicle = GetVehiclePedIsIn(playerPed, false)
			if playerPed ==  GetPedInVehicleSeat(currentVehicle, -1) then
				SetVehicleUndriveable(currentVehicle,true)
			end

		else
			Citizen.Wait(500)
		end
	end
end)

function OnPlayerDeath()
	isDead = true
	ESX.UI.Menu.CloseAll()
	TriggerServerEvent('esx_ambulancejob:setDeathStatus', true)

	StartDeathTimer()
	SendDistressSignal()

end


function SendDistressSignal()
	local playerPed = PlayerPedId()
	PedPosition		= GetEntityCoords(playerPed)
	
	local PlayerCoords = { x = PedPosition.x, y = PedPosition.y, z = PedPosition.z }

	TriggerEvent('notification', 'Se ha enviado la señal de ayuda a los ems disponibles!', 2)

    TriggerServerEvent('esx_addons_gcphone:startCall', 'ambulance', _U('distress_message'), PlayerCoords, {

		PlayerCoords = { x = PedPosition.x, y = PedPosition.y, z = PedPosition.z },
	})
end

function drawTxt(x,y ,width,height,scale, text, r,g,b,a, outline)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(2, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

function secondsToClock(seconds)
	local seconds, hours, mins, secs = tonumber(seconds), 0, 0, 0

	if seconds <= 0 then
		return 0, 0
	else
		local hours = string.format("%02.f", math.floor(seconds / 3600))
		local mins = string.format("%02.f", math.floor(seconds / 60 - (hours * 60)))
		local secs = string.format("%02.f", math.floor(seconds - hours * 3600 - mins * 60))

		return mins, secs
	end
end

function StartDeathTimer()

	local earlySpawnTimer = ESX.Math.Round(Config.EarlyRespawnTimer / 1000)
	local bleedoutTimer = ESX.Math.Round(Config.BleedoutTimer / 1000)

	Citizen.CreateThread(function()
		-- early respawn timer
		while earlySpawnTimer > 0 and isDead do
			Citizen.Wait(1000)

			if earlySpawnTimer > 0 then
				earlySpawnTimer = earlySpawnTimer - 1
			end
		end

		-- bleedout timer
		while bleedoutTimer > 0 and isDead do
			Citizen.Wait(1000)

			if bleedoutTimer > 0 then
				bleedoutTimer = bleedoutTimer - 1
			end
		end
	end)

	Citizen.CreateThread(function()
		local text, timeHeld

		-- early respawn timer
		while earlySpawnTimer > 0 and isDead do
			Citizen.Wait(0)
			drawTxt(0.89, 1.44, 1.0,1.0,0.6, "Reaparecer: ~r~" .. math.ceil(earlySpawnTimer) .. "~w~ segundos restantes", 255, 255, 255, 255)
		end

		-- bleedout timer
		while isDead do
			Citizen.Wait(0)
			if IsControlPressed(1,38) then
                EHeld = EHeld - 1
                if EHeld < 1 then
					RespawnPlayer()
					break
                end
            else
                EHeld = 500
			end
		
			drawTxt(0.89, 1.44, 1.0,1.0,0.6, "~w~Presiona ~r~E ~w~(" .. math.ceil(EHeld/100) .. ") ~w~PARA ~r~REAPARECER ~w~", 255, 255, 255, 255)
		end
			
	end)
end

function RemoveItemsAfterRPDeath()
	TriggerServerEvent('esx_ambulancejob:setDeathStatus', false)

	Citizen.CreateThread(function()
		DoScreenFadeOut(800)

		while not IsScreenFadedOut() do
			Citizen.Wait(10)
		end

		ESX.TriggerServerCallback('esx_ambulancejob:removeItemsAfterRPDeath', function()

			ESX.SetPlayerData('loadout', {})
			StopScreenEffect('DeathFailOut')
			DoScreenFadeIn(800)
		end)
	end)
end



function RespawnPlayer()
	TriggerServerEvent('esx_ambulancejob:setDeathStatus', false)

	Citizen.CreateThread(function()
		DoScreenFadeOut(800)

		while not IsScreenFadedOut() do
			Citizen.Wait(10)
		end

		ESX.TriggerServerCallback('esx_ambulancejob:RespawnPlayer', function()
			local playerpos = GetEntityCoords( GetPlayerPed(-1) )
			ExecuteCommand("ensureInv")
			RespawnPed(PlayerPedId(), playerpos, Config.RespawnPoint.heading)
			TriggerServerEvent('esx_ambulancejob:setDeathStatus', false)		
				ESX.TriggerServerCallback('esx_ambulancejob:removeItemsAfterRPDeath', function()
					ESX.SetPlayerData('loadout', {})		
					TriggerServerEvent('esx:updateLastPosition', playerpos)
					TriggerServerEvent('mythic_hospital:server:RequestBed')
					TriggerServerEvent('giveIDCard')
					Citizen.Wait(10)
					DoScreenFadeIn(200)
			end)
		end)
	end)
end

function RespawnPed(ped, coords, heading)
	SetEntityCoordsNoOffset(ped, coords.x, coords.y, coords.z, false, false, false, true)
	NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, heading, true, false)
	SetPlayerInvincible(ped, false)
	TriggerEvent('playerSpawned', coords.x, coords.y, coords.z)
	ClearPedBloodDamage(ped)

	ESX.UI.Menu.CloseAll()
end

AddEventHandler('esx:onPlayerDeath', function(data)
	OnPlayerDeath()
end)

RegisterNetEvent('esx_ambulancejob:revive')
AddEventHandler('esx_ambulancejob:revive', function()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)

	TriggerServerEvent('esx_ambulancejob:setDeathStatus', false)

	Citizen.CreateThread(function()
		DoScreenFadeOut(800)

		while not IsScreenFadedOut() do
			Citizen.Wait(50)
		end

		local formattedCoords = {
			x = ESX.Math.Round(coords.x, 0),
			y = ESX.Math.Round(coords.y, 0),
			z = ESX.Math.Round(coords.z, 0)
		}

		ESX.SetPlayerData('lastPosition', formattedCoords)

		TriggerServerEvent('esx:updateLastPosition', formattedCoords)

		RespawnPed(playerPed, formattedCoords, 0.0)
		--ExecuteCommand("/tp -1255.63 2112.18 23.33")

		DoScreenFadeIn(200)
	end)
end)


function loadAnimDict( dict )
    RequestAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        
        Citizen.Wait( 1 )
    end
end