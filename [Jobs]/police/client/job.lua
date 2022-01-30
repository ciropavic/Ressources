ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

    ESX.PlayerData = ESX.GetPlayerData()
    
    TriggerServerEvent("police:server:UpdateBlips")
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job

	Citizen.Wait(2000)
    TriggerServerEvent("police:server:UpdateBlips")
    
    if DutyBlips ~= nil then 
        for k, v in pairs(DutyBlips) do
            RemoveBlip(v)
        end
    end
    DutyBlips = {}
    
end)


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

local currentGarage = 1
Citizen.CreateThread(function()

    while not ESX or not ESX.PlayerData.job do
		Citizen.Wait(10)
    end
    
    while true do
        Citizen.Wait(1)
        if true then
            if ESX.PlayerData.job.name == "police" then
                local pos = GetEntityCoords(GetPlayerPed(-1))

                for k, v in pairs(Config.Locations["evidence"]) do
                    if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 2) then
                        if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 1.0) then
                            DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Caja de evidencia " .. k)
                            if IsControlJustReleased(0, Keys["E"]) then
                                TriggerEvent('inventory:stash', 'Evidencia policial ' .. k)
                                TriggerServerEvent('police:logs', GetPlayerName(PlayerId()) .. "(" .. GetPlayerServerId(PlayerId()) .. ") " .. "Caja de pruebas policiales abierta " .. k)
                            end
                        elseif (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, v.x, v.y, v.z, true) < 1.5) then
                            DrawText3D(v.x, v.y, v.z, "Evidence box " .. k)
                        end
                    end
                end

                for k, v in pairs(Config.Locations["trash"]) do
                    if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 2) then
                        if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 1.0) then
                            DrawText3D(v.x, v.y, v.z, "~r~E~w~ - Basura")
                            if IsControlJustReleased(0, Keys["E"]) then
                                TriggerEvent('inventory:stash', 'Police Garbage')
                                TriggerServerEvent('police:logs', GetPlayerName(PlayerId()) .. "(" .. GetPlayerServerId(PlayerId()) .. ") " .. "Cubo de basura abierto de la policía")

                            end
                        elseif (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, v.x, v.y, v.z, true) < 1.5) then
                            DrawText3D(v.x, v.y, v.z, "Garbage can")
                        end
                    end
                end

                for k, v in pairs(Config.Locations["vehicle"]) do
                    if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 7.5) then
                         if true then
                             DrawMarker(36, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.8, 0.8, 0.45, 400, 0, 0, 222, false, false, false, true, false, false, false)
                             if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 1.5) then
                                 if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                                     DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Almacene el vehículo")
                                 else
                                     DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Vehiculos")
                                 end
                                 if IsControlJustReleased(0, Keys["E"]) then
                                     if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                                        local veh = GetVehiclePedIsIn(GetPlayerPed(-1))
                                         ESX.Game.DeleteVehicle(veh)
                                         local hashVehicule = GetEntityModel(veh)
                                         local VehName = GetDisplayNameFromVehicleModel(hashVehicule)
                                         TriggerServerEvent('police:logs', GetPlayerName(PlayerId()) .. "(" .. GetPlayerServerId(PlayerId()) .. ") " .. "Almacenado un vehículo")
                                     else
                                         MenuGarage()
                                         currentGarage = k
                                         Menu.hidden = not Menu.hidden
                                     end
                                 end
                                 Menu.renderGUI()
                            end  
                        end
                    end
                end


                for k, v in pairs(Config.Locations["helicopter"]) do
                    if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 7.5) then
                        if ESX.PlayerData.job.grade == Config.HelicopterGrade or ESX.PlayerData.job.grade > Config.HelicopterGrade then
                            DrawMarker(2, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 0, 0, 222, false, false, false, true, false, false, false)
                            if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 7) then
                                if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                                    DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Guarda el helicóptero")
                                elseif (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 1.5) then
                                    DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Helicoptero")
                                end
                                if IsControlJustReleased(0, Keys["E"]) then
                                    if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                                        local veh = GetVehiclePedIsIn(GetPlayerPed(-1))
                                        ESX.Game.DeleteVehicle(veh)
                                        local hashVehicule = GetEntityModel(veh)
                                        local VehName = GetDisplayNameFromVehicleModel(hashVehicule)
                                        TriggerServerEvent('police:logs', GetPlayerName(PlayerId()) .. "(" .. GetPlayerServerId(PlayerId()) .. ") " .. "Almacenado " .. VehName)
                                    elseif (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 1.5) then
                                        local coords = Config.Locations["helicopter"][k]

                                        ESX.Game.SpawnVehicle(Config.Helicopter, vector3(coords.x, coords.y, coords.z), coords.h, function(veh)
                                            SetVehicleNumberPlateText(veh, "ZULU"..tostring(math.random(1000, 9999)))
                                            SetEntityHeading(veh, coords.h)
                                            closeMenuFull()
                                            TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
                                            SetVehicleEngineOn(veh, true, true)
                                            local hashVehicule = GetEntityModel(veh)
                                            local VehName = GetDisplayNameFromVehicleModel(hashVehicule)
                                            TriggerServerEvent('police:logs', GetPlayerName(PlayerId()) .. "(" .. GetPlayerServerId(PlayerId()) .. ") " .. "Sacar " .. VehName)
                                            TriggerEvent('keys:addNew',veh,GetVehicleNumberPlateText(veh))
                                        end)
                                    end
                                end
                            end  
                        end
                    end
                end

                for k, v in pairs(Config.Locations["impound"]) do
                    if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 7.5) then
                        DrawMarker(2, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 0, 0, 222, false, false, false, true, false, false, false)
                        if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 1.5) then
                            DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Confiscar")
                            if IsControlJustReleased(0, Keys["E"]) then
                                MenuImpound()
                                currentGarage = k
                                Menu.hidden = not Menu.hidden
                            end
                            Menu.renderGUI()
                        end  
                    end
                end


                for k, v in pairs(Config.Locations["cameras"]) do
                    if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 4.5) then
                        if true then
                            if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 1.5) then
                                DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Camaras")
                                if IsControlJustReleased(0, Keys["E"]) then
                                    SecurityCameras()
                                    TriggerServerEvent('police:logs', GetPlayerName(PlayerId()) .. "(" .. GetPlayerServerId(PlayerId()) .. ") " .. "Cámaras de policía abiertas")
                                end
                            elseif (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 2.5) then
                                DrawText3D(v.x, v.y, v.z, "Camaras")
                            end  
                        end
                    end
                end

                for k, v in pairs(Config.Locations["boss"]) do
                    if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 4.5) and ESX.PlayerData.job.grade_name == 'boss' then
                         if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 1.5) then
                            DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Boss Menu")
                            if IsControlJustReleased(0, Keys["E"]) then
                                TriggerEvent('esx_society:openBossMenu', 'police', function(data, menu)
                                    menu.close()
                                end, { wash = false })
                                TriggerServerEvent('police:logs', GetPlayerName(PlayerId()) .. "(" .. GetPlayerServerId(PlayerId()) .. ") " .. "Abrir Boss Menu")
                            end
                        elseif (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 2.5) then
                            DrawText3D(v.x, v.y, v.z, "Boss Menu")
                        end  
                    end
                end

                for k, v in pairs(Config.Locations["license"]) do
                    if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 4.5) and ESX.PlayerData.job.grade_name == 'boss' then
                         if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 1.5) then
                            DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Crear Licencia")
                            if IsControlJustReleased(0, Keys["E"]) then
                                local player, distance = ESX.Game.GetClosestPlayer()
                                if player ~= -1 and distance < 2.5 then
                                    local playerId = GetPlayerServerId(player)
                                    TriggerServerEvent("police:addLicense", playerId)
                                else
                                    TriggerEvent('notification', "No hay jugadores cerca!", 2)
                                end
                            end
                        elseif (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 2.5) then
                            DrawText3D(v.x, v.y, v.z, "Crear licencia")
                        end  
                    end
                end
            end
        end
    end
