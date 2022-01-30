-------------------------
--Written by Tościk#9715-
-------------------------

local maxZywych = 15   -- ile mozna miec max zywych kurczkaow w EQ
local MaxMartweKurczaki = 30   -- ile mozna miec martwych kurczakow w EQ
local MaxZapakowanychKurczakow = 30    --ile mozna miec w EQ zapakowanych kurczakow
local GotowkaSprzedaz = 90   --ilosc hajsu za 2 paczki kurczaka

-----------------------------
---nizej lepiej nie ruszaj---
-----------------------------
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)

RegisterServerEvent('tost:wkladajKurczki')
AddEventHandler('tost:wkladajKurczki', function()
local _source = source
local xPlayer = ESX.GetPlayerFromId(source)
local zywyKurczak = xPlayer.getInventoryItem('alive_chicken').count

if zywyKurczak < maxZywych then
xPlayer.addInventoryItem('alive_chicken', 5)
Wait(1500)
else
TriggerClientEvent('esx:showNotification', source, '~y~Puedes tener solo una vez como máximo ~g~'..maxZywych.. '~y~ pollos.')
Wait(2500)
end
end)

RegisterServerEvent('tostKurczaki:przerob')
AddEventHandler('tostKurczaki:przerob', function(opcja)
local _source = source
local xPlayer = ESX.GetPlayerFromId(source)
local zywyKurczak = xPlayer.getInventoryItem('alive_chicken').count
local MartwyKurczak = xPlayer.getInventoryItem('slaughtered_chicken').count
local ZapakowanyKurczak = xPlayer.getInventoryItem('packaged_chicken').count

if opcja == 1 then
	if zywyKurczak > 0 and MartwyKurczak < MaxMartweKurczaki then
	xPlayer.removeInventoryItem('alive_chicken', 1)
	xPlayer.addInventoryItem('slaughtered_chicken', 2)
	Wait(1500)
	else
	TriggerClientEvent('esx:showNotification', source, '~y~Puedes tener solo una vez como máximo ~g~'..MaxMartweKurczaki.. '~y~ pollos muertos.')
	Wait(2500)
	end
end

if opcja == 2 then
	if MartwyKurczak > 0 and ZapakowanyKurczak < MaxZapakowanychKurczakow then
	xPlayer.removeInventoryItem('slaughtered_chicken', 2)
	xPlayer.addInventoryItem('packaged_chicken', 2)
	Wait(1500)
	else
	TriggerClientEvent('esx:showNotification', source, '~y~Puedes tener solo una vez como máximo ~g~'..MaxMartweKurczaki.. '~y~ pollos muertos.')
	Wait(2500)
	end
end

if opcja == 3 then
	if ZapakowanyKurczak > 0 then
	xPlayer.removeInventoryItem('packaged_chicken', 2)
	xPlayer.addMoney(GotowkaSprzedaz)
	TriggerClientEvent('esx:showNotification', source, '~g~usted obtiene ~y~'..GotowkaSprzedaz.. '€ ~g~para dos cajas de pollos.')
	Wait(1500)
	end
end

end)
