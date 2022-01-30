RegisterCommand('search', function(source, args, raw)
    TriggerClientEvent('ev-inventory:search', source)
end)

RegisterCommand('steal', function(source, args, raw)
    TriggerClientEvent('ev-inventory:steal', source)
end)

RegisterCommand('loot', function(source, args, raw)
    TriggerClientEvent('ev-inventory:loot', source)
end)

ESX.RegisterServerCallback('ev-inventory:getIdentifier', function(source, cb, serverid)
    cb(ESX.GetPlayerFromId(serverid).identifier)
end)

RegisterServerEvent('ev-inventory:StealCash')
AddEventHandler('ev-inventory:StealCash', function(data)
    local player = ESX.GetPlayerFromId(source)
    local target = ESX.GetPlayerFromIdentifier(data.target)
    if player and target then
        if Config.Steal.cash then
            player.addMoney(target.getMoney())
            target.setMoney(0)
        end
        if Config.Steal.black_money then
            player.addAccountMoney('black_money', target.getAccount('black_money').money)
            target.setAccountMoney('black_money', 0)
        end
        TriggerClientEvent('ev-inventory:refreshInventory', source)
        TriggerClientEvent('ev-inventory:refreshInventory', target.source)
    end
end)

RegisterServerEvent('ev-inventory:SeizeCash')
AddEventHandler('ev-inventory:SeizeCash', function(data)
    local player = ESX.GetPlayerFromId(source)
    local target = ESX.GetPlayerFromIdentifier(data.target)
    if player and target then
        if Config.Seize.cash then
            player.addMoney(target.getMoney())
            target.setMoney(0)
        end
        if Config.Seize.black_money then
            player.addAccountMoney('black_money', target.getAccount('black_money').money)
            target.setAccountMoney('black_money', 0)
        end
        TriggerClientEvent('ev-inventory:refreshInventory', source)
        TriggerClientEvent('ev-inventory:refreshInventory', target.source)
    end
end)