end)

CreateThread(function()
    while true do
        Wait(1)

        local pos = GetEntityCoords(PlayerPedId())
        if ESX.PlayerData.job and (ESX.PlayerData.job.name == 'police' or ESX.PlayerData.job.name == 'offpolice') then
            for k, v in pairs(Config.Locations["duty"]) do
                if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 5) then
                    if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 1.5) then
                        if ESX.PlayerData.job.name == 'police' then
                            DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Fuera de servicio")
                            if IsControlJustPressed(0, 38) then
                                TriggerServerEvent('police:duty', false)
                            end
                        else
                            DrawText3D(v.x, v.y, v.z, "~g~E~w~ - En servicio")
                            if IsControlJustPressed(0, 38) then
                                TriggerServerEvent('police:duty', true)
                            end
                        end
                    elseif (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 2.5) then
                        DrawText3D(v.x, v.y, v.z, "On/Off Duty")
                    end
                end
            end
        end
    end
end)

local inFingerprint = false
local FingerPrintSessionId = nil

function SecurityCameras()
    ESX.UI.Menu.CloseAll()
    local elements = {}
    for camera,v in pairs(Config.SecurityCameras.cameras) do
        elements[#elements+1] = { label = v.label, camera = camera }
    end

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'security_cameras', {
      title    = 'Security Cameras',
      elements = elements
    }, function(data, menu)
        TriggerServerEvent('police:logs', GetPlayerName(PlayerId()) .. "(" .. GetPlayerServerId(PlayerId()) .. ") " .. "Sistema de cámara abierto \n Número de cámara: " ..data.current.camera)
        TriggerEvent('police:client:ActiveCamera', data.current.camera)
    end, function(data, menu)
      menu.close()
    end)
