ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterServerEvent('esx_doorlock:server:updateState')
AddEventHandler('esx_doorlock:server:updateState', function(doorIndex, state)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer and type(doorIndex) == 'number' and type(state) == 'boolean' and Config.Doors[doorIndex] then
		Config.Doors[doorIndex].locked = state
        TriggerClientEvent('esx_doorlock:client:setState', -1, doorIndex, state)
    else
        print('^1[esx_doorlock]: error')
	end
end)

RegisterServerEvent('esx_doorlock:server:setupDoors')
AddEventHandler('esx_doorlock:server:setupDoors', function()
    local id = source
    local xPlayer = ESX.GetPlayerFromId(id)
    
    for k,v in pairs(Config.Doors) do
        local state = Config.Doors[k].locked
        TriggerClientEvent('esx_doorlock:client:setState', id, k, state)
    end
end)