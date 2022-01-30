ESX = nil
local PlayerData                = {}

local MiseEnFourriere = {coords = vector3(-1423.38, 1989.2, 23.05)}

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



-- Zone de mise en fourrière

Citizen.CreateThread(function()
     while true do
          while ESX == nil do
               Citizen.Wait(10)
          end
		local sleepThread = 500
		local ped = PlayerPedId()
		local pedCoords = GetEntityCoords(ped)
		local dstCheck = GetDistanceBetweenCoords(pedCoords, MiseEnFourriere.coords, true)
		if ESX.PlayerData.job and ESX.PlayerData.job.name == 'mechanic' then
			if dstCheck <= 2.5 then
				sleepThread = 5
				ESX.Game.Utils.DrawText3D(MiseEnFourriere.coords, "~b~[E] ~w~Incautación", 1.0)
				if IsControlJustPressed(0, 38) then
					MiseEnFourriereFunction()
				end
			end
		end
		Citizen.Wait(sleepThread)
	end
end)


function MiseEnFourriereFunction()
	local ped = PlayerPedId()
     local vehicle = GetVehiclePedIsIn( ped, false )
     if IsPedInAnyVehicle(ped, false) then
          if ESX.PlayerData.job and ESX.PlayerData.job.name == 'mechanic' then
               ESX.ShowAdvancedNotification("Chatarrero", "~b~Destrucción de vehículos", "Colocación del vehículo.", "CHAR_LS_CUSTOMS", 8)
               TaskVehiclePark(ped, vehicle, -1423.38, 1989.2, 23.05, 93.46, 0, 20.0, false)
-- Cam
               local camera = CreateCam("DEFAULT_SCRIPTED_CAMERA", 1)
               SetCamCoord(camera, -1405.25, 1990.08, 22.99)
               PointCamAtEntity(camera, ped, 0, 0, 0, 1)
               RenderScriptCams(1, 1, 1000, 1, 1)
               SetCamShakeAmplitude(camera, 3.0)
               Wait(2000)
               RenderScriptCams(0, 1, 1000, 1, 1)
               DestroyCam(camera, true)
          
-- Fin cam
               SetVehicleEngineOn(vehicle, false, false, true)
               TaskLeaveAnyVehicle(ped, 1, 1)
               SetVehicleDoorsLocked(vehicle, 2)
-- Ouverture de toute les portes
               Wait(4000)
               SetVehicleDoorOpen(vehicle, 0, false, false)
               SetVehicleDoorOpen(vehicle, 1, false, false)
               SetVehicleDoorOpen(vehicle, 2, false, false)
               SetVehicleDoorOpen(vehicle, 3, false, false)
               SetVehicleDoorOpen(vehicle, 4, false, false)
               SetVehicleDoorOpen(vehicle, 5, false, false)
               SetVehicleDoorOpen(vehicle, 6, false, false)
               SetVehicleDoorOpen(vehicle, 7, false, false)
               ESX.ShowAdvancedNotification("Chatarrero", "~b~Destrucción de vehículos", "Destrucción de vehículos...", "CHAR_LS_CUSTOMS", 8)
               alpha = 255
               SetEntityAlpha(vehicle, alpha, alpha)
               while alpha > 0 do
                    alpha = alpha - 1
                    SetEntityAlpha(vehicle, alpha, alpha)
                    Wait(50)
                    if alpha == 0 then
                         TriggerServerEvent("mecano:fourriere")
                         PlayMissionCompleteAudio("TREVOR_SMALL_01")
                         local entity = vehicle
                         carModel = GetEntityModel(entity)
                         carName = GetDisplayNameFromVehicleModel(carModel)
                         NetworkRequestControlOfEntity(entity)
                         
                         local timeout = 2000
                         while timeout > 0 and not NetworkHasControlOfEntity(entity) do
                              Wait(100)
                              timeout = timeout - 100
                         end
                         SetEntityAsMissionEntity(entity, true, true)
                         
                         local timeout = 2000
                         while timeout > 0 and not IsEntityAMissionEntity(entity) do
                              Wait(100)
                              timeout = timeout - 100
                         end
                         Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( entity ) )
                         
                         if (DoesEntityExist(entity)) then 
                              DeleteEntity(entity)
                         end 
                    end
               end
          end
     else
          ESX.ShowAdvancedNotification("Chatarrero", "~b~Destrucción de vehículos", "Tienes que estar en un vehículo para hacer esto.", "CHAR_LS_CUSTOMS", 8)
     end
end



-- DEBUG MAP

--local Interior = GetInteriorAtCoords(-192.07, -1329.97, 30.91)
--LoadInterior(Interior)