end

RegisterNetEvent('YM:Cams')
AddEventHandler('YM:Cams', function()
    SecurityCameras()
end)
  
RegisterNetEvent('police:client:showFingerprint')
AddEventHandler('police:client:showFingerprint', function(playerId)
    openFingerprintUI()
    FingerPrintSessionId = playerId
end)

RegisterNetEvent('police:client:showFingerprintId')
AddEventHandler('police:client:showFingerprintId', function(fid)
    SendNUIMessage({
        type = "updateFingerprintId",
        fingerprintId = fid
    })
    PlaySound(-1, "Event_Start_Text", "GTAO_FM_Events_Soundset", 0, 0, 1)
end)

RegisterNUICallback('doFingerScan', function(data)
    TriggerServerEvent('police:server:showFingerprintId', FingerPrintSessionId)
end)

function openFingerprintUI()
    SendNUIMessage({
        type = "fingerprintOpen"
    })
    inFingerprint = true
    SetNuiFocus(true, true)
end

RegisterNUICallback('closeFingerprint', function()
    SetNuiFocus(false, false)
    inFingerprint = false
end)

RegisterNetEvent('police:client:SendEmergencyMessage')
AddEventHandler('police:client:SendEmergencyMessage', function(message)
    local coords = GetEntityCoords(GetPlayerPed(-1))
    
    TriggerServerEvent("police:server:SendEmergencyMessage", coords, message)
    TriggerEvent("police:client:CallAnim")
end)

RegisterNetEvent('police:client:EmergencySound')
AddEventHandler('police:client:EmergencySound', function()
    PlaySound(-1, "Event_Start_Text", "GTAO_FM_Events_Soundset", 0, 0, 1)
end)

RegisterNetEvent('police:client:CallAnim')
AddEventHandler('police:client:CallAnim', function()
    local isCalling = true
    local callCount = 5
    loadAnimDict("cellphone@")   
    TaskPlayAnim(PlayerPedId(), 'cellphone@', 'cellphone_call_listen_base', 3.0, -1, -1, 49, 0, false, false, false)
    Citizen.Wait(1000)
    Citizen.CreateThread(function()
        while isCalling do
            Citizen.Wait(1000)
            callCount = callCount - 1
            if callCount <= 0 then
                isCalling = false
                StopAnimTask(PlayerPedId(), 'cellphone@', 'cellphone_call_listen_base', 1.0)
            end
        end
    end)
end)

RegisterNetEvent('police:client:ImpoundVehicle')
AddEventHandler('police:client:ImpoundVehicle', function(fullImpound, price)
    local vehicle = ESX.Game.GetClosestVehicle()
    if vehicle ~= 0 and vehicle ~= nil then
        local pos = GetEntityCoords(GetPlayerPed(-1))
        local vehpos = GetEntityCoords(vehicle)
        if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, vehpos.x, vehpos.y, vehpos.z, true) < 5.0) and not IsPedInAnyVehicle(GetPlayerPed(-1)) then
            local plate = GetVehicleNumberPlateText(vehicle)
            TriggerServerEvent("police:server:Impound", plate, fullImpound, price)
            ESX.Game.DeleteVehicle(vehicle)
        end
    end
