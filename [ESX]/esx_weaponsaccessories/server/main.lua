ESX = nil

local Accessories = {
	"silent",
	"flashlight",
	"grip",
	"extended_magazine",
	"very_extended_magazine",
	"scope",
	"advanced_scope",
	"yusuf",
	"lowrider",
	"incendiary",
	"tracer_clip",
	"hollow",
	"fmj",
	"lazer_scope",
	"compansator",
	"nightvision_scope",
	"thermal_scope",
}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('silent', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
	local silent = xPlayer.getInventoryItem('silent')
	
    xPlayer.removeInventoryItem('silent', 1)
    TriggerClientEvent('esx_weaponsaccessories:equipSilent', source)
end)

ESX.RegisterUsableItem('flashlight', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
	local flashlight = xPlayer.getInventoryItem('flashlight')
	
    xPlayer.removeInventoryItem('flashlight', 1)
    TriggerClientEvent('esx_weaponsaccessories:equipFlashlight', source)
end)

ESX.RegisterUsableItem('grip', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
	local grip = xPlayer.getInventoryItem('grip')
	
    xPlayer.removeInventoryItem('grip', 1)
    TriggerClientEvent('esx_weaponsaccessories:equipGrip', source)
end)

ESX.RegisterUsableItem('extended_magazine', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
	local extended_magazine = xPlayer.getInventoryItem('extended_magazine')
	
    xPlayer.removeInventoryItem('extended_magazine', 1)
    TriggerClientEvent('esx_weaponsaccessories:equipExtendedMag', source)
end)

ESX.RegisterUsableItem('very_extended_magazine', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
	local very_extended_magazine = xPlayer.getInventoryItem('very_extended_magazine')
	
    xPlayer.removeInventoryItem('very_extended_magazine', 1)
    TriggerClientEvent('esx_weaponsaccessories:equipVeryExtendedMag', source)
end)

ESX.RegisterUsableItem('scope', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
	local scope = xPlayer.getInventoryItem('scope')
	
    xPlayer.removeInventoryItem('scope', 1)
    TriggerClientEvent('esx_weaponsaccessories:equipScope', source)
end)

ESX.RegisterUsableItem('advanced_scope', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
	local advanced_scope = xPlayer.getInventoryItem('advanced_scope')
	
    xPlayer.removeInventoryItem('advanced_scope', 1)
    TriggerClientEvent('esx_weaponsaccessories:equipAdvancedScope', source)
end)

ESX.RegisterUsableItem('yusuf', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
	local yusuf = xPlayer.getInventoryItem('yusuf')
	
    xPlayer.removeInventoryItem('yusuf', 1)
    TriggerClientEvent('esx_weaponsaccessories:equipYusuf', source)
end)

ESX.RegisterUsableItem('lowrider', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
	local lowrider = xPlayer.getInventoryItem('lowrider')
	
    xPlayer.removeInventoryItem('lowrider', 1)
    TriggerClientEvent('esx_weaponsaccessories:equipLowrider', source)
end)

ESX.RegisterUsableItem('incendiary', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
	local incendiary = xPlayer.getInventoryItem('incendiary')
	
    xPlayer.removeInventoryItem('incendiary', 1)
    TriggerClientEvent('esx_weaponsaccessories:equipIncendiary', source)
end)

ESX.RegisterUsableItem('tracer_clip', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
	local tracer_clip = xPlayer.getInventoryItem('tracer_clip')
	
    xPlayer.removeInventoryItem('tracer_clip', 1)
    TriggerClientEvent('esx_weaponsaccessories:equipTracer', source)
end)

ESX.RegisterUsableItem('hollow', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
	local hollow = xPlayer.getInventoryItem('hollow')
	
    xPlayer.removeInventoryItem('hollow', 1)
    TriggerClientEvent('esx_weaponsaccessories:equipHollow', source)
end)

ESX.RegisterUsableItem('fmj', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
	local fmj = xPlayer.getInventoryItem('fmj')
	
    xPlayer.removeInventoryItem('fmj', 1)
    TriggerClientEvent('esx_weaponsaccessories:equipFMJ', source)
end)

ESX.RegisterUsableItem('lazer_scope', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
	local lazer_scope = xPlayer.getInventoryItem('lazer_scope')
	
    xPlayer.removeInventoryItem('lazer_scope', 1)
    TriggerClientEvent('esx_weaponsaccessories:equipLazerScope', source)
end)

ESX.RegisterUsableItem('compansator', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
	local compansator = xPlayer.getInventoryItem('compansator')
	
    xPlayer.removeInventoryItem('compansator', 1)
    TriggerClientEvent('esx_weaponsaccessories:equipCompansator', source)
end)

ESX.RegisterUsableItem('nightvision_scope', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
	local nightvision_scope = xPlayer.getInventoryItem('nightvision_scope')
	
    xPlayer.removeInventoryItem('nightvision_scope', 1)
    TriggerClientEvent('esx_weaponsaccessories:equipNightVisionScope', source)
end)

ESX.RegisterUsableItem('thermal_scope', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
	local thermal_scope = xPlayer.getInventoryItem('thermal_scope')
	
    xPlayer.removeInventoryItem('thermal_scope', 1)
    TriggerClientEvent('esx_weaponsaccessories:equipThermalScope', source)
end)

ESX.RegisterUsableItem('barrel', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
	local barrel = xPlayer.getInventoryItem('barrel')
	
    xPlayer.removeInventoryItem('barrel', 1)
    TriggerClientEvent('esx_weaponsaccessories:equipBarrel', source)
end)

function TableHasValue(table, item)
	for k, v in pairs(table) do
		if v == item then
			return true
		end
	end
	return false
end

--[[AddEventHandler('esx:onRemoveInventoryItem', function(source, item, count)
    if TableHasValue(Accessories, item.name) then
        TriggerClientEvent('esx_weaponsaccessories:looseComponent', source, item.name, item.count)
    end
end)]]--