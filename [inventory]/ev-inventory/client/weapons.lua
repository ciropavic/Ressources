local currentWeapon
local currentWeaponSlot

RegisterNetEvent('ev-inventory:useWeapon')
AddEventHandler('ev-inventory:useWeapon', function(weapon)
    if currentWeapon == weapon then
        RemoveWeapon(currentWeapon)
        currentWeapon = nil
        currentWeaponSlot = nil
        return
    elseif currentWeapon ~= nil then
        RemoveWeapon(currentWeapon)
        currentWeapon = nil
        currentWeaponSlot = nil
    end
    currentWeapon = weapon
    GiveWeapon(currentWeapon)
    ClearPedTasks(PlayerPedId())
end)

RegisterNetEvent('ev-inventory:removeCurrentWeapon')
AddEventHandler('ev-inventory:removeCurrentWeapon', function()
    if currentWeapon ~= nil then
        RemoveWeapon(currentWeapon)
        currentWeapon = nil
        currentWeaponSlot = nil
        ClearPedTasks(PlayerPedId())
    end
end)

function RemoveWeapon(weapon)
    local playerPed = GetPlayerPed(-1)
    local hash = GetHashKey(weapon)
    local ammoCount = GetAmmoInPedWeapon(playerPed, hash)
    TriggerServerEvent('ev-inventory:updateAmmoCount', hash, ammoCount)
    RemoveWeaponFromPed(playerPed, hash)
    RemoveAllPedWeapons(playerPed, true)
end

function GiveWeapon(weapon)
    local checkh = Config.Throwables
    local playerPed = GetPlayerPed(-1)
    local hash = GetHashKey(weapon)
    ESX.TriggerServerCallback('ev-inventory:getAmmoCount', function(ammoCount)
        GiveWeaponToPed(playerPed, hash, 1, false, true)
        if checkh[weapon] == hash then
            SetPedAmmo(playerPed, hash, 1)
        elseif Config.FuelCan == hash and ammoCount == nil then
            SetPedAmmo(playerPed, hash, 1000)
        else
            SetPedAmmo(playerPed, hash, ammoCount or 0)
        end
    end, hash)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        local player = PlayerPedId()
        if IsPedShooting(player) then
            for k, v in pairs(Config.Throwables) do
                if k == currentWeapon then
                    print('Taking Weapon')
                    ESX.TriggerServerCallback('disc-base:takePlayerItem', function(removed)
                        if removed then
                            TriggerEvent('ev-inventory:removeCurrentWeapon')
                        end
                    end, currentWeapon, 1)
                end
            end
        end
    end
end)