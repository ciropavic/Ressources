Keys = {
    ['ESC'] = 322, ['F1'] = 288, ['F2'] = 289, ['F3'] = 170, ['F5'] = 166, ['F6'] = 167, ['F7'] = 168, ['F8'] = 169, ['F9'] = 56, ['F10'] = 57,
    ['~'] = 243, ['1'] = 157, ['2'] = 158, ['3'] = 160, ['4'] = 164, ['5'] = 165, ['6'] = 159, ['7'] = 161, ['8'] = 162, ['9'] = 163, ['-'] = 84, ['='] = 83, ['BACKSPACE'] = 177,
    ['TAB'] = 37, ['Q'] = 44, ['W'] = 32, ['E'] = 38, ['R'] = 45, ['T'] = 245, ['Y'] = 246, ['U'] = 303, ['P'] = 199, ['['] = 39, [']'] = 40, ['ENTER'] = 18,
    ['CAPS'] = 137, ['A'] = 34, ['S'] = 8, ['D'] = 9, ['F'] = 23, ['G'] = 47, ['H'] = 74, ['K'] = 311, ['L'] = 182,
    ['LEFTSHIFT'] = 21, ['Z'] = 20, ['X'] = 73, ['C'] = 26, ['V'] = 0, ['B'] = 29, ['N'] = 249, ['M'] = 244, [','] = 82, ['.'] = 81,
    ['LEFTCTRL'] = 36, ['LEFTALT'] = 19, ['SPACE'] = 22, ['RIGHTCTRL'] = 70,
    ['HOME'] = 213, ['PAGEUP'] = 10, ['PAGEDOWN'] = 11, ['DELETE'] = 178,
    ['LEFT'] = 174, ['RIGHT'] = 175, ['TOP'] = 27, ['DOWN'] = 173,
}

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



--- CODE

local uiOpen = false
local currentRegister   = 0
local currentSafe = 0
local copsCalled = false
local CurrentCops = 0
local inFuckingSafeRob = false
local PlayerJob = {}

Citizen.CreateThread(function()
    Wait(1000)
    if ESX.GetPlayerData().job ~= nil and next(ESX.GetPlayerData().job) then
        PlayerJob = ESX.GetPlayerData().job
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000 * 60 * 5)
        if copsCalled then
            copsCalled = false
        end
    end
end)

Citizen.CreateThread(function()
    Citizen.Wait(1000)
    setupRegister()
    setupSafes()
    while true do
        local ped = GetPlayerPed(-1)
        local pos = GetEntityCoords(ped)
        local inRange = false
        for k, v in pairs(Config.Registers) do
            local dist = GetDistanceBetweenCoords(pos, Config.Registers[k].x, Config.Registers[k].y, Config.Registers[k].z)

            if dist <= 1 then
                inRange = true
                if Config.Registers[k].robbed then
                    DrawText3Ds(Config.Registers[k].x, Config.Registers[k].y, Config.Registers[k].z, 'La caja fuerte está vacía.')
                else
                    DrawText3Ds(Config.Registers[k].x, Config.Registers[k].y, Config.Registers[k].z, 'Use lockpick aquí para robar esta tienda.')
                end
            end
        end
        if not inRange then 
            Citizen.Wait(300)
        end
        Citizen.Wait(3)
    end
end)

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(1)
        local inRange = false
        if ESX ~= nil then
            local pos = GetEntityCoords(GetPlayerPed(-1))
            for safe,_ in pairs(Config.Safes) do
                local dist = GetDistanceBetweenCoords(pos, Config.Safes[safe].x, Config.Safes[safe].y, Config.Safes[safe].z)
                if dist < 3 then
                    inRange = true
                    if dist < 1.0 then
                        if not Config.Safes[safe].robbed then
                            DrawText3Ds(Config.Safes[safe].x, Config.Safes[safe].y, Config.Safes[safe].z, 'Press E to Try combination')
                            if IsControlJustPressed(0, Keys["E"]) then
                                ESX.TriggerServerCallback('storerobbery:server:getOfficers', function(amount)
                                    CurrentCops = amount
                                    if CurrentCops >= Config.MinimumStoreRobberyPolice then
                                        currentSafe = safe
    
                                        if math.random(100) <= 50 then
                                            TriggerServerEvent('ev-hud:Server:GainStress', math.random(1, 3))
                                        end
                                        if Config.Safes[safe].type == "keypad" then
                                            SendNUIMessage({
                                                action = "openKeypad",
                                            })
                                            SetNuiFocus(true, true)
                                        end
    
                                        if not copsCalled then
                                            local pos = GetEntityCoords(GetPlayerPed(-1))
                                            local s1, s2 = Citizen.InvokeNative(0x2EB41072B4C1E4C0, pos.x, pos.y, pos.z, Citizen.PointerValueInt(), Citizen.PointerValueInt())
                                            local street1 = GetStreetNameFromHashKey(s1)
                                            local street2 = GetStreetNameFromHashKey(s2)
                                            local streetLabel = street1
                                            if street2 ~= nil then 
                                                streetLabel = streetLabel .. " " .. street2
                                            end
                                            TriggerServerEvent("storerobbery:server:callCops", "Caja fuerte", currentSafe, streetLabel, pos)
                                            copsCalled = true
                                        end
                                    else
                                        TriggerEvent('notification', "No hay suficientes oficiales.", 2)
                                    end
                                end)
                            end
                        else
                            DrawText3Ds(Config.Safes[safe].x, Config.Safes[safe].y, Config.Safes[safe].z, 'Caja fuerte abierta')
                        end
                    end
                end
            end
        end

        if not inRange then
            Citizen.Wait(2000)
        end
    end
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerJob = JobInfo
end)

