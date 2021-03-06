ESX = nil
local PlayerData                = {}

local nettoyage = {coords = vector3(-1429.85, 1971.97, 23.21)}
--local nettoyagePublique = {coords = vector3(21.09, -1391.97, 29.8)}
local nettoyagePublique = {coords = vector3(-431.69, 1321.95, 6.58)}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()
end)



-- Zone de mise nettoyage

Citizen.CreateThread(function()
     while true do
          while ESX == nil do
               Citizen.Wait(10)
          end
		local sleepThread = 1000
		local ped = PlayerPedId()
		local pedCoords = GetEntityCoords(ped)
          local dstCheck = GetDistanceBetweenCoords(pedCoords, nettoyage.coords, true)
          local dstCheckPublic = GetDistanceBetweenCoords(pedCoords, nettoyagePublique.coords, true)
		if ESX.PlayerData.job and ESX.PlayerData.job.name == 'mechanic' then
			if dstCheck <= 2.5 then
				sleepThread = 5
				ESX.Game.Utils.DrawText3D(nettoyage.coords, "~b~[E] ~w~Reparación de vehículos", 1.0)
				if IsControlJustPressed(0, 38) then
					NettoyageFunction()
				end
			end
          end
          if dstCheckPublic <= 30 then
               sleepThread = 5
               DrawMarker(20, nettoyagePublique.coords.x, nettoyagePublique.coords.y, nettoyagePublique.coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 3, 252, 48, 100, false, true, 2, false, nil, nil, false)
          end
          if dstCheckPublic <= 2.5 then
               sleepThread = 5
               ESX.Game.Utils.DrawText3D(nettoyagePublique.coords, "~b~[E] ~w~Limpieza vehiculo", 1.0)
               if IsControlJustPressed(0, 38) then
                    NettoyageFunctionPublic()
               end
          end
		Citizen.Wait(sleepThread)
	end
end)


function NettoyageFunctionPublic()
	local ped = PlayerPedId()
     local vehicle = GetVehiclePedIsIn( ped, false )
     if IsPedInAnyVehicle(ped, false) then
          TaskVehicleDriveToCoord(ped, vehicle, -431.48, 1344.63, 6.58, 3.0, 5.0, hash, 16777216, 1.0, true)
          Citizen.Wait(1000)
          local stopped = IsVehicleStopped(vehicle)
          while stopped == false do
               stopped = IsVehicleStopped(vehicle)
               Citizen.Wait(50)
          end
          ESX.ShowAdvancedNotification("Estación de lavado", "~b~Acción de lavado de autos", "La limpieza para comenzar...", "CHAR_LS_CUSTOMS", 8)
-- Cam
          local camera = CreateCam("DEFAULT_SCRIPTED_CAMERA", 1)
          SetCamCoord(camera, -431.18, 1297.61, 6.86)
          PointCamAtEntity(camera, ped, 0, 0, 0, 1)
          SetCamNearDof(camera, 10)
          RenderScriptCams(1, 1, 500, 1, 1)
          SetCamShakeAmplitude(camera, 13.0)
          -- porte
          SetVehicleDoorOpen(vehicle, 0, false, false)
          SetVehicleDoorOpen(vehicle, 1, false, false)
          SetVehicleDoorOpen(vehicle, 2, false, false)
          SetVehicleDoorOpen(vehicle, 3, false, false)
          SetVehicleDoorOpen(vehicle, 4, false, false)
          SetVehicleDoorOpen(vehicle, 5, false, false)
          SetVehicleDoorOpen(vehicle, 6, false, false)
          SetVehicleDoorOpen(vehicle, 7, false, false)
          SetVehicleEngineOn(vehicle, false, false, true)
          Wait(8500)
          DoScreenFadeOut(1500)
          Wait(1300)
          RenderScriptCams(0, 1, 500, 1, 1)
          Wait(500)
          DoScreenFadeIn(4300)
          SetCamCoord(camera, -455.12, 1327.32, 6.17)
               RenderScriptCams(1, 1, 500, 1, 1)
               Wait(6600)
               RenderScriptCams(0, 1, 3500, 1, 1)
               Wait(3501)
               SetCamCoord(camera, -435.24, 1364.68, 6.19)
          RenderScriptCams(1, 1, 5500, 1, 1)
          Wait(8500)
-- Fin ca
          RenderScriptCams(0, 1, 5000, 1, 1)
          DestroyCam(camera, true)
          ESX.ShowAdvancedNotification("Estación de lavado", "~b~Acción de lavado de autos", "Termino", "CHAR_LS_CUSTOMS", 8)
          -- porte
          SetVehicleDoorShut(vehicle, 0, false)
          SetVehicleDoorShut(vehicle, 1, false)
          SetVehicleDoorShut(vehicle, 2, false)
          SetVehicleDoorShut(vehicle, 3, false)
          SetVehicleDoorShut(vehicle, 4, false)
          SetVehicleDoorShut(vehicle, 5, false)
          SetVehicleDoorShut(vehicle, 6, false)
          SetVehicleDoorShut(vehicle, 7, false)
          SetVehicleEngineOn(vehicle, true, false, true)
          local hash = GetHashKey(vehicle)
          --TaskVehicleDriveToCoord(ped, vehicle, 1004.70, -2367.08, 31.70, 3.0, 5.0, hash, 16777216, 1.0, true)
          --TaskVehiclePark(ped, vehicle, -8.77, -1385.52, 29.35, 0.2, 1, 20.0, true)
          -- clean
          SetVehicleDirtLevel(vehicle, 1.0)
     else
          ESX.ShowAdvancedNotification("Estacion de lavado", "~b~Acion de lavado", "Debes estar en un vehículo para hacer esto..", "CHAR_LS_CUSTOMS", 8)
     end
end