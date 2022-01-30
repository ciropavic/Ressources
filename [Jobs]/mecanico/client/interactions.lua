Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(1)
        if isEscorted then
            DisableAllControlActions(0)
            EnableControlAction(0, 1, true)
			EnableControlAction(0, 2, true)
            EnableControlAction(0, Keys['T'], true)
            EnableControlAction(0, Keys['E'], true)
            EnableControlAction(0, Keys['ESC'], true)
        end

        if isHandcuffed then
            DisableControlAction(0, 24, true) -- Attack
			DisableControlAction(0, 257, true) -- Attack 2
			DisableControlAction(0, 25, true) -- Aim
			DisableControlAction(0, 263, true) -- Melee Attack 1

			DisableControlAction(0, Keys['R'], true) -- Reload
			DisableControlAction(0, Keys['SPACE'], true) -- Jump
			DisableControlAction(0, Keys['Q'], true) -- Cover
			DisableControlAction(0, Keys['TAB'], true) -- Select Weapon
			DisableControlAction(0, Keys['F'], true) -- Also 'enter'?

			DisableControlAction(0, Keys['F1'], true) -- Disable phone
			DisableControlAction(0, Keys['F2'], true) -- Inventory
			DisableControlAction(0, Keys['F3'], true) -- Animations
			DisableControlAction(0, Keys['F6'], true) -- Job

			DisableControlAction(0, Keys['C'], true) -- Disable looking behind
			DisableControlAction(0, Keys['X'], true) -- Disable clearing animation
			DisableControlAction(2, Keys['P'], true) -- Disable pause screen

			DisableControlAction(0, 59, true) -- Disable steering in vehicle
			DisableControlAction(0, 71, true) -- Disable driving forward in vehicle
			DisableControlAction(0, 72, true) -- Disable reversing in vehicle

			DisableControlAction(2, Keys['LEFTCTRL'], true) -- Disable going stealth

			DisableControlAction(0, 264, true) -- Disable melee
			DisableControlAction(0, 257, true) -- Disable melee
			DisableControlAction(0, 140, true) -- Disable melee
			DisableControlAction(0, 141, true) -- Disable melee
			DisableControlAction(0, 142, true) -- Disable melee
			DisableControlAction(0, 143, true) -- Disable melee
			DisableControlAction(0, 75, true)  -- Disable exit vehicle
			DisableControlAction(27, 75, true) -- Disable exit vehicle

            if (not IsEntityPlayingAnim(GetPlayerPed(-1), "mp_arresting", "idle", 3) and not IsEntityPlayingAnim(GetPlayerPed(-1), "mp_arrest_paired", "crook_p2_back_right", 3)) then
                loadAnim("mp_arresting")
                TaskPlayAnim(GetPlayerPed(-1), "mp_arresting", "idle", 8.0, -8, -1, cuffType, 0, 0, 0, 0)
            end
        end
        if not isHandcuffed and not isEscorted then
            Citizen.Wait(2000)
        end
    end
end)

RegisterNetEvent('mecanico:client:SetOutVehicle')
AddEventHandler('mecanico:client:SetOutVehicle', function()
    if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
        local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
        TaskLeaveVehicle(GetPlayerPed(-1), vehicle, 16)
    end
end)

RegisterNetEvent('mecanico:client:PutInVehicle')
AddEventHandler('mecanico:client:PutInVehicle', function()
    local vehicle = ESX.Game.GetClosestVehicle()
    if DoesEntityExist(vehicle) then
		for i = GetVehicleMaxNumberOfPassengers(vehicle), 1, -1 do
            if IsVehicleSeatFree(vehicle, i) then
                isEscorted = false
                TriggerEvent('hospital:client:isEscorted', isEscorted)
                ClearPedTasks(GetPlayerPed(-1))
                DetachEntity(GetPlayerPed(-1), true, false)

                Citizen.Wait(100)
                SetPedIntoVehicle(GetPlayerPed(-1), vehicle, i)
                return
            end
        end
	end
end)

