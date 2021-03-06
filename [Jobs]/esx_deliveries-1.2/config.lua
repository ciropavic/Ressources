--[[ ============================================================ ]]--
--[[ |       FIVEM ESX DELIVERY PLUGIN REMAKE BY AKKARIIN       | ]]--
--[[ ============================================================ ]]--

Config = {}

-- Delivery Base Location
Config.Base = {
	-- Blip coords
	coords  = {x = 974.76, y = 2449.65, z = 17.06},
	-- Scooter mark
	scooter = {x = 967.6, y = 2444.96, z = 17.06},
	-- Van mark
	van     = {x = 977.17, y = 2457.34, z =17.06},
	-- Truck mark
	truck   = {x =984.24, y = 2462.64, z = 17.06},
	-- Return vehicle mark
	retveh  = {x = 953.07, y = 2489.17, z = 17.06},
	-- Delete vehicle mark
	deleter = {x = 953.07, y = 2489.17, z = 17.06},
	-- Heading
	heading = 36.0,
}

Config.DecorCode = 0

-- Min and max deliveries jobs
Config.Deliveries = {
	min = 1,
	max = 2,
}

-- The salary of jobs
Config.Rewards = {
	scooter = 20,
	van     = 50,
	truck   = 175,
}

-- Vehicle model
Config.Models = {
	scooter = 'faggio3',
	-- van     = 'pony', -- The original game vehicle
	van     = 'fagaloa',      -- Chinese car Wuling hong guang S1
	truck   = 'mule',
	vehDoor = {
		-- If this value is true, it will open the vehicle trunk when player remove the goods from the vehicle.
		usingTrunkForVan   = true,  -- If you using original game vehicle, set this to false
		usingTrunkForTruck = false,
	},
}

-- Scale of the arrow, usually not modified it
Config.Scales = {
	scooter = 0.6,
	van     = 3.0,
	truck   = 4.5,
}

-- Rental money of the vehicles
Config.Safe = {
	scooter = 100,
	van     = 250,
	truck   = 500,
}

-- Random parking locations
Config.ParkingSpawns = {
	{x = 969.11, y = 2463.08, z = 16.99, h = 329.00},
	{x = 939.45, y = 2474.3, z =17.06, h = 309.15},
}

-- Random delivery locations of scooter
-- Item1 = parking location, Item2 = Place goods location
Config.DeliveryLocationsScooter = {
	{Item1 = {x = 1003.46, y = 2646.48, z = 20.87},		Item2 = {x =1001.77, y = 2638.61, z =21.43}},
	{Item1 = {x = 1050.11, y = 2709.85, z = 23.89},		Item2 = {x = 1049.99, y = 2703.18, z = 23.89}},
	{Item1 = {x = 573.08, y = 2401.9, z = 314.7},		Item2 = {x = 585.57, y = 2403.76, z = 18.84}},
	{Item1 = {x = 800.76, y = 2242.32, z = 14.19},		Item2 = {x = 798.03, y = 2255.71, z = 14.24}},
	{Item1 = {x = 1477.52, y = 2555.62, z = 16.62},		Item2 = {x = 1471.89, y = 2557.55, z = 16.76}},
}

-- Random delivery locations of van
Config.DeliveryLocationsVan = {
	{Item1 = {x = -380.05, y = 1823.18, z = 9.82},		Item2 = {x = -373.76, y = 1816.05, z = 10.16}},
	{Item1 = {x = 143.34, y = 630.74, z = 14.66},		Item2 = {x = 138.8, y = 632.88, z = 14.79}},
	{Item1 = {x = 1721.96, y = 1480.13, z = 28.46},		Item2 = {x = 1737.54, y = 1482.89, z = 27.31}},
	{Item1 = {x = 1418.84, y = 692.46, z = 22.89},		Item2 = {x =1420.83, y = 683.82, z =25.05}},
	{Item1 = {x = 1019.75, y = 948.71, z = 34.53},	    Item2 = {x = 1020.45, y = 938.12, z = 35.0}},
	{Item1 = {x = 1184.57, y = 1521.19, z = 37.22},		Item2 = {x = 1190.48, y = 1506.19, z = 38.28}},
}

-- Random delivery locations of truck
Config.DeliveryLocationsTruck = {
	{Item1 = {x = -1649.88, y = 940.4, z = 9.33},	Item2 = {x = -1663.5, y = 941.48, z = 9.33}},
	{Item1 = {x = -1176.1, y = 496.37, z = 2.83},		Item2 = {x = -1171.37, y = 489.54, z = 2.83}},
	{Item1 = {x = -1169.44, y = 2605.1, z = 31.29},		Item2 = {x = -1153.53, y = 2598.63, z = 31.37}},
	{Item1 = {x = -1059.82, y =1169.05, z =4.29},		Item2 = {x = -1068.75, y = 1169.17, z = 5.57}},
}

