ESX = nil

InvType = {
    ['unknown'] = { slots = 1, label = 'Unknown' },
}

TriggerEvent('es:addGroupCommand', 'givecash', "user", function(source, args, user)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xTarget = ESX.GetPlayerFromId(args[1])


    if args[1] ~= nil and args[2] ~= nil then
        local money = args[2]
        local c = xPlayer.getMoney() - money
        if args[1] ~= source then
        if c >= 0 then
            if xTarget then
                xPlayer.removeMoney(money)
                xTarget.addMoney(money)
                TriggerClientEvent('notification', source, 'Has dado $' .. money .. ' a ' .. GetPlayerName(args[1]), 1)
                TriggerClientEvent('notification', args[1], 'Tu tienes $' .. money .. ' para ' .. GetPlayerName(source), 1)
            else
                TriggerClientEvent('notification', source, 'SYSTEM | Jugador no en línea', 2)
            end
        else
            TriggerClientEvent('notification', source, 'No tienes suficiente dinero', 2)
        end
    end
    end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Permisos insuficientes!")
end, {help = "Give cash to a player", params = {{name = "ID", help = "El ID del objetivo"} ,{name = "CASH", help = "Cash"} }})

RegisterServerEvent('ev-inventory:RegisterInventory')
AddEventHandler('ev-inventory:RegisterInventory', function(inventory)
    if inventory.name == nil then
        print('Requires inv name')
        return
    end

    if inventory.slots == nil then
        inventory.slots = 4
    end

    if inventory.getInventory == nil then
        inventory.getInventory = function(identifier, cb)
            getInventory(identifier, inventory.name, cb)
        end
    end

    if inventory.applyToInventory == nil then
        inventory.applyToInventory = function(identifier, f)
            applyToInventory(identifier, inventory.name, f)
        end
    end

    if inventory.saveInventory == nil then
        inventory.saveInventory = function(identifier, toSave)
            if table.length(toSave) > 0 then
                saveInventory(identifier, inventory.name, toSave)
            else
                deleteInventory(identifier, inventory.name)
            end
        end
    end

    if inventory.getDisplayInventory == nil then
        inventory.getDisplayInventory = function(identifier, cb, source)
            getDisplayInventory(identifier, inventory.name, cb, source)
        end
    end

    InvType[inventory.name] = inventory
    loadedInventories[inventory.name] = {}
end)

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

ESX.RegisterServerCallback('ev-inventory:doesInvTypeExists', function(source, cb, type)
    cb(InvType[type] ~= nil)
end)

RegisterCommand('ensureInv', function(source)
    local owner = ESX.GetPlayerFromId(source).identifier
    MySQL.Async.fetchAll('DELETE FROM disc_inventory WHERE data = @data AND owner = @owner', { ['@data'] = "null", ['@owner'] = owner })
    ensureInventories(source)
end)

function ensureInventories(source)
    local player = ESX.GetPlayerFromId(source)
    ensurePlayerInventory(player)
    TriggerClientEvent('ev-inventory:refreshInventory', source)
end


AddEventHandler("onResourceStop", function(resource)
    if resource == GetCurrentResourceName() then
        saveInventories()
    end
end)

AddEventHandler('esx:playerLoaded', function(data)
    local player = ESX.GetPlayerFromId(data)
   -- ensurePlayerInventory(player)
end)

Citizen.CreateThread(function()
    local players = ESX.GetPlayers()
    for k, v in ipairs(players) do
        ensurePlayerInventory(ESX.GetPlayerFromId(v))
    end
end)

AddEventHandler('esx:playerDropped', function(source)
    local player = ESX.GetPlayerFromId(source)
    saveInventory(player.identifier, 'player')
    closeAllOpenInventoriesForSource(source)
end)

RegisterServerEvent('ev-inventory:deleteNilInventory')
AddEventHandler('ev-inventory:deleteNilInventory', function()
    local owner = ESX.GetPlayerFromId(source).identifier
    MySQL.Async.fetchAll('DELETE FROM disc_inventory WHERE data = @data AND owner = @owner', { ['@data'] = "null", ['@owner'] = owner })
end)