RegisterNetEvent('mecanico:client:checkBank')
AddEventHandler('mecanico:client:checkBank', function()
	t, distance, closestPed = ESX.Game.GetClosestPlayer()
	if(distance ~= -1 and distance < 7) then
		TriggerServerEvent("mecanico:targetCheckBank", GetPlayerServerId(t))
	else
		TriggerEvent("notification", "No player near you!",2)
	end
end)

RegisterNetEvent('mecanico:client:SearchPlayer')
AddEventHandler('mecanico:client:SearchPlayer', function()
    local player, distance = ESX.Game.GetClosestPlayer()
    if player ~= -1 and distance < 2.5 then
        local playerId = GetPlayerServerId(player)
        TriggerEvent('ev-inventory:search')
        -- Open player inventory -- todo
    else
        TriggerEvent('notification', "No player near you!", 2)
    end
end)

RegisterNetEvent('mecanico:client:SeizeCash')
AddEventHandler('mecanico:client:SeizeCash', function()
    local player, distance = ESX.Game.GetClosestPlayer()
    if player ~= -1 and distance < 2.5 then
        local playerId = GetPlayerServerId(player)
        TriggerServerEvent("mecanico:server:SeizeCash", playerId)
    else
        TriggerEvent('notification', "No player near you!", 2)
    end
end)

RegisterNetEvent('mecanico:client:SeizeDriverLicense')
AddEventHandler('mecanico:client:SeizeDriverLicense', function()
    local player, distance = ESX.Game.GetClosestPlayer()
    if player ~= -1 and distance < 2.5 then
        local playerId = GetPlayerServerId(player)
        TriggerServerEvent("mecanico:server:SeizeDriverLicense", playerId)
    else
        TriggerEvent('notification', "No player near you!", 2)
    end
end)


RegisterNetEvent('mecanico:client:RobPlayer')
AddEventHandler('mecanico:client:RobPlayer', function()
    local player, distance = ESX.Game.GetClosestPlayer()
    if player ~= -1 and distance < 2.5 then
        local playerPed = GetPlayerPed(player)
        local playerId = GetPlayerServerId(player)
        if IsEntityPlayingAnim(playerPed, "missminuteman_1ig_2", "handsup_base", 3) or IsEntityPlayingAnim(playerPed, "mp_arresting", "idle", 3) or IsTargetDead(playerId) then
            exports["taskbar"]:taskBar(math.random(5000, 7000) ,"Robbing")
            local plyCoords = GetEntityCoords(playerPed)
            local pos = GetEntityCoords(GetPlayerPed(-1))
            local dist = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, plyCoords.x, plyCoords.y, plyCoords.z, true)
            if dist < 2.5 then
                StopAnimTask(GetPlayerPed(-1), "random@shop_robbery", "robbery_action_b", 1.0)
                TriggerEvent('mecanico:client:SearchPlayer')
            else
                TriggerEvent('notification', "No player near you!", 2)
            end
        end
    else
        TriggerEvent('notification', "No player near you!", 2)
    end
end)

RegisterNetEvent('YM:RobPlayer')
AddEventHandler('YM:RobPlayer', function()
    exports["taskbar"]:taskBar(math.random(5000, 7000) ,"Robbing...")
    TriggerEvent('ev-inventory:search')
end)

RegisterNetEvent('YM:mecanicorob')
AddEventHandler('YM:mecanicorob', function()
    exports["taskbar"]:taskBar(math.random(5000, 7000) ,"Open Bag")
    TriggerEvent('ev-inventory:search')
end)

RegisterNetEvent('YM:lootdeadbody')
AddEventHandler('YM:lootdeadbody', function()
    exports["taskbar"]:taskBar(math.random(2000, 4000) ,"Robbing")
    TriggerEvent('ev-inventory:loot')
end)

RegisterNetEvent('mecanico:client:JailCommand')
AddEventHandler('mecanico:client:JailCommand', function(playerId, time)
    TriggerServerEvent("mecanico:server:JailPlayer", playerId, tonumber(time))
end)

RegisterNetEvent('mecanico:client:BillCommand')
AddEventHandler('mecanico:client:BillCommand', function(playerId, price)
    TriggerServerEvent("mecanico:server:BillPlayer", playerId, tonumber(price))
end)

