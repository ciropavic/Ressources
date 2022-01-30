ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

TriggerEvent('esx_society:registerSociety', 'dealer', 'dealer', 'society_dealer', 'society_dealer', 'society_dealer', {type = 'public'})