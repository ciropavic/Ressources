-----------------------------------------------------------------------------------------------
--SCRIPT CREADO PARA EL SERVIDOR DE FIVEM DE PLATA O PLOMO COMUNIDAD GAMER.
--SCRIPT CREADO TOTALMENTE POR THEMAYKELLLL1 [ MIGUEL ANGEL LOPEZ REYES ].
--PLATA O PLOMO COMUNIDAD GAMER ACEPTA NO VENDER / REGALAR / PASAR ESTOS SCRIPTS A OTRAS PERSONAS O COMUNIDADES.
-----------------------------------------------------------------------------------------------

----- CHANGES DONE BY LORD ATOMIX ---- HOOKERS PIMP, COLLECTING MONEY

-------------------------------------------
------------------VARIABLES----------------
-------------------------------------------

local pizzeria = { x = 1307.27, y = 1194.69, z = 21.42}
local spawnTornado = { x = 1300.48, y = 1200.38, z = 21.5 }

local propina = 0
local posibilidad = 0

local casas = {
	[1] = {name = "Vinewood Hills",x = 152.03, y = -1824.31 , z = 27.87},
	[2] = {name = "Vinewood Hills",x = 224.47, y = -2034.95 , z = 18.01},
	[3] = {name = "Rockford Hills",x = 558.07, y = -1759.8 , z = 29.31 },
	[4] = {name = "Rockford Hills",x = 1315.54 , y = -1732.1 , z = 54.7 },
	[5] = {name = "Rockford Hills",x = 1407.36  , y = -1496.6 , z = 59.4 },
	[6] = {name = "Hawick"        ,x = -61.81 , y = -1451.86 , z = 32.12 },
	[7] = {name = "Alta"          ,x = 314.96  , y = -1091.57, z = 29.4 },
	[8] = {name = "Pillbox Hills" ,x = 461.49  , y = -693.45, z = 27.49 },
	[9] = {name = "Mission Row"   ,x = -1160.99  , y = -388.77 , z = 36.64},
	[10] ={name = "Rancho"        ,x = -1500.67  , y = -298.11, z = 48.68},
	[11] ={name = "Davis"         ,x = -1580.59  , y = -277.83, z = 48.28},
	[12] ={name ="Chamberlain Hills",x = -722.87, y =-854.59 , z =22.9},
	[13] ={name ="La puerta"      ,x = 314.88, y =-206.07 ,z = 54.09}
}

local isInJobPizz = false
local sigcasa = 0
local plateab = "POPJOBS"
local isToHouse = false
local isToPizzaria = false
local multiplicador_De_dinero = 0.5 
local paga = 0

local px = 0
local py = 0
local pz = 0

local blips = {
	{title="Cobrador Clientes PUTEROS", colour=8, id=279, x = -49.93, y = -1507.3, z = 31.1},
}

-------------------------------------------
--------------------BLIPS------------------
-------------------------------------------

Citizen.CreateThread(function()

    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.9)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)

function Iracasa(casas,sigcasa)
	blip_casa = AddBlipForCoord(casas[sigcasa].x,casas[sigcasa].y, casas[sigcasa].z)
	SetBlipSprite(blip_casa, 1)
	SetNewWaypoint(casas[sigcasa].x,casas[sigcasa].y)
end