RegisterNetEvent('mecanico:client:JailPlayer')
AddEventHandler('mecanico:client:JailPlayer', function()
    local player, distance = ESX.Game.GetClosestPlayer()
    if player ~= -1 and distance < 2.5 then
        local playerId = GetPlayerServerId(player)
        DisplayOnscreenKeyboard(1, "", "", "", "", "", "", 20)
        while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
            Citizen.Wait(7)
        end
        local time = GetOnscreenKeyboardResult()
        if tonumber(time) > 0 then
            TriggerServerEvent("mecanico:server:JailPlayer", playerId, tonumber(time))
        else
            TriggerEvent('notification', "Invaild Jail Time!", 2)
        end
    else
        TriggerEvent('notification', "No player near you!", 2)
    end
end)

RegisterNetEvent('mecanico:client:BillPlayer')
AddEventHandler('mecanico:client:BillPlayer', function()
    local player, distance = ESX.Game.GetClosestPlayer()
    if player ~= -1 and distance < 2.5 then
        local playerId = GetPlayerServerId(player)
        DisplayOnscreenKeyboard(1, "", "", "", "", "", "", 20)
        while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
            Citizen.Wait(7)
        end
        local price = GetOnscreenKeyboardResult()
        if tonumber(price) > 0 then
            TriggerServerEvent("mecanico:server:BillPlayer", playerId, tonumber(price))
        else
            TriggerEvent('notification', "Invaild Price!", 2)
        end
    else
        TriggerEvent('notification', "No player near you!", 2)
    end
end)

RegisterNetEvent('mecanico:client:PutPlayerInVehicle')
AddEventHandler('mecanico:client:PutPlayerInVehicle', function()
    local player, distance = ESX.Game.GetClosestPlayer()
    if player ~= -1 and distance < 2.5 then
        local playerId = GetPlayerServerId(player)
        if (not isHandcuffed and not isEscorted) then
            TriggerServerEvent('mecanico:logs', GetPlayerName(PlayerId()) .. "(" .. GetPlayerServerId(PlayerId()) .. ") " .. "set " .. GetPlayerName(player) .. "(" .. playerId .. ") in vehicle")
            TriggerServerEvent("mecanico:server:PutPlayerInVehicle", playerId)
        end
    else
        TriggerEvent('notification', "No player near you!", 2)
    end
end)


RegisterNetEvent('mecanico:client:SetPlayerOutVehicle')
AddEventHandler('mecanico:client:SetPlayerOutVehicle', function()
    local player, distance = ESX.Game.GetClosestPlayer()
    if player ~= -1 and distance < 2.5 then
        local playerId = GetPlayerServerId(player)
        if not isHandcuffed and not isEscorted then
            TriggerServerEvent('mecanico:logs', GetPlayerName(PlayerId()) .. "(" .. GetPlayerServerId(PlayerId()) .. ") " .. "set " .. GetPlayerName(player) .. "(" .. playerId .. ") out of vehicle")
            TriggerServerEvent("mecanico:server:SetPlayerOutVehicle", playerId)
        end
    else
        TriggerEvent('notification', "No player near you!", 2)
    end
end)

RegisterNetEvent('mecanico:client:EscortPlayer')
AddEventHandler('mecanico:client:EscortPlayer', function()
    local player, distance = ESX.Game.GetClosestPlayer()
    if player ~= -1 and distance < 2.5 then
        local playerId = GetPlayerServerId(player)
        if not isHandcuffed and not isEscorted then
            TriggerServerEvent('mecanico:logs', GetPlayerName(PlayerId()) .. "(" .. GetPlayerServerId(PlayerId()) .. ") " .. "Escort " .. GetPlayerName(player) .. "(" .. playerId .. ")")
            TriggerServerEvent("mecanico:server:EscortPlayer", playerId)
        end
    else
        TriggerEvent('notification', "No player near you!", 2)
    end
end)

function IsHandcuffed()
    return isHandcuffed
end

function IsEscorted()
    return isEscorted