RegisterNetEvent('lockpick:use')
AddEventHandler('lockpick:use', function()
    for k, v in pairs(Config.Registers) do
        local ped = GetPlayerPed(-1)
        local pos = GetEntityCoords(ped)
        local dist = GetDistanceBetweenCoords(pos, Config.Registers[k].x, Config.Registers[k].y, Config.Registers[k].z)
        if dist <= 1 and not Config.Registers[k].robbed then
            ESX.TriggerServerCallback('storerobbery:server:getOfficers', function(amount)
                CurrentCops = amount
                if CurrentCops >= Config.MinimumStoreRobberyPolice then
                    currentRegister = k
                    if not copsCalled then
                        local s1, s2 = Citizen.InvokeNative(0x2EB41072B4C1E4C0, pos.x, pos.y, pos.z, Citizen.PointerValueInt(), Citizen.PointerValueInt())
                        local street1 = GetStreetNameFromHashKey(s1)
                        local street2 = GetStreetNameFromHashKey(s2)
                        local streetLabel = street1
                        if street2 ~= nil then 
                            streetLabel = streetLabel .. " " .. street2
                        end
                        TriggerServerEvent("storerobbery:server:callCops", "cashier", currentRegister, streetLabel, pos)
                        copsCalled = true
                    end
                    inFuckingSafeRob = true

                    Skillbar = exports['skillbar']:GetSkillbarObject()

                    Skillbar.Start({
                        duration = math.random(5500, 7000),
                        pos = math.random(10, 80),
                        width = math.random(10, 20),
                    }, function()
              
                        Skillbar.Start({
                            duration = math.random(2500, 5000),
                            pos = math.random(10, 80),
                            width = math.random(8, 15),
                        }, function()
                
                            Skillbar.Start({
                                duration = math.random(500, 2000),
                                pos = math.random(10, 80),
                                width = math.random(6, 10),
                            }, function()

                                inFuckingSafeRob = false

                                if currentRegister ~= 0 then
                                    lockpick(false)
                                    TriggerServerEvent('storerobbery:server:setRegisterStatus', currentRegister)
                                    local lockpickTime = 30000
                                    LockpickDoorAnim(lockpickTime)
                                    Progressbar("search_register", "Vacía la caja fuerte.", lockpickTime, false, true, {
                                        disableMovement = true,
                                        disableCarMovement = true,
                                        disableMouse = false,
                                        disableCombat = true,
                                    }, {
                                        animDict = "veh@break_in@0h@p_m_one@",
                                        anim = "low_force_entry_ds",
                                        flags = 16,
                                    }, {}, {}, function() -- Done
                                        openingDoor = false
                                        ClearPedTasks(GetPlayerPed(-1))
                                        TriggerServerEvent('storerobbery:server:takeMoney', currentRegister, true)            
                                        currentRegister = 0
                                    end, function() -- Cancel
                                        inFuckingSafeRob = false
                                        openingDoor = false
                                        ClearPedTasks(GetPlayerPed(-1))
                                        TriggerEvent('notification', "Cancelado.", 2)
                                        currentRegister = 0
                                    end)
                                    Citizen.CreateThread(function()
                                        while openingDoor do
                                            TriggerServerEvent('ev-hud:Server:GainStress', math.random(1, 3))
                                            Citizen.Wait(10000)
                                        end
                                    end)
                                else
                                    SendNUIMessage({
                                        action = "kekw",
                                    })
                                end

                            end, function()
                                Failed()
                            end)
              
                        end, function()
                            Failed()
                        end)
                          
                    end, function()
                        Failed()
                    end)
                
                else
                    TriggerEvent('notification', "No hay suficientes oficiales.", 2)
                end
            end)
        end
    end
end)

