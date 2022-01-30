--------------------------------
------- Created by Hamza -------
-------------------------------- 

RegisterNetEvent("esx_drugs:activate_meth")
AddEventHandler("esx_drugs:activate_meth",function()
    local ped = GetPlayerPed(-1)
	if not IsPedInAnyVehicle(GetPlayerPed(-1)) then
		TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_SMOKING_POT", 0, true)
		exports['taskbar']:taskBar(10000, "Fumando Metha")
		Citizen.Wait(10000)
		ClearPedTasks(PlayerPedId())
	else
		exports['taskbar']:taskBar(10000, "Fumando Metha")
		Citizen.Wait(10000)
	end	
    SetTimecycleModifier("spectator5")
	SetPedMotionBlur(playerPed, true)
    if GetEntityHealth(ped) <= 180 then
        SetEntityHealth(ped,GetEntityHealth(ped)+20)
    elseif GetEntityHealth(ped) <= 199 then
        SetEntityHealth(ped,200)
    end
	Citizen.Wait(10000)
    SetTimecycleModifier("default")
	SetPedMotionBlur(playerPed, false)
end)

RegisterNetEvent("esx_drugs:activate_weed")
AddEventHandler("esx_drugs:activate_weed",function()
    local ped = GetPlayerPed(-1)
	if not IsPedInAnyVehicle(GetPlayerPed(-1)) then
		TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_SMOKING_POT", 0, true)
		exports['taskbar']:taskBar(10000, "Fumandote un Flaky")
		Citizen.Wait(10000)
		ClearPedTasks(PlayerPedId())
	else
		exports['taskbar']:taskBar(10000, "Fumandote un Flaky")
		Citizen.Wait(10000)
	end	
    SetTimecycleModifier("spectator5")
	SetPedMotionBlur(playerPed, true)
    if GetPedArmour(ped) <= 90 then
        AddArmourToPed(ped,10)
    elseif GetPedArmour(ped) <= 99 then
        SetPedArmour(ped,200)
    end
	Citizen.Wait(10000)
    SetTimecycleModifier("default")
	SetPedMotionBlur(playerPed, false)
end)

RegisterNetEvent("esx_drugs:activate_coke")
AddEventHandler("esx_drugs:activate_coke",function()
    local playerPed = PlayerId()
	if not IsPedInAnyVehicle(GetPlayerPed(-1)) then
		TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_SMOKING_POT", 0, true)
		exports['taskbar']:taskBar(10000, "Esnifando Cocaina")
		Citizen.Wait(10000)
		ClearPedTasks(PlayerPedId())
	else
		exports['taskbar']:taskBar(10000, "Esnifando Cocaina")
		Citizen.Wait(10000)
	end
	local timer = 0
	while timer < 60 do
    SetRunSprintMultiplierForPlayer(playerPed,1.2)
    SetTimecycleModifier("spectator5")
	SetPedMotionBlur(playerPed, true)
	ResetPlayerStamina(PlayerId())
	Citizen.Wait(2000)
	timer = timer + 2
	end
    SetTimecycleModifier("default")
	SetPedMotionBlur(playerPed, false)
    SetRunSprintMultiplierForPlayer(playerPed,1.0)
end)

RegisterNetEvent("esx_newDrugs:UsableItem")
AddEventHandler("esx_newDrugs:UsableItem",function()
	if not IsPedInAnyVehicle(GetPlayerPed(-1)) then
		TaskStartScenarioInPlace(PlayerPedId(), 'WORLD_HUMAN_STAND_MOBILE', 0, true)
		exports['taskbar']:taskBar(8000, "CONECTANDO")
		Citizen.Wait(8000)
	else
		exports['taskbar']:taskBar(8000, "CONECTANDO")
		Citizen.Wait(8000)
	end
end)

RegisterNetEvent("esx_newDrugs:HackingMiniGame")
AddEventHandler("esx_newDrugs:HackingMiniGame",function()
	toggleHackGame()
end)

function toggleHackGame()
	TriggerEvent("mhacking:show")
	TriggerEvent("mhacking:start",4,25,AtmHackFirstSuccess) 
	FreezeEntityPosition(GetPlayerPed(-1),true)
end

function AtmHackFirstSuccess(success)
    FreezeEntityPosition(GetPlayerPed(-1),false)
    TriggerEvent('mhacking:hide')
    if success then
		TriggerEvent("mhacking:show")
		TriggerEvent("mhacking:start",3,25,AtmHackSecondSuccess) 
		FreezeEntityPosition(GetPlayerPed(-1),true)
    else
		ESX.ShowNotification("~r~ha fallado~s~ para hackear la ~y~ubicación~s~")
		ClearPedTasks(PlayerPedId())
	end
end

function AtmHackSecondSuccess(success)
    FreezeEntityPosition(GetPlayerPed(-1),false)
    TriggerEvent('mhacking:hide')
    if success then
		ESX.TriggerServerCallback("esx_newDrugs:StartMissionNow",function()
		ESX.ShowNotification("Usted hackeo con éxito ~y~pirateada~s~ la ~b~red~s~")
		end)
    else
		ESX.ShowNotification("usted ~r~ha fallado~s~ al hackear la ~y~ubicación~s~")
		ClearPedTasks(PlayerPedId())
	end
	ClearPedTasks(PlayerPedId())
end