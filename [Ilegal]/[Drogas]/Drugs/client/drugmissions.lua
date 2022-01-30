--------------------------------
------- Created by Hamza -------
-------------------------------- 

ESX = nil
local PlayerData = nil
local CurrentEventNum = nil
local StopMission = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(100)
	end
	PlayerData = ESX.GetPlayerData()
	
end)

RegisterNetEvent("esx_newDrugs:startMission")
AddEventHandler("esx_newDrugs:startMission",function(spot,type)
	local num = math.random(1,#Config.MissionPosition)
	local numy = 0
	while Config.MissionPosition[num].InUse and numy < 100 do
		numy = numy+1
		num = math.random(1,#Config.MissionPosition)
	end
	if numy == 100 then
		ESX.ShowNotification("No ~y~misiones~s~ están disponibles actualmente, inténtelo de nuevo más tarde!")
	else
		CurrentEventNum = num
		TriggerEvent("esx_newDrugs:startTheEvent",num,type)
		ESX.ShowNotification("Siga el ~y~ubicación~s~ en tu mapa y robar ~r~"..type.."~s~")
	end
	
end)

RegisterNetEvent("esx_newDrugs:startTheEvent")
AddEventHandler("esx_newDrugs:startTheEvent",function(num,typey)
	RequestModel(-459818001)
	while not HasModelLoaded(-459818001) do
		Citizen.Wait(100)
	end
	-- Makes the job unavailable for everyone
	local loc = Config.MissionPosition[num]
	local typed = typey
	Config.MissionPosition[num].InUse = true
	local playerped = GetPlayerPed(-1)
	TriggerServerEvent("esx_newDrugs:syncMissionData",Config.MissionPosition)
	local taken = false
	local blip = CreateMissionBlip(loc.Location)
	AddRelationshipGroup('DrugsNPC')
	AddRelationshipGroup('PlayerPed')
	for k,v in pairs(loc.GoonSpawns) do
		pedy = CreatePed(7,-459818001,v.x,v.y,v.z,0,true,true)
		SetPedRelationshipGroupHash(pedy, 'DrugsNPC')
		GiveWeaponToPed(pedy,GetHashKey("WEAPON_ASSAULTRIFLE"),250,false,true)
		SetPedArmour(pedy,100)
		SetPedDropsWeaponsWhenDead(pedy, false) 
	end
	SetRelationshipBetweenGroups(5,GetPedRelationshipGroupDefaultHash(playerped),'DrugsNPC')
	SetRelationshipBetweenGroups(5,'DrugsNPC',GetPedRelationshipGroupDefaultHash(playerped))
	TaskCombatPed(pedy,playerped, 0, 16)
	while not taken and not StopMission do
		Citizen.Wait(10)
		
		if GetDistanceBetweenCoords(loc.Location, GetEntityCoords(GetPlayerPed(-1))) < 2.5 then
			ESX.Game.Utils.DrawText3D(loc.Location,"Presiona ~g~[E]~s~ para robar las ~y~drogas~s~",1,0)
			if IsControlJustPressed(1,38) then					
				exports['taskbar']:taskBar(15000, "ROBANDO DROGAS")
					Citizen.Wait(15000)
				if GetDistanceBetweenCoords(loc.Location, GetEntityCoords(GetPlayerPed(-1))) < 2.5 then
					ESX.ShowNotification("~g~Mission Completada:~s~ Robaste con éxito las drogas!")
					TriggerServerEvent("esx_newDrugs:reward",(Config.Reward[typed]),typed)
					RemoveBlip(blip)
					Config.MissionPosition[num].InUse = false
					TriggerServerEvent("esx_newDrugs:syncMissionData",Config.MissionPosition)	
					taken = true
					break
				else
					ESX.ShowNotification("~r~Mision Fallida:~s~ Te alejaste demasiado de las drogas!")
					RemoveBlip(blip)
					Config.MissionPosition[num].InUse = false
					TriggerServerEvent("esx_newDrugs:syncMissionData",Config.MissionPosition)
					taken = true
					break
				end
			end
		end
		
		if StopMission == true then
			ESX.ShowNotification("~r~Mision Fallida:~s~ Tu moriste")
			Config.MissionPosition[num].InUse = false
		end
		
	end
	RemoveBlip(blip)
	Config.MissionPosition[num].InUse = false
	TriggerServerEvent("esx_newDrugs:syncMissionData",Config.MissionPosition)
end)

function CreateMissionBlip(location)
	local blip = AddBlipForCoord(location.x,location.y,location.z)
	SetBlipSprite(blip, 1)
	SetBlipColour(blip, 5)
	AddTextEntry('MYBLIP', "Mision de Drogas")
	BeginTextCommandSetBlipName('MYBLIP')
	AddTextComponentSubstringPlayerName(name)
	EndTextCommandSetBlipName(blip)
	SetBlipScale(blip, 0.9) -- set scale
	SetBlipAsShortRange(blip, true)
	return blip
end

RegisterNetEvent("esx_newDrugs:syncMissionData")
AddEventHandler("esx_newDrugs:syncMissionData",function(data)
	Config.MissionPosition = data
end)

AddEventHandler('esx:onPlayerDeath', function(data)
	CancelEvent("esx_newDrugs:startMission")
	StopMission = true
	RemoveBlip(blip)
	TriggerServerEvent("esx_newDrugs:syncMissionData",Config.MissionPosition)
	Citizen.Wait(5000)
	StopMission = false
end)

AddEventHandler('playerSpawned', function(spawn)
	isDead = false
end)