end

--[[RegisterNetEvent('mecanico:client:RobPlayer')
AddEventHandler('mecanico:client:RobPlayer', function()
    local player, distance = ESX.Game.GetClosestPlayer()
    if player ~= -1 and distance < 2.5 then
        local playerId = GetPlayerServerId(player)
        if not IsPedInAnyVehicle(GetPlayerPed(player)) then
            if not isHandcuffed and not isEscorted then
                TriggerServerEvent('mecanico:logs', GetPlayerName(PlayerId()) .. "(" .. GetPlayerServerId(PlayerId()) .. ") " .. "Is robbing " .. GetPlayerName(player) .. "(" .. playerId .. ")")
                TriggerServerEvent("mecanico:server:KidnapPlayer", playerId)
            end
        end
    else
        TriggerEvent('notification', "No player near you!", 2)
    end
end)]]--

RegisterNetEvent('mecanico:client:fineMenu')
AddEventHandler('mecanico:client:fineMenu', function()
    if not IsPedRagdoll(GetPlayerPed(-1)) then
        local player, distance = ESX.Game.GetClosestPlayer()
        if player ~= -1 and distance < 1.5 then
            local playerId = GetPlayerServerId(player)
            FineMenu(playerId)
        else
            TriggerEvent('notification', "No player near you!", 2)
        end
    else
        Citizen.Wait(2000)
    end
end)

RegisterNetEvent('mecanico:client:CuffPlayerSoft')
AddEventHandler('mecanico:client:CuffPlayerSoft', function()
    if not IsPedRagdoll(GetPlayerPed(-1)) then
        local player, distance = ESX.Game.GetClosestPlayer()
        if player ~= -1 and distance < 1.5 then
            local playerId = GetPlayerServerId(player)
            if (not isHandcuffed and not isEscorted) and (IsEntityPlayingAnim ( GetPlayerPed(player), "random@mugging3", "handsup_standing_base", 3) or IsEntityPlayingAnim(GetPlayerPed(player), "random@arrests@busted", "idle_a", 3) or ESX.PlayerData.job.name == 'mecanico') then
                TriggerServerEvent('mecanico:logs', GetPlayerName(PlayerId()) .. "(" .. GetPlayerServerId(PlayerId()) .. ") " .. "Cuff (Soft) " .. GetPlayerName(player) .. "(" .. playerId .. ")")
                TriggerServerEvent("mecanico:server:CuffPlayer", playerId, true)
                HandCuffAnimation()
            else
                TriggerEvent("notification", "You can only cuff players that have their hands up.",2)
            end
        else
            TriggerEvent('notification', "No player near you!", 2)
        end
    else
        Citizen.Wait(2000)
    end
end)

RegisterNetEvent('mecanico:client:CuffPlayer')
AddEventHandler('mecanico:client:CuffPlayer', function()
    if not IsPedRagdoll(GetPlayerPed(-1)) then
        local player, distance = ESX.Game.GetClosestPlayer()
        if player ~= -1 and distance < 1.5 then
            local playerId = GetPlayerServerId(player)
            if (not isHandcuffed and not isEscorted) and (IsEntityPlayingAnim ( GetPlayerPed(player), "random@mugging3", "handsup_standing_base", 3) or IsEntityPlayingAnim(GetPlayerPed(player), "random@arrests@busted", "idle_a", 3) or ESX.PlayerData.job.name == 'mecanico') then
                TriggerServerEvent('mecanico:logs', GetPlayerName(PlayerId()) .. "(" .. GetPlayerServerId(PlayerId()) .. ") " .. "Cuff (Hard) " .. GetPlayerName(player) .. "(" .. playerId .. ")")
                TriggerServerEvent("mecanico:server:CuffPlayer", playerId, false)
                HandCuffAnimation()
            else
                TriggerEvent("notification", "You can only cuff players that have their hands up.",2)
            end
        else
            TriggerEvent('notification', "No player near you!", 2)
        end
    else
        Citizen.Wait(2000)
    end
end)