-- Player outfit of scooter
Config.OutfitScooter = {
	[1]  = {drawables = 0, texture = 0},
	[3]  = {drawables = 66, texture = 0},
	[4]  = {drawables = 97, texture = 3},
	[5]  = {drawables = 0, texture = 0},
	[6]  = {drawables = 32, texture = 14},
	[7]  = {drawables = 0, texture = 0},
	[8]  = {drawables = 15, texture = 0},
	[9]  = {drawables = 0, texture = 0},
	[11] = {drawables = 184, texture = 0},
	[12] = {drawables = 18, texture = 5},
	[13] = {drawables = 1280, texture = 2},
}

-- Player outfit of scooter (female)
Config.OutfitScooterF = {
	[1]  = {drawables = 0, texture = 0},
	[3]  = {drawables = 9, texture = 0},
	[4]  = {drawables = 11, texture = 3},
	[5]  = {drawables = 0, texture = 0},
	[6]  = {drawables = 11, texture = 2},
	[7]  = {drawables = 0, texture = 0},
	[8]  = {drawables = 13, texture = 0},
	[9]  = {drawables = 0, texture = 0},
	[11] = {drawables = 295, texture = 0},
	[12] = {drawables = 18, texture = 5},
	[13] = {drawables = 1280, texture = 2},
}

-- Player outfit of van and truck
Config.OutfitVan = {
	[1]  = {drawables = 0, texture = 0},
	[3]  = {drawables = 66, texture = 0},
	[4]  = {drawables = 97, texture = 3},
	[5]  = {drawables = 0, texture = 0},
	[6]  = {drawables = 32, texture = 14},
	[7]  = {drawables = 0, texture = 0},
	[8]  = {drawables = 141, texture = 0},
	[9]  = {drawables = 0, texture = 0},
	[11] = {drawables = 230, texture = 3},
	[12] = {drawables = 45, texture = 7},
	[13] = {drawables = 1280, texture = 2},
}

-- Player outfit of van and truck (female)
Config.OutfitVanF = {
	[1]  = {drawables = 0, texture = 0},
	[3]  = {drawables = 14, texture = 0},
	[4]  = {drawables = 45, texture = 1},
	[5]  = {drawables = 0, texture = 0},
	[6]  = {drawables = 27, texture = 0},
	[7]  = {drawables = 0, texture = 0},
	[8]  = {drawables = 14, texture = 0},
	[9]  = {drawables = 0, texture = 0},
	[11] = {drawables = 14, texture = 3},
	[12] = {drawables = 18, texture = 7},
	[13] = {drawables = 1280, texture = 2},
}

-- Random van goods
Config.VanGoodsPropNames = {
	"prop_crate_11e",
    "prop_cardbordbox_02a",
}

-- Locales
Config.Locales = {
	["delivery_not_available"]    = "Este modelo es ~r~Indisponible~w~, please use ~g~bicicleta~w~ o ~g~camioneta~w~.",
	["start_delivery"]            = "Presione ~INPUT_CONTEXT~ para comenzar el trabajo de entrega, debe pagar el dep??sito de seguridad por ~g~$",
	["safe_deposit_received"]     = "El dep??sito seguro ha sido eliminado de su cuenta bancaria.",
	["safe_deposit_returned"]     = "El dep??sito seguro regresa a tu cuenta bancaria ahora",
	["safe_deposit_withheld"]     = "Mision ~r~fallida~w~, su dep??sito de seguridad ha sido ~r~detenido~w~.",
	["delivery_point_reward"]     = "Misson completa, recibiste ~g~$",
	["get_back_in_vehicle"]       = "Entra tu ~y~vehiculo~s~",
	["remove_goods"]              = "Presiona ~INPUT_CONTEXT~ to take out the ~y~bienes~s~ desde el carro",
	["remove_goods_subtext"]      = "Deja tu coche y saca el ~y~bienes~w~",
	["drive_next_point"]          = "Conducir el coche al siguiente ~y~destino~w~",
	["deliver_inside_shop"]       = "Toma el ~y~bienes~w~ al destino",
	["get_back_to_deliveryhub"]   = "Volver al centro de entrega y devolver el coche.",
	["delivery_vehicle_returned"] = "Tu coche ha sido devuelto",
	["finish_job"]                = "Estado de la misi??n: ~g~",
	["end_delivery"]              = "Presiona ~INPUT_CONTEXT~ para terminar la misi??n, si??ntese en el autom??vil o no recibir?? el dep??sito de seguridad",
	["blip_name"]                 = "Centro de entrega",
	["dst_blip"]                  = "Entrega",
	["delivery_end"]              = "Fin de entrega",
	["delivery_failed"]           = "Pierde la caja fuerte porque su autom??vil se rompe o se pierde",
	["delivery_finish"]           = "Terminas la misi??n de entregas",
	["delivery_start"]            = "Entrega",
	["delivery_tips"]             = "Conduce el coche de forma segura hasta el destino y entrega el ~y~bienes~s~",
	["not_enough_money"]          = "No tiene suficiente dinero bancario para pagar el ~r~Deposito de seguridad~s~",
}
