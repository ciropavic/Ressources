local CurrentAction, CurrentActionMsg, CurrentActionData = nil, '', {}
local HasAlreadyEnteredMarker, LastHospital, LastPart, LastPartNum
local IsBusy = false
local spawnedVehicles, isInShopMenu = {}, false

function FastTravel(coords, heading)
	local playerPed = PlayerPedId()

	DoScreenFadeOut(800)

	while not IsScreenFadedOut() do
		Citizen.Wait(500)
	end

	ESX.Game.Teleport(playerPed, coords, function()
		DoScreenFadeIn(800)

		if heading then
			SetEntityHeading(playerPed, heading)
		end
	end)
end

-- Draw markers & Marker logic
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerCoords = GetEntityCoords(PlayerPedId())
		local letSleep, isInMarker, hasExited = true, false, false
		local currentHospital, currentPart, currentPartNum
		if ESX.PlayerData.job and ESX.PlayerData.job.name == 'ambulance' then
			for hospitalNum,hospital in pairs(Config.Hospitals) do 

				-- Pharmacies
				for k,v in ipairs(hospital.Pharmacies) do
					local distance = GetDistanceBetweenCoords(playerCoords, v, true)

					if distance < 1.5 then
						DrawText3D(v[1], v[2], v[3], "~g~E~w~ - Pharmacy")
						if IsControlJustPressed(0, 38) then
							TriggerEvent('ev-inventory:shop', 'Farmacia')
						end
					elseif distance < 4 then
						DrawText3D(v[1], v[2], v[3], 'Farmacia')
					end

				end

				-- Vehicle Spawners
				for k,v in ipairs(hospital.Vehicles) do
					local distance = GetDistanceBetweenCoords(playerCoords, v, true)

					DrawMarker(2, v[1], v[2], v[3], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 0, 0, 222, false, false, false, true, false, false, false)
					
					if distance < 1.5 then

						if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
							DrawText3D(v[1], v[2], v[3], "~g~E~w~ - Depositar Vehiculos")
						 else
							DrawText3D(v[1], v[2], v[3], "~g~E~w~ - Vehiculos")
						 end

						if IsControlJustPressed(0, 38) then
							if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
								local veh = GetVehiclePedIsIn(GetPlayerPed(-1))
								 ESX.Game.DeleteVehicle(veh)
								 local hashVehicule = GetEntityModel(veh)
								 local VehName = GetDisplayNameFromVehicleModel(hashVehicule)
								 TriggerServerEvent('police:logs', GetPlayerName(PlayerId()) .. "(" .. GetPlayerServerId(PlayerId()) .. ") " .. "Depositar Vehiculos")
							 else
								 MenuGarage()
								 currentGarage = k
								 Menu.hidden = not Menu.hidden
							 end
						end
						Menu.renderGUI()
					elseif distance < 4 then
						DrawText3D(v[1], v[2], v[3], 'Vehiculos')
					end

				end


				-- Helicopter Spawners
				for k,v in ipairs(hospital.Helicopters) do
					local distance = GetDistanceBetweenCoords(playerCoords, v.Spawner, true)

					if distance < Config.DrawDistance then
						DrawMarker(v.Marker.type, v.Spawner, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Marker.x, v.Marker.y, v.Marker.z, v.Marker.r, v.Marker.g, v.Marker.b, v.Marker.a, false, true, 2, v.Marker.rotate, nil, nil, false)
						letSleep = false
					end

					if distance < v.Marker.x then
						isInMarker, currentHospital, currentPart, currentPartNum = true, hospitalNum, 'Helicopters', k
					end
				end

				-- Fast Travels
				for k,v in ipairs(hospital.FastTravels) do
					local distance = Vdist2(GetEntityCoords(PlayerPedId()), v.From)

					if distance < 1.5 then

						DrawText3D(v.From[1], v.From[2], v.From[3], "~g~E~w~ - Entrar")
						if IsControlJustPressed(0, 38) then
							SetEntityCoords(PlayerPedId(), v.To.coords)
							SetEntityHeading(PlayerPedId(), v.To.heading)

						end
					elseif distance < 4 then
						DrawText3D(v.From[1], v.From[2], v.From[3], "Entrar")
					end


				end
			end
		end


	end
end)