RegisterNetEvent('mecanico:client:UnCuffPlayer')
AddEventHandler('mecanico:client:UnCuffPlayer', function()
    if not IsPedRagdoll(GetPlayerPed(-1)) then
        local player, distance = ESX.Game.GetClosestPlayer()
        if player ~= -1 and distance < 1.5 then
            local playerId = GetPlayerServerId(player)
            if (not isHandcuffed and not isEscorted) and (IsEntityPlayingAnim(GetPlayerPed(player), "mp_arresting", "idle", 3) or IsEntityPlayingAnim(GetPlayerPed(player), "mp_arrest_paired", "crook_p2_back_right", 3) or ESX.PlayerData.job.name == 'mecanico') then
                TriggerServerEvent('mecanico:logs', GetPlayerName(PlayerId()) .. "(" .. GetPlayerServerId(PlayerId()) .. ") " .. "Uncuffed " .. GetPlayerName(player) .. '(' .. playerId .. ')') 
                TriggerServerEvent('mecanico:server:UnCuffPlayer', playerId)
                UnHandCuffAnimation()
            else
                TriggerEvent("notification", "You can only uncuff players that have their hands cuff.",2)
            end
        else
            TriggerEvent('notification', "No player near you!", 2)
        end
    else
        Citizen.Wait(2000)
    end
end)