end)

RegisterNetEvent('police:client:CheckStatus')
AddEventHandler('police:client:CheckStatus', function()
    local PlayerData = ESX.GetPlayerData()
    if PlayerData.job.name == "police" then
        local player, distance = GetClosestPlayer()
        if player ~= -1 and distance < 5.0 then
            local playerId = GetPlayerServerId(player)
            ESX.TriggerServerCallback('police:GetPlayerStatus', function(result)
                if result ~= nil then
                    for k, v in pairs(result) do
                        TriggerEvent("chatMessage", "STATUS", "warning", v)
                    end
                end
            end, playerId)
        end
    end
end)

function MenuImpound()
    ped = GetPlayerPed(-1);
    MenuTitle = "Inbeslag"
    ClearMenu()
    Menu.addButton("Vehicles", "ImpoundVehicleList", nil)
    Menu.addButton("Close Menu", "closeMenuFull", nil) 
end

function ImpoundVehicleList()
    ESX.TriggerServerCallback("police:GetImpoundedVehicles", function(result)
        ped = GetPlayerPed(-1);
        MenuTitle = "Vehicles:"
        ClearMenu()

        if result == nil or #result == 0 then
            TriggerEvent('notification', "No hay vehículos incautados!", 2)
            closeMenuFull()
        else
            for k, v in pairs(result) do
                local vehData = json.decode(v.vehicle)
                Menu.addButton(v.plate, "TakeOutImpound", v, GetDisplayNameFromVehicleModel(vehData.model), "Motor: 100%", " Body: 100%", " Fuel: 100%")
            end
        end
            
        Menu.addButton("Back", "MenuImpound",nil)
    end)
end

function TakeOutImpound(vehicle)
    closeMenuFull()
    TriggerEvent('notification', "Vehicle in garage! (A)")
    TriggerServerEvent("police:server:outOfImpound", vehicle.plate)
end

function MenuOutfits()
    ped = GetPlayerPed(-1);
    MenuTitle = "Outfits"
    ClearMenu()
    Menu.addButton("My Outfits", "OutfitsLijst", nil)
    Menu.addButton("Close Menu", "closeMenuFull", nil) 
end