function IsWearingHandshoes()
    local armIndex = GetPedDrawableVariation(GetPlayerPed(-1), 3)
    local model = GetEntityModel(GetPlayerPed(-1))
    local retval = true
    
    if model == GetHashKey("mp_m_freemode_01") then
        if Config.MaleNoHandshoes[armIndex] ~= nil and Config.MaleNoHandshoes[armIndex] then
            retval = false
        end
    else
        if Config.FemaleNoHandshoes[armIndex] ~= nil and Config.FemaleNoHandshoes[armIndex] then
            retval = false
        end
    end
    return retval
end

function setupRegister()
    ESX.TriggerServerCallback('storerobbery:server:getRegisterStatus', function(Registers)
        for k, v in pairs(Registers) do
            Config.Registers[k].robbed = Registers[k].robbed
        end
    end)
end

function setupSafes()
    ESX.TriggerServerCallback('storerobbery:server:getSafeStatus', function(Safes)
        for k, v in pairs(Safes) do
            Config.Safes[k].robbed = Safes[k].robbed
        end
    end)
end

DrawText3Ds = function(x, y, z, text)
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

function lockpick(bool)
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        action = "ui",
        toggle = bool,
    })
    SetCursorLocation(0.5, 0.2)
    uiOpen = bool
end

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(100)
    end
end

function InRob()
    return inFuckingSafeRob
end

function takeAnim()
    local ped = GetPlayerPed(-1)
    while (not HasAnimDictLoaded("amb@prop_human_bum_bin@idle_b")) do
        RequestAnimDict("amb@prop_human_bum_bin@idle_b")
        Citizen.Wait(100)
    end
    TaskPlayAnim(ped, "amb@prop_human_bum_bin@idle_b", "idle_d", 8.0, 8.0, -1, 50, 0, false, false, false)
    Citizen.Wait(2500)
    TaskPlayAnim(ped, "amb@prop_human_bum_bin@idle_b", "exit", 8.0, 8.0, -1, 50, 0, false, false, false)
end

local openingDoor = false
RegisterNUICallback('success', function()
    if currentRegister ~= 0 then
        lockpick(false)
        TriggerServerEvent('storerobbery:server:setRegisterStatus', currentRegister)
        local lockpickTime = 30000
        LockpickDoorAnim(lockpickTime)
        Progressbar("search_register", "Vacía la caja fuerte.", lockpickTime, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = "veh@break_in@0h@p_m_one@",
            anim = "low_force_entry_ds",
            flags = 16,
        }, {}, {}, function() -- Done
            openingDoor = false
            ClearPedTasks(GetPlayerPed(-1))
            TriggerServerEvent('storerobbery:server:takeMoney', currentRegister, true)            
            currentRegister = 0
        end, function() -- Cancel
            openingDoor = false
            ClearPedTasks(GetPlayerPed(-1))
            TriggerEvent('notification', "Cancelado.", 2)
            currentRegister = 0
        end)
        Citizen.CreateThread(function()
            while openingDoor do
                TriggerServerEvent('ev-hud:Server:GainStress', math.random(1, 3))
                Citizen.Wait(10000)
            end
        end)
    else
        SendNUIMessage({
            action = "kekw",
        })
    end
end)

function LockpickDoorAnim(time)
    time = time / 1000
    loadAnimDict("veh@break_in@0h@p_m_one@")
    TaskPlayAnim(GetPlayerPed(-1), "veh@break_in@0h@p_m_one@", "low_force_entry_ds" ,3.0, 3.0, -1, 16, 0, false, false, false)
    openingDoor = true
    Citizen.CreateThread(function()
        while openingDoor do
            TaskPlayAnim(PlayerPedId(), "veh@break_in@0h@p_m_one@", "low_force_entry_ds", 3.0, 3.0, -1, 16, 0, 0, 0, 0)
            Citizen.Wait(2000)
            time = time - 2
            TriggerServerEvent('storerobbery:server:takeMoney', currentRegister, false)
            if time <= 0 then
                openingDoor = false
                StopAnimTask(GetPlayerPed(-1), "veh@break_in@0h@p_m_one@", "low_force_entry_ds", 1.0)
            end
        end
    end)
