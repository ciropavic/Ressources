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
    
    TriggerServerEvent("mecanico:server:UpdateBlips")
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job

	Citizen.Wait(2000)
    TriggerServerEvent("mecanico:server:UpdateBlips")
    
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
            if ESX.PlayerData.job.name == "mechanic" then
                local pos = GetEntityCoords(GetPlayerPed(-1))

                for k, v in pairs(Config.Locations["evidence"]) do
                    if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 2) then
                        if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 1.0) then
                            DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Evidence box " .. k)
                            if IsControlJustReleased(0, Keys["E"]) then
                                TriggerEvent('inventory:stash', 'mecanico Evidence ' .. k)
                                TriggerServerEvent('mecanico:logs', GetPlayerName(PlayerId()) .. "(" .. GetPlayerServerId(PlayerId()) .. ") " .. "Open mecanico Evidence Box " .. k)
                            end
                        elseif (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, v.x, v.y, v.z, true) < 1.5) then
                            DrawText3D(v.x, v.y, v.z, "Evidence box " .. k)
                        end
                    end
                end

                for k, v in pairs(Config.Locations["trash"]) do
                    if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 2) then
                        if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 1.0) then
                            DrawText3D(v.x, v.y, v.z, "~r~E~w~ - Garbage can")
                            if IsControlJustReleased(0, Keys["E"]) then
                                TriggerEvent('inventory:stash', 'mechanic Garbage')
                                TriggerServerEvent('mechanic:logs', GetPlayerName(PlayerId()) .. "(" .. GetPlayerServerId(PlayerId()) .. ") " .. "Open mechanic Garbage can")

                            end
                        elseif (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, v.x, v.y, v.z, true) < 1.5) then
                            DrawText3D(v.x, v.y, v.z, "Garbage can")
                        end
                    end
                end

                for k, v in pairs(Config.Locations["vehicle"]) do
                    if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 7.5) then
                         if true then
                             DrawMarker(2, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 0, 0, 222, false, false, false, true, false, false, false)
                             if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 1.5) then
                                 if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                                     DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Store the vehicle")
                                 else
                                     DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Vehicles")
                                 end
                                 if IsControlJustReleased(0, Keys["E"]) then
                                     if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                                        local veh = GetVehiclePedIsIn(GetPlayerPed(-1))
                                         ESX.Game.DeleteVehicle(veh)
                                         local hashVehicule = GetEntityModel(veh)
                                         local VehName = GetDisplayNameFromVehicleModel(hashVehicule)
                                         TriggerServerEvent('mecanico:logs', GetPlayerName(PlayerId()) .. "(" .. GetPlayerServerId(PlayerId()) .. ") " .. "Stored a vehicle")
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
                                    DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Store the helicopter")
                                elseif (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 1.5) then
                                    DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Helicopters")
                                end
                                if IsControlJustReleased(0, Keys["E"]) then
                                    if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                                        local veh = GetVehiclePedIsIn(GetPlayerPed(-1))
                                        ESX.Game.DeleteVehicle(veh)
                                        local hashVehicule = GetEntityModel(veh)
                                        local VehName = GetDisplayNameFromVehicleModel(hashVehicule)
                                        TriggerServerEvent('mecanico:logs', GetPlayerName(PlayerId()) .. "(" .. GetPlayerServerId(PlayerId()) .. ") " .. "Stored " .. VehName)
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
                                            TriggerServerEvent('mecanico:logs', GetPlayerName(PlayerId()) .. "(" .. GetPlayerServerId(PlayerId()) .. ") " .. "Taked out " .. VehName)
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
                            DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Impound")
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
                                DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Cameras")
                                if IsControlJustReleased(0, Keys["E"]) then
                                    SecurityCameras()
                                    TriggerServerEvent('mecanico:logs', GetPlayerName(PlayerId()) .. "(" .. GetPlayerServerId(PlayerId()) .. ") " .. "Open mecanico Cameras")
                                end
                            elseif (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 2.5) then
                                DrawText3D(v.x, v.y, v.z, "Cameras")
                            end  
                        end
                    end
                end

                for k, v in pairs(Config.Locations["boss"]) do
                    if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 4.5) and ESX.PlayerData.job.grade_name == 'boss' then
                         if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 1.5) then
                            DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Boss Menu")
                            if IsControlJustReleased(0, Keys["E"]) then
                                TriggerEvent('esx_society:openBossMenu', 'mechanic', function(data, menu)
                                    menu.close()
                                end, { wash = false })
                                TriggerServerEvent('mecanico:logs', GetPlayerName(PlayerId()) .. "(" .. GetPlayerServerId(PlayerId()) .. ") " .. "Open Boss Menu")
                            end
                        elseif (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 2.5) then
                            DrawText3D(v.x, v.y, v.z, "Boss Menu")
                        end  
                    end
                end

                for k, v in pairs(Config.Locations["license"]) do
                    if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 4.5) and ESX.PlayerData.job.grade_name == 'boss' then
                         if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 1.5) then
                            DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Create License")
                            if IsControlJustReleased(0, Keys["E"]) then
                                local player, distance = ESX.Game.GetClosestPlayer()
                                if player ~= -1 and distance < 2.5 then
                                    local playerId = GetPlayerServerId(player)
                                    TriggerServerEvent("mecanico:addLicense", playerId)
                                else
                                    TriggerEvent('notification', "No players nearby!", 2)
                                end
                            end
                        elseif (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 2.5) then
                            DrawText3D(v.x, v.y, v.z, "Create License")
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
        if ESX.PlayerData.job and (ESX.PlayerData.job.name == 'mechanic' or ESX.PlayerData.job.name == 'offmechanic') then
            for k, v in pairs(Config.Locations["duty"]) do
                if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 5) then
                    if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 1.5) then
                        if ESX.PlayerData.job.name == 'mechanic' then
                            DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Off Duty")
                            if IsControlJustPressed(0, 38) then
                                TriggerServerEvent('mecanico:duty', false)
                            end
                        else
                            DrawText3D(v.x, v.y, v.z, "~g~E~w~ - On Duty")
                            if IsControlJustPressed(0, 38) then
                                TriggerServerEvent('mecanico:duty', true)
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
        TriggerServerEvent('mecanico:logs', GetPlayerName(PlayerId()) .. "(" .. GetPlayerServerId(PlayerId()) .. ") " .. "Opened Camera System\n Camera Number: " ..data.current.camera)
        TriggerEvent('mecanico:client:ActiveCamera', data.current.camera)
    end, function(data, menu)
      menu.close()
    end)
