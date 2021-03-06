Citizen.CreateThread(function()
    Citizen.Wait(0)
    MySQL.Async.fetchAll('SELECT * FROM items WHERE LCASE(name) LIKE \'%weapon_%\'', {}, function(results)
        for k, v in pairs(results) do
            ESX.RegisterUsableItem(v.name, function(source)
                TriggerClientEvent('ev-inventory:useWeapon', source, v.name)
            end)
        end
    end)
end)

RegisterServerEvent('ev-inventory:updateAmmoCount')
AddEventHandler('ev-inventory:updateAmmoCount', function(hash, count)
    local player = ESX.GetPlayerFromId(source)
    MySQL.Async.execute('UPDATE disc_ammo SET count = @count WHERE hash = @hash AND owner = @owner', {
        ['@owner'] = player.identifier,
        ['@hash'] = hash,
        ['@count'] = count
    }, function(results)
        if results == 0 then
            MySQL.Async.execute('INSERT INTO disc_ammo (owner, hash, count) VALUES (@owner, @hash, @count)', {
                ['@owner'] = player.identifier,
                ['@hash'] = hash,
                ['@count'] = count
            })
        end
    end)
end)

ESX.RegisterServerCallback('ev-inventory:getAmmoCount', function(source, cb, hash)
    local player = ESX.GetPlayerFromId(source)
    MySQL.Async.fetchAll('SELECT * FROM disc_ammo WHERE owner = @owner and hash = @hash', {
        ['@owner'] = player.identifier,
        ['@hash'] = hash
    }, function(results)
        if #results == 0 then
            cb(nil)
        else
            cb(results[1].count)
        end
    end)
end)