-------------------------------------------
------------------CITIZENS-----------------
-------------------------------------------

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(3)
		if isInJobPizz == false then
			DrawMarker(3,pizzeria.x,pizzeria.y,pizzeria.z, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 0.6001,255,51,229, 200, 0, 0, 0, 0)
			if GetDistanceBetweenCoords(pizzeria.x, pizzeria.y, pizzeria.z, GetEntityCoords(GetPlayerPed(-1),true)) < 1.5 then
				drawTxt("PRESIONA <E> PARA PRESIONAR AL CLIENTE A QUE PAGUE",2, 1, 0.45, 0.93, 0.80,255,51,229,255)
				if IsControlJustPressed(1,38) then
					isInJobPizz = true
					isToHouse = true
					sigcasa = math.random(1, 13)
					-- [INFO] TriggerEvent('chatMessage', 'SYSTEM', {255, 0, 0}, sigcasa)
					px = casas[sigcasa].x
					py = casas[sigcasa].y
					pz = casas[sigcasa].z
					distancia = round(GetDistanceBetweenCoords(pizzeria.x, pizzeria.y, pizzeria.z, px,py,pz))
					paga = distancia * multiplicador_De_dinero
					-- [INFO] TriggerEvent('chatMessage', 'SYSTEM', {255, 0, 0}, distancia)
					spawn_Tornado()
					Iracasa(casas,sigcasa)
				end
			end
		end
		if isToHouse == true then
			destinol = casas[sigcasa].name
			drawTxt("LLEVA EL COCHE Y DIRIGE A "..destinol .." Y RECOGE EL DINERO",4, 1, 0.45, 0.22, 0.70,255,255,255,255)
			DrawMarker(3,casas[sigcasa].x,casas[sigcasa].y,casas[sigcasa].z, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 0.6001,255,51,229, 200, 0, 0, 0, 0)
			if GetDistanceBetweenCoords(px,py,pz, GetEntityCoords(GetPlayerPed(-1),true)) < 3 then
				drawTxt("PRESIONA <E> PARA RECOGER EL DINERO",2, 1, 0.45, 0.23, 0.80,255,51,229,255)
				if IsControlJustPressed(1,38) then
					posibilidad = math.random(1, 100)
					if (posibilidad > 70) and (posibilidad < 90) then
						propina = math.random(100, 200)
						TriggerEvent('chatMessage', 'SYSTEMA', {255, 0, 0},"Lo siento, por favor no me lastimes : "..propina.."€")
						TriggerServerEvent("pop_pizzero:propina", propina)
					end
					isToHouse = false
					isToPizzaria = true
					RemoveBlip(blip_casa)
					SetNewWaypoint(pizzeria.x,pizzeria.y)
				end
			end
		end
		if isToPizzaria == true then
			drawTxt("REGRESE AL CLUB PARA RECOGER SU COMISIÓN",4, 1, 0.45, 0.22, 0.70,255,255,255,255)
			DrawMarker(3,pizzeria.x,pizzeria.y,pizzeria.z, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 0.6001,255,51,229, 200, 0, 0, 0, 0)
				if GetDistanceBetweenCoords(pizzeria.x,pizzeria.y,pizzeria.z, GetEntityCoords(GetPlayerPed(-1),true)) < 3 then
					drawTxt("PRESIONA <E> PARA OBTENER EL DINERO",2, 1, 0.45, 0.23, 0.80,255,51,229,255)
					if IsVehicleModel(GetVehiclePedIsIn(GetPlayerPed(-1), true), GetHashKey("Tornado2"))  then
						if IsControlJustPressed(1,38) then
							if IsInVehicle() then
								TriggerEvent('chatMessage', 'SYSTEM', {255, 0, 0},"Gracias por recolectar el dinero de esos bastardos, toma tu comisión: "..paga.."€")
								TriggerServerEvent("pop_pizzero:propina", paga)
								isToHouse = false
								isToPizzaria = false
								isInJobPizz = false
								paga = 0
								px = 0
								py = 0
								pz = 0
								local vehicleu = GetVehiclePedIsIn(GetPlayerPed(-1), false)
								SetEntityAsMissionEntity( vehicleu, true, true )
			               		deleteCar( vehicleu )
							else
								TriggerEvent('chatMessage', 'SYSTEMA', {255, 0, 0},"Papi, ¿dónde está mi coche? Sin coche, sin dinero.")
							end
						end
					else
						TriggerEvent('chatMessage', 'SYSTEMA', {255, 0, 0},"Papi, ¿dónde está mi coche? Sin coche, sin dinero.")
					end
				end
		end
		if IsEntityDead(GetPlayerPed(-1)) then
			 isInJobPizz = false
			 sigcasa = 0
			 isToHouse = false
			 isToPizzaria = false
			 paga = 0
			 px = 0
			 py = 0
			 pz = 0
		end
	end
end)

-------------------------------------------
----------------FUNCIONES------------------
-------------------------------------------

function spawn_Tornado()
	Citizen.Wait(0)

	local myPed = GetPlayerPed(-1)
	local player = PlayerId()
	local vehicle = GetHashKey('Tornado2')

	RequestModel(vehicle)

	while not HasModelLoaded(vehicle) do
		Wait(1)
	end

	local plate = math.random(100, 400)
	local spawned_car = CreateVehicle(vehicle, spawnTornado.x,spawnTornado.y,spawnTornado.z, 431.436, - 996.786, 25.1887, true, false)

	local plate = "PIMP"..math.random(100, 300)
    SetVehicleNumberPlateText(spawned_car, plate)
	SetVehicleOnGroundProperly(spawned_car)
	SetVehicleLivery(spawned_car, 2)
	SetPedIntoVehicle(myPed, spawned_car, - 1)
	SetModelAsNoLongerNeeded(vehicle)
	Citizen.InvokeNative(0xB736A491E64A32CF, Citizen.PointerValueIntInitialized(spawned_car))
end

function round(num, numDecimalPlaces)
	local mult = 1^(numDecimalPlaces or 0)
	return math.floor(num * mult + 0.5) / mult
end

function deleteCar( entity )
    Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( entity ) )
end

function IsInVehicle()
  local ply = GetPlayerPed(-1)
  if IsPedSittingInAnyVehicle(ply) then
    return true
  else
    return false
  end
end

-------------------------------------------
----------FUNCIONES ADICIONALES------------
-------------------------------------------

function drawTxt(text,font,centre,x,y,scale,r,g,b,a)
    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextCentre(centre)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x , y)
end
