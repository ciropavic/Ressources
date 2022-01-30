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
end)

-- Code

AddEventHandler('lockpick:client:openLockpick', function(callback, amount)
    lockpickCallback = callback
    SetCursorLocation(0.5, 0.2)
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = "open",
        amount = amount or math.random(5, 10),
    })
end)

RegisterNUICallback('click', function()
    PlaySound(-1, "CLICK_BACK", "WEB_NAVIGATION_SOUNDS_PHONE", 0, 0, 1)
end)

RegisterNUICallback('failed', function()
    PlaySound(-1, "Place_Prop_Fail", "DLC_Dmod_Prop_Editor_Sounds", 0, 0, 1)
    ClearPedTasks(GetPlayerPed(-1))

    if lockpickCallback then
        lockpickCallback(false)
    end
end)

RegisterNUICallback('success', function()
    ClearPedTasks(GetPlayerPed(-1))

    if lockpickCallback then
        lockpickCallback(true)
    end
end)

RegisterNUICallback('closethermite', function()
    SetNuiFocus(false, false)
end)

RegisterCommand('testi', function()
    TriggerEvent('lockpick:client:openLockpick', function(s)
        print(s)
    end)
end)