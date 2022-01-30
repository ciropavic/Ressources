isDead, ESX, blip = false, nil, nil

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

		if ESX.PlayerData.job and ESX.PlayerData.job.name == 'blackmarket' then
			local playerPed = PlayerPedId()
			local playerCoords = GetEntityCoords(playerPed)
			local isInMarker, hasExited = false, false
			local currentStation, currentPart, currentPartNum

			for k,v in pairs(Config.Locations) do
				for i=1, #v.Vehicles, 1 do
					local distance = #(playerCoords - v.Vehicles[i])
					if distance < 1.5 then
						if IsPedInAnyVehicle(PlayerPedId()) then
							DrawText3D(v.Vehicles[i][1],v.Vehicles[i][2],v.Vehicles[i][3], '[E] - Guardar Vehiculo')
						else
							DrawText3D(v.Vehicles[i][1],v.Vehicles[i][2],v.Vehicles[i][3], '[E] - Sacar vehiculo')
						end

						if IsControlJustReleased(0,38) then
							if IsPedInAnyVehicle(PlayerPedId()) then
								local vehicle = GetVehiclePedIsIn(PlayerPedId())
								ESX.Game.DeleteVehicle(vehicle)
							else
								local coords = GetEntityCoords(PlayerPedId())
								ESX.Game.SpawnVehicle('mesa3', vector3(coords[1], coords[2], coords[3]), GetEntityHeading(PlayerPedId()), function(vehicle)
									TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
								end)
							end
						end
					elseif distance < 5 then
						if IsPedInAnyVehicle(PlayerPedId()) then
							DrawText3D(v.Vehicles[i][1],v.Vehicles[i][2],v.Vehicles[i][3], 'Guardar Vehiculo')
						else
							DrawText3D(v.Vehicles[i][1],v.Vehicles[i][2],v.Vehicles[i][3], 'Sacar vehiculo')
						end
					end
				end

				if ESX.PlayerData.job.grade_name == 'boss' then
					for i=1, #v.BossActions, 1 do
						local distance = #(playerCoords - v.BossActions[i])

						if distance < 1.5 then
							DrawText3D(v.BossActions[i][1],v.BossActions[i][2],v.BossActions[i][3], '[E] - Menu del jefe')
							if IsControlJustReleased(0,38) then
								TriggerEvent('esx_society:openBossMenu', 'blackmarket', function(data, menu)
									menu.close()
								end, { wash = false })
							end
						elseif distance < 5 then
							DrawText3D(v.BossActions[i][1],v.BossActions[i][2],v.BossActions[i][3], 'Menu del jefe')
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
		if ESX.PlayerData.job and ESX.PlayerData.job.name == 'blackmarket' then
			blip = AddBlipForCoord(1255.4038085938, -2562.8310546875, 42.715969085693)

			SetBlipSprite (blip, 40)
			SetBlipDisplay(blip, 4)
			SetBlipScale  (blip, 0.7)
	
			BeginTextCommandSetBlipName('STRING')
			AddTextComponentSubstringPlayerName('Black Market House')
			EndTextCommandSetBlipName(blip)
		end
	end)

end