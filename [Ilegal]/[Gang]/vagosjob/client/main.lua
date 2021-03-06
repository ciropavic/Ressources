isDead, ESX, blip = false, nil, nil
local isMenuOpen = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()

	RefreshBlip()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job

	RefreshBlip()
end)

function DrawText3D(x,y,z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end


-- Draw markers and more
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if ESX.PlayerData.job and ESX.PlayerData.job.name == 'vagos' then
			local playerPed = PlayerPedId()
			local playerCoords = GetEntityCoords(playerPed)
			local isInMarker, hasExited = false, false
			local currentStation, currentPart, currentPartNum

			for k,v in pairs(Config.Locations) do
				for i=1, #v.Hermes, 1 do
					local distance = #(playerCoords - v.Hermes[i])
					if distance < 1.5 then
						if IsPedInAnyVehicle(PlayerPedId()) then
			DrawText3D(v.Hermes[i][1],v.Hermes[i][2],v.Hermes[i][3], '~g~[E]~w~~h~ - Guardar Chino2')
						else
							DrawText3D(v.Hermes[i][1],v.Hermes[i][2],v.Hermes[i][3], '~g~[E]~w~~h~ - Sacar Chino2')
						end
						if IsControlJustReleased(0,38) then
							if IsPedInAnyVehicle(PlayerPedId()) then
								local vehicle = GetVehiclePedIsIn(PlayerPedId())
								ESX.Game.DeleteVehicle(vehicle)
							else
								local coords = GetEntityCoords(PlayerPedId())
								ESX.Game.SpawnVehicle('chino2', vector3(coords[1], coords[2], coords[3]), GetEntityHeading(PlayerPedId()), function(vehicle)
									TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
								end)
							end
						end
					elseif distance < 5 then
						if IsPedInAnyVehicle(PlayerPedId()) then
							DrawText3D(v.Hermes[i][1],v.Hermes[i][2],v.Hermes[i][3], 'Guardar Chino2')
						else
							DrawText3D(v.Hermes[i][1],v.Hermes[i][2],v.Hermes[i][3], 'Sacar Chino2')
						end
					end
				end

				for i=1, #v.btype, 1 do
					local distance = #(playerCoords - v.btype[i])
					if distance < 1.5 then
						if IsPedInAnyVehicle(PlayerPedId()) then
							DrawText3D(v.btype[i][1],v.btype[i][2],v.btype[i][3], '~g~[E]~w~~h~ - Guardar Moto')
						else
							DrawText3D(v.btype[i][1],v.btype[i][2],v.btype[i][3], '~g~[E]~w~~h~ - Sacar Moto')
						end
						if IsControlJustReleased(0,38) then
							if IsPedInAnyVehicle(PlayerPedId()) then
								local vehicle = GetVehiclePedIsIn(PlayerPedId())
								ESX.Game.DeleteVehicle(vehicle)
							else
								local coords = GetEntityCoords(PlayerPedId())
								ESX.Game.SpawnVehicle('bf400', vector3(coords[1], coords[2], coords[3]), GetEntityHeading(PlayerPedId()), function(vehicle)
									TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
								end)
							end
						end
					elseif distance < 5 then
						if IsPedInAnyVehicle(PlayerPedId()) then
										DrawText3D(v.btype[i][1],v.btype[i][2],v.btype[i][3], 'Guardar Moto')
						else
							DrawText3D(v.btype[i][1],v.btype[i][2],v.btype[i][3], 'Sacar Moto')
						end
					end
				end

				for i=1, #v.btype2, 1 do
					local distance = #(playerCoords - v.btype2[i])
					if distance < 1.5 then
						if IsPedInAnyVehicle(PlayerPedId()) then
	DrawText3D(v.btype2[i][1],v.btype2[i][2],v.btype2[i][3], '~g~[E]~w~~h~ - Guardar Journey')
						else
							DrawText3D(v.btype2[i][1],v.btype2[i][2],v.btype2[i][3], '~g~[E]~w~~h~ - Sacar Journey')
						end
						if IsControlJustReleased(0,38) then
							if IsPedInAnyVehicle(PlayerPedId()) then
								local vehicle = GetVehiclePedIsIn(PlayerPedId())
								ESX.Game.DeleteVehicle(vehicle)
							else
								local coords = GetEntityCoords(PlayerPedId())
								ESX.Game.SpawnVehicle('journey', vector3(coords[1], coords[2], coords[3]), GetEntityHeading(PlayerPedId()), function(vehicle)
									TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
								end)
							end
						end
					elseif distance < 5 then
						if IsPedInAnyVehicle(PlayerPedId()) then
							DrawText3D(v.btype2[i][1],v.btype2[i][2],v.btype2[i][3], 'Guardar Journey')
						else
							DrawText3D(v.btype2[i][1],v.btype2[i][2],v.btype2[i][3], 'Sacar Journey')
						end
					end
				end
				if ESX.PlayerData.job.grade_name == 'boss' then
					for i=1, #v.BossActions, 1 do
						local distance = #(playerCoords - v.BossActions[i])

						if distance < 1.5 then
							DrawText3D(v.BossActions[i][1],v.BossActions[i][2],v.BossActions[i][3], '~g~[E]~w~~h~ - Men?? jefe')
							if IsControlJustReleased(0,38) then
								TriggerEvent('esx_society:openBossMenu', 'vagos', function(data, menu)
									menu.close()
								end, { wash = false })
							end
						elseif distance < 5 then
							DrawText3D(v.BossActions[i][1],v.BossActions[i][2],v.BossActions[i][3], 'Men?? jefe')
						end

					end
				end
			end
		else
			Citizen.Wait(500)
		end
	end
end)


AddEventHandler('playerSpawned', function(spawn)
	isDead = false
end)

AddEventHandler('esx:onPlayerDeath', function(data)
	isDead = true
end)

function RefreshBlip()
	if blip and DoesBlipExist(blip) then
		RemoveBlip(blip)
	end
	CreateThread(function()
		if ESX.PlayerData.job and ESX.PlayerData.job.name == 'vagos' then
			blip = AddBlipForCoord(-1524.3636474609, 83.005065917969, 56.520046234131)
			SetBlipSprite (blip, 40)
			SetBlipDisplay(blip, 4)
			SetBlipScale  (blip, 0.7)
			BeginTextCommandSetBlipName('STRING')
			AddTextComponentSubstringPlayerName('House')
			EndTextCommandSetBlipName(blip)
		end
	end)
end