function changeOutfit()
	Wait(200)
    loadAnimDict("clothingshirt")    	
	TaskPlayAnim(GetPlayerPed(-1), "clothingshirt", "try_shirt_positive_d", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
	Wait(3100)
	TaskPlayAnim(GetPlayerPed(-1), "clothingshirt", "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
end

function OutfitsLijst()
    ESX.TriggerServerCallback('apartments:GetOutfits', function(outfits)
        ped = GetPlayerPed(-1);
        MenuTitle = "My Outfits :"
        ClearMenu()

        if outfits == nil then
            TriggerEvent('notification', "No tienes atuendos guardados...", 2, 3500)
            closeMenuFull()
        else
            for k, v in pairs(outfits) do
                Menu.addButton(outfits[k].outfitname, "optionMenu", outfits[k]) 
            end
        end
        Menu.addButton("Back", "MenuOutfits",nil)
    end)
end

function optionMenu(outfitData)
    ped = GetPlayerPed(-1);
    MenuTitle = "What now?"
    ClearMenu()

    Menu.addButton("Choose Outfit", "selectOutfit", outfitData) 
    Menu.addButton("Remove Outfit", "removeOutfit", outfitData) 
    Menu.addButton("Back", "OutfitsLijst",nil)
end

function selectOutfit(oData)
    TriggerServerEvent('clothes:selectOutfit', oData.model, oData.skin)
    TriggerEvent('notification', oData.outfitname.." Elegido!", 1, 2500)
    closeMenuFull()
    changeOutfit()
end

function removeOutfit(oData)
    TriggerServerEvent('clothes:removeOutfit', oData.outfitname)
    TriggerEvent('notification', oData.outfitname.." es removido!", 1, 2500)
    closeMenuFull()
end

function MenuGarage()
    ped = GetPlayerPed(-1);
    MenuTitle = "Garage"
    ClearMenu()
    Menu.addButton("Vehicles", "VehicleList", nil)
    Menu.addButton("Close Menu", "closeMenuFull", nil) 
    TriggerServerEvent('police:logs', GetPlayerName(PlayerId()) .. "(" .. GetPlayerServerId(PlayerId()) .. ") " .. "Opened police garage menu")
end

function VehicleList(isDown)
    ped = GetPlayerPed(-1);
    MenuTitle = "Vehicles:"
    ClearMenu()
    for k, v in pairs(Config.Vehicles) do
        if ESX.PlayerData.job.grade == v.grade or ESX.PlayerData.job.grade > v.grade then
            Menu.addButton(v.label, "TakeOutVehicle", v.name, "Garage", " Motor: 100%", " Body: 100%", " Fuel: 100%")
        end
    end
        
    Menu.addButton("Back", "MenuGarage",nil)
end

function TakeOutVehicle(vehicleInfo)
    ClearMenu()
    ESX.Game.SpawnVehicle(vehicleInfo, GetEntityCoords(PlayerPedId()), GetEntityHeading(PlayerPedId()), function(vehicle)
        TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
        local hashVehicule = GetEntityModel(vehicle)
        local VehName = GetDisplayNameFromVehicleModel(hashVehicule)
        TriggerServerEvent('police:logs', GetPlayerName(PlayerId()) .. '(' .. GetPlayerServerId(PlayerId()) .. ') ' .. 'Sacar "' .. VehName .. '"')
        TriggerEvent('keys:addNew',vehicle,GetVehicleNumberPlateText(vehicle))
    end)


end

function closeMenuFull()
    Menu.hidden = true
    currentGarage = nil
    ClearMenu()
end

function doCarDamage(currentVehicle, veh)
	smash = false
	damageOutside = false
	damageOutside2 = false 
	local engine = veh.engine + 0.0
	local body = veh.body + 0.0
	if engine < 200.0 then
		engine = 200.0
    end
    
    if engine  > 1000.0 then
        engine = 950.0
    end

	if body < 150.0 then
		body = 150.0
	end
	if body < 950.0 then
		smash = true
	end

	if body < 920.0 then
		damageOutside = true
	end

	if body < 920.0 then
		damageOutside2 = true
	end

    Citizen.Wait(100)
    SetVehicleEngineHealth(currentVehicle, engine)
	if smash then
		SmashVehicleWindow(currentVehicle, 0)
		SmashVehicleWindow(currentVehicle, 1)
		SmashVehicleWindow(currentVehicle, 2)
		SmashVehicleWindow(currentVehicle, 3)
		SmashVehicleWindow(currentVehicle, 4)
	end
	if damageOutside then
		SetVehicleDoorBroken(currentVehicle, 1, true)
		SetVehicleDoorBroken(currentVehicle, 6, true)
		SetVehicleDoorBroken(currentVehicle, 4, true)
	end
	if damageOutside2 then
		SetVehicleTyreBurst(currentVehicle, 1, false, 990.0)
		SetVehicleTyreBurst(currentVehicle, 2, false, 990.0)
		SetVehicleTyreBurst(currentVehicle, 3, false, 990.0)
		SetVehicleTyreBurst(currentVehicle, 4, false, 990.0)
	end
	if body < 1000 then
		SetVehicleBodyHealth(currentVehicle, 985.1)
	end
end


function round(num, numDecimalPlaces)
    return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", num))
end

function FineMenu(player)
	ESX.TriggerServerCallback('police:FineList', function(fines)
		local elements = {}

		for k,fine in ipairs(fines) do
			table.insert(elements, {
				label     = ('%s <span style="color:green;">%s</span>'):format(fine.label, "$" .. ESX.Math.GroupDigits(fine.amount)),
				value     = fine.id,
				amount    = fine.amount,
				fineLabel = fine.label
			})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'fines', {
			title    = 'Fines',
			align    = 'top-left',
			elements = elements
		}, function(data, menu)
			menu.close()

			TriggerServerEvent('esx_billing:sendBill', player, 'society_police', data.current.fineLabel, data.current.amount)

			Wait(300)
			FineMenu(player)
		end, function(data, menu)
			menu.close()
		end)
	end)
end