RegisterNetEvent('mecanico:client:GetEscorted')
AddEventHandler('mecanico:client:GetEscorted', function(playerId)
    if not isEscorted then
        isEscorted = true
        draggerId = playerId
        local dragger = GetPlayerPed(GetPlayerFromServerId(playerId))
        local heading = GetEntityHeading(dragger)
        SetEntityCoords(GetPlayerPed(-1), GetOffsetFromEntityInWorldCoords(dragger, 0.0, 0.45, 0.0))
        AttachEntityToEntity(GetPlayerPed(-1), dragger, 11816, 0.45, 0.45, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
    else
        isEscorted = false
        DetachEntity(GetPlayerPed(-1), true, false)
    end
    TriggerEvent('hospital:client:isEscorted', isEscorted)
end)

RegisterNetEvent('mecanico:client:DeEscort')
AddEventHandler('mecanico:client:DeEscort', function()
    isEscorted = false
    TriggerEvent('hospital:client:isEscorted', isEscorted)
    DetachEntity(GetPlayerPed(-1), true, false)
end)

RegisterNetEvent('mecanico:client:GetKidnappedTarget')
AddEventHandler('mecanico:client:GetKidnappedTarget', function(playerId)
    local PlayerData = ESX.GetPlayerData()
    if not isEscorted then
        isEscorted = true
        draggerId = playerId
        local dragger = GetPlayerPed(GetPlayerFromServerId(playerId))
        local heading = GetEntityHeading(dragger)
        RequestAnimDict("nm")

        while not HasAnimDictLoaded("nm") do
            Citizen.Wait(10)
        end
        -- AttachEntityToEntity(GetPlayerPed(-1), dragger, 11816, 0.45, 0.45, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
        AttachEntityToEntity(GetPlayerPed(-1), dragger, 0, 0.27, 0.15, 0.63, 0.5, 0.5, 0.0, false, false, false, false, 2, false)
        TaskPlayAnim(GetPlayerPed(-1), "nm", "firemans_carry", 8.0, -8.0, 100000, 33, 0, false, false, false)
    else
        isEscorted = false
        DetachEntity(GetPlayerPed(-1), true, false)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end
    TriggerEvent('hospital:client:isEscorted', isEscorted)
end)

local isEscorting = false

RegisterNetEvent('mecanico:client:GetKidnappedDragger')
AddEventHandler('mecanico:client:GetKidnappedDragger', function(playerId)
    if not isEscorting then
        draggerId = playerId
        local dragger = GetPlayerPed(-1)
        RequestAnimDict("missfinale_c2mcs_1")

        while not HasAnimDictLoaded("missfinale_c2mcs_1") do
            Citizen.Wait(10)
        end
        TaskPlayAnim(dragger, "missfinale_c2mcs_1", "fin_c2_mcs_1_camman", 8.0, -8.0, 100000, 49, 0, false, false, false)
        isEscorting = true
    else
        local dragger = GetPlayerPed(-1)
        ClearPedSecondaryTask(dragger)
        ClearPedTasksImmediately(dragger)
        isEscorting = false
    end
    TriggerEvent('hospital:client:SetEscortingState', isEscorting)
    TriggerEvent('qb-kidnapping:client:SetKidnapping', isEscorting)
end)

RegisterNetEvent('mecanico:client:GetCuffed')
AddEventHandler('mecanico:client:GetCuffed', function(playerId, isSoftcuff)
    isSoftcuff = isSoftcuff or true
    isHandcuffed = true
    TriggerServerEvent("mecanico:server:SetHandcuffStatus", true)
    ClearPedTasksImmediately(GetPlayerPed(-1))
    if not isSoftcuff then
        cuffType = 16
        GetCuffedAnimation(playerId)
    else
        cuffType = 49
        GetCuffedAnimation(playerId)
    end
end)

RegisterNetEvent('mecanico:client:GetUnCuffed')
AddEventHandler('mecanico:client:GetUnCuffed', function(playerId)
    isHandcuffed = false
    TriggerServerEvent("mecanico:server:SetHandcuffStatus", false)
    ClearPedTasksImmediately(GetPlayerPed(-1))
    GetUnCuffedAnimation(playerId)
end)

function IsTargetDead(playerId)
    local retval = false
    ESX.TriggerServerCallback('mecanico:server:isPlayerDead', function(result)
        retval = result
    end, playerId)
    Citizen.Wait(100)
    return retval
end


function UnHandCuffAnimation()
    Citizen.Wait(250)
	loadAnim('mp_arresting')
	TaskPlayAnim(GetPlayerPed(-1), 'mp_arresting', 'a_uncuff', 8.0, -8,-1, 2, 0, 0, 0, 0)
	Citizen.Wait(5500)
    ClearPedTasks(GetPlayerPed(-1))
end

function HandCuffAnimation()
    loadAnim("mp_arrest_paired")
	Citizen.Wait(100)
    TaskPlayAnim(GetPlayerPed(-1), "mp_arrest_paired", "cop_p2_back_right", 3.0, 3.0, -1, 48, 0, 0, 0, 0)
	Citizen.Wait(3500)
    TaskPlayAnim(GetPlayerPed(-1), "mp_arrest_paired", "exit", 3.0, 3.0, -1, 48, 0, 0, 0, 0)
end

function GetCuffedAnimation(playerId)
    local cuffer = GetPlayerPed(GetPlayerFromServerId(playerId))
    local heading = GetEntityHeading(cuffer)
    loadAnim("mp_arrest_paired")
    SetEntityCoords(GetPlayerPed(-1), GetOffsetFromEntityInWorldCoords(cuffer, 0.0, 0.45, 0.0))
	Citizen.Wait(100)
	SetEntityHeading(GetPlayerPed(-1), heading)
	TaskPlayAnim(GetPlayerPed(-1), "mp_arrest_paired", "crook_p2_back_right", 3.0, 3.0, -1, 32, 0, 0, 0, 0)
	Citizen.Wait(2500)
end

function GetUnCuffedAnimation(playerId)
    local cuffer = GetPlayerPed(GetPlayerFromServerId(playerId))
    local heading = GetEntityHeading(cuffer)
    loadAnim("mp_arresting")
    SetEntityCoords(GetPlayerPed(-1), GetOffsetFromEntityInWorldCoords(cuffer, 0.0, 0.45, 0.0))
	Citizen.Wait(100)
    SetEntityHeading(GetPlayerPed(-1), heading)
    TaskPlayAnim(GetPlayerPed(-1), 'mp_arresting', 'b_uncuff', 8.0, -8,-1, 2, 0, 0, 0, 0)
    Citizen.Wait(5500)
    ClearPedTasksImmediately(GetPlayerPed(-1))

end

function Progressbar(name, label, duration, useWhileDead, canCancel, disableControls, animation, prop, propTwo, onFinish, onCancel)
    exports['progressbar']:Progress({
        name = name:lower(),
        duration = duration,
        label = label,
        useWhileDead = useWhileDead,
        canCancel = canCancel,
        controlDisables = disableControls,
        animation = animation,
        prop = prop,
        propTwo = propTwo,
    }, function(cancelled)
        if not cancelled then
            if onFinish ~= nil then
                onFinish()
            end
        else
            if onCancel ~= nil then
                onCancel()
            end
        end
    end)
end


function loadAnim( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end

local facialWear = {
	[1] = { ["Prop"] = -1, ["Texture"] = -1 },
	[2] = { ["Prop"] = -1, ["Texture"] = -1 },
	[3] = { ["Prop"] = -1, ["Texture"] = -1 },
	[4] = { ["Prop"] = -1, ["Palette"] = -1, ["Texture"] = -1 }, -- this is actually a pedtexture variations, not a prop
	[5] = { ["Prop"] = -1, ["Palette"] = -1, ["Texture"] = -1 }, -- this is actually a pedtexture variations, not a prop
	[6] = { ["Prop"] = -1, ["Palette"] = -1, ["Texture"] = -1 }, -- this is actually a pedtexture variations, not a prop
}

RegisterCommand('remask', function()
    TriggerEvent('mecanico:remmask')
end)

RegisterNetEvent('mecanico:remmaskAccepted')
AddEventHandler('mecanico:remmaskAccepted', function()
	TriggerEvent("mecanico:facewearAdjust", 1, true)
	TriggerEvent("mecanico:facewearAdjust", 3, true)
	TriggerEvent("mecanico:facewearAdjust", 4, true)
	TriggerEvent("mecanico:facewearAdjust", 2, true)
end)

RegisterNetEvent('mecanico:remmask')
AddEventHandler('mecanico:remmask', function()
	local t, distance = ESX.Game.GetClosestPlayer()
	if (distance ~= -1 and distance < 2) then
		if isOppositeDir(GetEntityHeading(t),GetEntityHeading(PlayerPedId())) and not IsPedInVehicle(t,GetVehiclePedIsIn(t, false),false) then
			TriggerServerEvent("mecanico:remmaskGranted", GetPlayerServerId(t))
			AnimSet = "mp_missheist_ornatebank"
			AnimationOn = "stand_cash_in_bag_intro"
			AnimationOff = "stand_cash_in_bag_intro"
			loadAnim( AnimSet )
			TaskPlayAnim( PlayerPedId(), AnimSet, AnimationOn, 8.0, -8, -1, 49, 0, 0, 0, 0 )
			Citizen.Wait(500)
			ClearPedTasks(PlayerPedId())						
		end
	else
		TriggerEvent("notification", "No player near you (maybe get closer)!",2)
	end
end)

function isOppositeDir(a,b)

	local result = 0 

	if a < 90 then
		a = 360 + a
	end

	if b < 90 then
		b = 360 + b
	end	

	if a > b then
		result = a - b
	else
		result = b - a
	end

	if result > 110 then
		return true
	else
		return false
	end

end

RegisterNetEvent("mecanico:facewearAdjust")
AddEventHandler("mecanico:facewearAdjust",function(faceType,remove)
	local AnimSet = "none"
	local AnimationOn = "none"
	local AnimationOff = "none"
	local PropIndex = 0

	local AnimSet = "mp_masks@on_foot"
	local AnimationOn = "put_on_mask"
	local AnimationOff = "put_on_mask"

	facialWear[6]["Prop"] = GetPedDrawableVariation(PlayerPedId(), 0)
	facialWear[6]["Palette"] = GetPedPaletteVariation(PlayerPedId(), 0)
	facialWear[6]["Texture"] = GetPedTextureVariation(PlayerPedId(), 0)

	for i = 0, 3 do
		if GetPedPropIndex(PlayerPedId(), i) ~= -1 then
			facialWear[i+1]["Prop"] = GetPedPropIndex(PlayerPedId(), i)
		end
		if GetPedPropTextureIndex(PlayerPedId(), i) ~= -1 then
			facialWear[i+1]["Texture"] = GetPedPropTextureIndex(PlayerPedId(), i)
		end
	end

	if GetPedDrawableVariation(PlayerPedId(), 1) ~= -1 then
		facialWear[4]["Prop"] = GetPedDrawableVariation(PlayerPedId(), 1)
		facialWear[4]["Palette"] = GetPedPaletteVariation(PlayerPedId(), 1)
		facialWear[4]["Texture"] = GetPedTextureVariation(PlayerPedId(), 1)
	end

	if GetPedDrawableVariation(PlayerPedId(), 11) ~= -1 then
		facialWear[5]["Prop"] = GetPedDrawableVariation(PlayerPedId(), 11)
		facialWear[5]["Palette"] = GetPedPaletteVariation(PlayerPedId(), 11)
		facialWear[5]["Texture"] = GetPedTextureVariation(PlayerPedId(), 11)
	end

	if faceType == 1 then
		PropIndex = 0
	elseif faceType == 2 then
		PropIndex = 1

		AnimSet = "clothingspecs"
		AnimationOn = "take_off"
		AnimationOff = "take_off"

	elseif faceType == 3 then
		PropIndex = 2
	elseif faceType == 4 then
		PropIndex = 1
		if remove then
			AnimSet = "missfbi4"
			AnimationOn = "takeoff_mask"
			AnimationOff = "takeoff_mask"
		end
	elseif faceType == 5 then
		PropIndex = 11
		AnimSet = "oddjobs@basejump@ig_15"
		AnimationOn = "puton_parachute"
		AnimationOff = "puton_parachute"	
	end

	loadAnim( AnimSet )
	if faceType == 5 then
		if remove then
			SetPedComponentVariation(PlayerPedId(), 3, 2, facialWear[6]["Texture"], facialWear[6]["Palette"])
		end
	end
	if remove then
		TaskPlayAnim( PlayerPedId(), AnimSet, AnimationOff, 4.0, 3.0, -1, 49, 1.0, 0, 0, 0 )
		Citizen.Wait(500)
		if faceType ~= 5 then
			if faceType == 4 then
				SetPedComponentVariation(PlayerPedId(), PropIndex, -1, -1, -1)
			else
				if faceType ~= 2 then
					ClearPedProp(PlayerPedId(), tonumber(PropIndex))
				end
			end
		end
	else
		TaskPlayAnim( PlayerPedId(), AnimSet, AnimationOn, 4.0, 3.0, -1, 49, 1.0, 0, 0, 0 )
		Citizen.Wait(500)
		if faceType ~= 5 and faceType ~= 2 then
			if faceType == 4 then
				SetPedComponentVariation(PlayerPedId(), PropIndex, facialWear[faceType]["Prop"], facialWear[faceType]["Texture"], facialWear[faceType]["Palette"])
			else
				SetPedPropIndex( PlayerPedId(), tonumber(PropIndex), tonumber(facialWear[PropIndex+1]["Prop"]), tonumber(facialWear[PropIndex+1]["Texture"]), false)
			end
		end
	end
	if faceType == 5 then
		if not remove then
			SetPedComponentVariation(PlayerPedId(), 3, 1, facialWear[6]["Texture"], facialWear[6]["Palette"])
			SetPedComponentVariation(PlayerPedId(), PropIndex, facialWear[faceType]["Prop"], facialWear[faceType]["Texture"], facialWear[faceType]["Palette"])
		else
			SetPedComponentVariation(PlayerPedId(), PropIndex, -1, -1, -1)
		end
		Citizen.Wait(1800)
	end
	if faceType == 2 then
		Citizen.Wait(600)
		if remove then
			ClearPedProp(PlayerPedId(), tonumber(PropIndex))
		end

		if not remove then
			Citizen.Wait(140)
			SetPedPropIndex( PlayerPedId(), tonumber(PropIndex), tonumber(facialWear[PropIndex+1]["Prop"]), tonumber(facialWear[PropIndex+1]["Texture"]), false)
		end
	end
	if faceType == 4 and remove then
		Citizen.Wait(1200)
	end
	ClearPedTasks(PlayerPedId())
end)
