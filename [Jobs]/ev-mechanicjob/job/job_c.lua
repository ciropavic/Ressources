
local ESX = nil

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

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

local MechanicLocation = vector3(-1424.39, 1577.27, 92.48)
Citizen.CreateThread(function()

    while ESX == nil do Wait(1) end

    while true do 
        local plyPed = PlayerPedId()

        if IsPedInAnyVehicle(plyPed, false) and ESX.PlayerData.job and ESX.PlayerData.job.name == 'mechanic' then
            local plyPos = GetEntityCoords(plyPed)


            nearDefault = isNear(plyPos, MechanicLocation, 2) 

            if nearDefault then

                 if not isPlyInBennys then
                    DrawMarker(21, MechanicLocation.x, MechanicLocation.y, MechanicLocation.z + 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 148, 0, 211, 255, true, false, 2, true, nil, nil, false)
                    Draw3DText(MechanicLocation.x, MechanicLocation.y, MechanicLocation.z + 0.5, "[Presiona ~p~E~w~ - Menu de mecanico]", 255, 255, 255, 255, 4, 0.45, true, true, true, true, 0, 0, 0, 0, 55)
                    if IsControlJustPressed(0, 38) then
                        enterLocation(MechanicLocation)
                    end
                else
                    disableControls()
                end

            else
                Wait(1000)
            end
        else
            Wait(2000)
        end

        Citizen.Wait(1)
    end
end)

CreateThread(function()

    while ESX == nil do Wait(1) end

    while true do
        Wait(1)
        if ESX.PlayerData.job and ESX.PlayerData.job.name == 'mechanic' then
            for k,v in pairs(Config.Locations['stash']) do
                local d = Vdist2(GetEntityCoords(PlayerPedId()), v.x, v.y, v.z)
                if d < 8 then
                    DrawText3Ds(v.x, v.y, v.z, '')
                    if IsControlJustPressed(0,38) then
                        TriggerEvent('inventory:stash', 'Mechanic')
                    end
                end
            end

            if ESX.PlayerData.job.grade_name == 'boss' then
                for k,v in pairs(Config.Locations['boss']) do
                    local d = Vdist2(GetEntityCoords(PlayerPedId()), v.x, v.y, v.z)
                    if d < 8 then
                        DrawText3Ds(v.x, v.y, v.z, '[E] - Menu Empresa')
                        if IsControlJustPressed(0,38) then
                            TriggerEvent('esx_society:openBossMenu', 'mechanic', function(data, menu)
                                menu.close()
                            end, { wash = false }) -- disable washing money
                        end
                    end
                end
            end
        end
    end
end)

function DrawText3Ds(x, y, z, text)
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


RegisterNetEvent('mechanic:bill')
AddEventHandler('mechanic:bill', function()
    ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'billing', {
        title = 'Invoice Amount'
    }, function(data, menu)
        local amount = tonumber(data.value)

        if amount == nil or amount < 0 then
            TriggerEvent('notification', 'Cantidad invalida.', 2)
        else
            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
            if closestPlayer == -1 or closestDistance > 3.0 then
                TriggerEvent('notification', 'No hay Jugadores cerca.', 2)
            else
                menu.close()
                TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'society_mechanic', 'Mechanic', amount)
            end
        end
    end, function(data, menu)
        menu.close()
    end)
end)

RegisterNetEvent('mechanic:onHijack')
AddEventHandler('mechanic:onHijack', function()
    local playerPed = PlayerPedId()
    local vehicle   = ESX.Game.GetVehicleInDirection()
    local coords    = GetEntityCoords(playerPed)
    if IsPedSittingInAnyVehicle(playerPed) then
        TriggerEvent('notification', 'Vehículo interior.', 2)
        return
    elseif DoesEntityExist(vehicle) then
        TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_WELDING', 0, true)
        exports["taskbar"]:taskBar(6000,"Desbloqueando vehiculo")
        SetVehicleDoorsLocked(vehicle, 1)
        SetVehicleDoorsLockedForAllPlayers(vehicle, false)
        ClearPedTasksImmediately(playerPed)
        TriggerEvent('notification', 'Vehiculo desbloqueado.', 1)
    else
        TriggerEvent('notification', 'No hay Jugadores cerca.', 2)
    end
end)

RegisterNetEvent('mechanic:repair')
AddEventHandler('mechanic:repair', function()
    local playerPed = PlayerPedId()
    local vehicle   = ESX.Game.GetVehicleInDirection()
    local coords    = GetEntityCoords(playerPed)
    if IsPedSittingInAnyVehicle(playerPed) then
        TriggerEvent('notification', 'Vehículo interior.', 2)
        return
    elseif DoesEntityExist(vehicle) then
        TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BUM_BIN', 0, true)
        exports["taskbar"]:taskBar(10000,"Reparando vehiculo")
        SetVehicleFixed(vehicle)
        SetVehicleDeformationFixed(vehicle)
        SetVehicleUndriveable(vehicle, false)
        SetVehicleEngineOn(vehicle, true, true)
        ClearPedTasksImmediately(playerPed)
        TriggerEvent('notification', 'Vehiculo reparado.', 1)
    else
        TriggerEvent('notification', 'No hay Jugadores cerca.', 2)
    end
end)

Citizen.CreateThread(function()
	local blip = AddBlipForCoord(MechanicLocation.x, MechanicLocation.y, MechanicLocation.z)

	SetBlipSprite (blip, 446)
	SetBlipDisplay(blip, 4)
	SetBlipScale  (blip, 0.8)
	SetBlipColour (blip, 5)
	SetBlipAsShortRange(blip, true)

	BeginTextCommandSetBlipName('STRING')
	AddTextComponentSubstringPlayerName('Meanico')
	EndTextCommandSetBlipName(blip)
end)