end

RegisterNetEvent('YM:Cams')
AddEventHandler('YM:Cams', function()
    SecurityCameras()
end)
  
RegisterNetEvent('mecanico:client:showFingerprint')
AddEventHandler('mecanico:client:showFingerprint', function(playerId)
    openFingerprintUI()
    FingerPrintSessionId = playerId
end)

RegisterNetEvent('mecanico:client:showFingerprintId')
AddEventHandler('mecanico:client:showFingerprintId', function(fid)
    SendNUIMessage({
        type = "updateFingerprintId",
        fingerprintId = fid
    })
    PlaySound(-1, "Event_Start_Text", "GTAO_FM_Events_Soundset", 0, 0, 1)
end)

RegisterNUICallback('doFingerScan', function(data)
    TriggerServerEvent('mecanico:server:showFingerprintId', FingerPrintSessionId)
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

RegisterNetEvent('mecanico:client:SendEmergencyMessage')
AddEventHandler('mecanico:client:SendEmergencyMessage', function(message)
    local coords = GetEntityCoords(GetPlayerPed(-1))
    
    TriggerServerEvent("mecanico:server:SendEmergencyMessage", coords, message)
    TriggerEvent("mecanico:client:CallAnim")
end)

RegisterNetEvent('mecanico:client:EmergencySound')
AddEventHandler('mecanico:client:EmergencySound', function()
    PlaySound(-1, "Event_Start_Text", "GTAO_FM_Events_Soundset", 0, 0, 1)
end)

RegisterNetEvent('mecanico:client:CallAnim')
AddEventHandler('mecanico:client:CallAnim', function()
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

RegisterNetEvent('mecanico:client:ImpoundVehicle')
AddEventHandler('mecanico:client:ImpoundVehicle', function(fullImpound, price)
    local vehicle = ESX.Game.GetClosestVehicle()
    if vehicle ~= 0 and vehicle ~= nil then
        local pos = GetEntityCoords(GetPlayerPed(-1))
        local vehpos = GetEntityCoords(vehicle)
        if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, vehpos.x, vehpos.y, vehpos.z, true) < 5.0) and not IsPedInAnyVehicle(GetPlayerPed(-1)) then
            local plate = GetVehicleNumberPlateText(vehicle)
            TriggerServerEvent("mecanico:server:Impound", plate, fullImpound, price)
            ESX.Game.DeleteVehicle(vehicle)
        end
    end
end)

RegisterNetEvent('mecanico:client:CheckStatus')
AddEventHandler('mecanico:client:CheckStatus', function()
    local PlayerData = ESX.GetPlayerData()
    if PlayerData.job.name == "mechanic" then
        local player, distance = GetClosestPlayer()
        if player ~= -1 and distance < 5.0 then
            local playerId = GetPlayerServerId(player)
            ESX.TriggerServerCallback('mecanico:GetPlayerStatus', function(result)
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
    ESX.TriggerServerCallback("mecanico:GetImpoundedVehicles", function(result)
        ped = GetPlayerPed(-1);
        MenuTitle = "Vehicles:"
        ClearMenu()

        if result == nil or #result == 0 then
            TriggerEvent('notification', "There are no impound vehicles!", 2)
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
    TriggerServerEvent("mecanico:server:outOfImpound", vehicle.plate)
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
            TriggerEvent('notification', "You have no outfits saved...", 2, 3500)
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
    TriggerEvent('notification', oData.outfitname.." chosen!", 1, 2500)
    closeMenuFull()
    changeOutfit()
end

function removeOutfit(oData)
    TriggerServerEvent('clothes:removeOutfit', oData.outfitname)
    TriggerEvent('notification', oData.outfitname.." is removed!", 1, 2500)
    closeMenuFull()
end

function MenuGarage()
    ped = GetPlayerPed(-1);
    MenuTitle = "Garage"
    ClearMenu()
    Menu.addButton("Vehicles", "VehicleList", nil)
    Menu.addButton("Close Menu", "closeMenuFull", nil) 
    TriggerServerEvent('mecanico:logs', GetPlayerName(PlayerId()) .. "(" .. GetPlayerServerId(PlayerId()) .. ") " .. "Opened mecanico garage menu")
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
        TriggerServerEvent('mecanico:logs', GetPlayerName(PlayerId()) .. '(' .. GetPlayerServerId(PlayerId()) .. ') ' .. 'Taked out "' .. VehName .. '"')
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
	ESX.TriggerServerCallback('mecanico:FineList', function(fines)
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

			TriggerServerEvent('esx_billing:sendBill', player, 'society_mechanic', data.current.fineLabel, data.current.amount)

			Wait(300)
			FineMenu(player)
		end, function(data, menu)
			menu.close()
		end)
	end)
end