end

RegisterNUICallback('callcops', function()
    TriggerEvent("police:SetCopAlert")
end)

RegisterNetEvent('SafeCracker:EndMinigame')
AddEventHandler('SafeCracker:EndMinigame', function(won)
    if currentSafe ~= 0 then
        if won then
            if currentSafe ~= 0 then
                if not Config.Safes[currentSafe].robbed then
                    SetNuiFocus(false, false)
                    TriggerServerEvent("storerobbery:server:SafeReward", currentSafe)
                    TriggerServerEvent("storerobbery:server:setSafeStatus", currentSafe)
                    currentSafe = 0
                    takeAnim()
                end
            else
                SendNUIMessage({
                    action = "kekw",
                })
            end
        end
    end
    copsCalled = false
end)

RegisterNUICallback('PadLockSuccess', function()
    if currentSafe ~= 0 then
        if not Config.Safes[currentSafe].robbed then
            SendNUIMessage({
                action = "kekw",
            })
        end
    else
        SendNUIMessage({
            action = "kekw",
        })
    end
end)

RegisterNUICallback('PadLockClose', function()
    SetNuiFocus(false, false)
    copsCalled = false
end)

function Failed()
    inFuckingSafeRob = false
    if math.random(1, 100) < 20 then
        TriggerServerEvent("storerobbery:server:RemoveItem", "lockpick", 1)
    end

    if (IsWearingHandshoes() and math.random(1, 100) <= 25) then
        local pos = GetEntityCoords(GetPlayerPed(-1))
        TriggerEvent('notification', "Partiste a la ganzúa.")
    end
end

RegisterNUICallback("CombinationFail", function(data, cb)
    PlaySound(-1, "Place_Prop_Fail", "DLC_Dmod_Prop_Editor_Sounds", 0, 0, 1)
end)

RegisterNUICallback('fail', function()
    
    if math.random(1, 100) < 20 then
        TriggerServerEvent("storerobbery:server:RemoveItem", "lockpick", 1)
    end

    if (IsWearingHandshoes() and math.random(1, 100) <= 25) then
        local pos = GetEntityCoords(GetPlayerPed(-1))
        TriggerEvent('notification', "Partiste a la ganzúa.")
    end
    lockpick(false)
end)

RegisterNUICallback('exit', function()
    lockpick(false)
end)

RegisterNUICallback('TryCombination', function(data, cb)
    ESX.TriggerServerCallback('storerobbery:server:isCombinationRight', function(combination)
        if tonumber(data.combination) ~= nil then
            if tonumber(data.combination) == combination then
                TriggerServerEvent("storerobbery:server:SafeReward", currentSafe)
                TriggerServerEvent("storerobbery:server:setSafeStatus", currentSafe)
                SetNuiFocus(false, false)
                SendNUIMessage({
                    action = "closeKeypad",
                    error = false,
                })
                currentSafe = 0
                takeAnim()
            else
                TriggerEvent("police:SetCopAlert")
                SetNuiFocus(false, false)
                SendNUIMessage({
                    action = "closeKeypad",
                    error = true,
                })
                currentSafe = 0
            end
        end
    end, currentSafe)
end)

RegisterNetEvent('storerobbery:client:setRegisterStatus')
AddEventHandler('storerobbery:client:setRegisterStatus', function(register, bool)
    Config.Registers[register].robbed = bool
end)

RegisterNetEvent('storerobbery:client:setSafeStatus')
AddEventHandler('storerobbery:client:setSafeStatus', function(safe, bool)
    Config.Safes[safe].robbed = bool
end)

RegisterNetEvent('storerobbery:client:robberyCall')
AddEventHandler('storerobbery:client:robberyCall', function(type, key, streetLabel, coords)
    local cameraId = 4
    if type == "safe" then
        cameraId = Config.Safes[key].camId
    else
        cameraId = Config.Registers[key].camId
    end
    
    TriggerEvent('policealerts:client:AddPoliceAlert', {
        timeOut = 5000,
        alertTitle = "Store Robbery",
        coords = {
            x = coords.x,
            y = coords.y,
            z = coords.z,
        },
        details = {
            [1] = {
                icon = '<i class="fas fa-video"></i>',
                detail = cameraId,
            },
            [2] = {
                icon = '<i class="fas fa-globe-europe"></i>',
                detail = streetLabel,
            },
        },
        callSign = "12-98",
    })

end)

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