function MenuGarage()
    ped = GetPlayerPed(-1);
    MenuTitle = "Garage"
    ClearMenu()
    Menu.addButton("Vehiculos", "VehicleList", nil)
    Menu.addButton("Cerrar Menu", "closeMenuFull", nil) 
    TriggerServerEvent('police:logs', GetPlayerName(PlayerId()) .. "(" .. GetPlayerServerId(PlayerId()) .. ") " .. "Menú de garaje de policía abierto")
end

function closeMenuFull()
    Menu.hidden = true
    currentGarage = nil
    ClearMenu()
end

function VehicleList(isDown)
    ped = GetPlayerPed(-1);
    MenuTitle = "Vehicles:"
    ClearMenu()
    for k, v in pairs(Config.Vehicles) do
        if ESX.PlayerData.job.grade == v.grade or ESX.PlayerData.job.grade > v.grade then
            Menu.addButton(v.label, "TakeOutVehicle", v.name, "Garage", " Motor: 100%", " Chapa: 100%", " Gasoil: 100%")
        end
    end
        
    Menu.addButton("Atras", "MenuGarage",nil)
end

function TakeOutVehicle(vehicleInfo)
    ClearMenu()
    ESX.Game.SpawnVehicle(vehicleInfo, GetEntityCoords(PlayerPedId()), GetEntityHeading(PlayerPedId()), function(vehicle)
        TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
        local hashVehicule = GetEntityModel(vehicle)
		local VehName = GetDisplayNameFromVehicleModel(hashVehicule)
		TriggerEvent("keys:addNew",vehicle,GetVehicleNumberPlateText(vehicle))
        TriggerServerEvent('police:logs', GetPlayerName(PlayerId()) .. '(' .. GetPlayerServerId(PlayerId()) .. ') ' .. 'Sacar "' .. VehName .. '"')

    end)
end

function DrawText3D(x, y, z, text)
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


RegisterNetEvent('esx_ambulancejob:putInVehicle')
AddEventHandler('esx_ambulancejob:putInVehicle', function()
	local playerPed = PlayerPedId()
	local coords    = GetEntityCoords(playerPed)

	if IsAnyVehicleNearPoint(coords, 5.0) then
		local vehicle = GetClosestVehicle(coords, 5.0, 0, 71)

		if DoesEntityExist(vehicle) then
			local maxSeats, freeSeat = GetVehicleMaxNumberOfPassengers(vehicle)

			for i=maxSeats - 1, 0, -1 do
				if IsVehicleSeatFree(vehicle, i) then
					freeSeat = i
					break
				end
			end

			if freeSeat then
				TaskWarpPedIntoVehicle(playerPed, vehicle, freeSeat)
			end
		end
	end
end)

RegisterNetEvent('esx_ambulancejob:camilla')
AddEventHandler('esx_ambulancejob:camilla', function()
	local playerPed = PlayerPedId()
	local coords    = GetEntityCoords(playerPed)
	ExecuteCommand('/spawnobject v_med_emptybed')
end)

function WarpPedInClosestVehicle(ped)
	local coords = GetEntityCoords(ped)

	local vehicle, distance = ESX.Game.GetClosestVehicle(coords)

	if distance ~= -1 and distance <= 5.0 then
		local maxSeats, freeSeat = GetVehicleMaxNumberOfPassengers(vehicle)

		for i=maxSeats - 1, 0, -1 do
			if IsVehicleSeatFree(vehicle, i) then
				freeSeat = i
				break
			end
		end

		if freeSeat then
			TaskWarpPedIntoVehicle(ped, vehicle, freeSeat)
		end
	else
		ESX.ShowNotification(_U('no_vehicles'))
	end
end

RegisterNetEvent('esx_ambulancejob:heal')
AddEventHandler('esx_ambulancejob:heal', function(healType, quiet)
	local playerPed = PlayerPedId()
	local maxHealth = GetEntityMaxHealth(playerPed)

	if healType == 'small' then
		local health = GetEntityHealth(playerPed)
		local newHealth = math.min(maxHealth, math.floor(health + maxHealth / 8))
		SetEntityHealth(playerPed, newHealth)
	elseif healType == 'big' then
		SetEntityHealth(playerPed, maxHealth)
	end

	if not quiet then
		ESX.ShowNotification(_U('healed'))
	end
end)
