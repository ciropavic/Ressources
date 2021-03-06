Config              = {}
Config.DrawDistance = 100.0

Config.JobName      = "salvage"
Config.PlatePrefix  = "BUCEADOR"

Config.Locale       = 'fr'

Config.Vehicles = {
	Truck = {
		Spawner = 1,
		Label = 'dinghy',
		Hash = "dinghy",
		Livery = 0,
		Trailer = "none"
	}
}

Config.Zones = {

	Cloakroom = {
		Pos     = {x = -833.35, y = 1501.62, z = 4.57},
		Size    = {x = 0.5, y = 0.5, z = 0.5},
		Color   = {r = 11, g = 203, b = 159},
		Type    = 3,
		hint = _U('prompt_locker')
	},

	VehicleSpawner = {
		Pos   = {x = -844.2, y =1500.91, z = 4.08},
		Size  = {x = 0.5, y = 0.5, z = 0.5},
		Color = {r = 11, g = 203, b = 159},
		Type  = 3,
		hint = _U('prompt_vehicle')
	},

	VehicleSpawnPoint = {
		Pos   = {x = -908.33, y = 1441.5, z = 1.0},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Type  = -1,
		Heading = 44.48
	},

	VehicleDeleter = {
		Pos   = {x = -915.7, y = 1455.9, z = 1.8},
		Size  = {x = 10.0, y = 10.0, z = 2.0},
		Color = {r = 255, g = 0, b = 0},
		Type  = 1,
		hint = _U('prompt_vehicledeleter')
	},

	Vente = {
		Pos   = {x = -1067.86, y = 1304.89, z = 5.39},
		Size  = {x = 0.5, y = 0.5, z = 0.5},
		Color = {r = 11, g = 203, b = 159},
		Type  = 3,
		hint = _U('prompt_cashout'),

		ItemTime = 500,
		ItemDb_name = "copper",
		ItemName = "Trozo de Cobre",
		ItemMax = 25,
		ItemAdd = 5,
		ItemRemove = 1,
		ItemRequires = "copper",
		ItemRequires_name = "Cobres",
		ItemDrop = 100,
		ItemPrice  = 3
	}

}

Config.Pool = {

	{ [ 'x' ] = 	 262.06	, [ 'y' ] = 	-102.5	, [ 'z' ] = 	-0.3	},
	{ [ 'x' ] = 	 227.27	, [ 'y' ] = 	-124.54	, [ 'z' ] = 	-0.3	},
	{ [ 'x' ] = 	 736.07	, [ 'y' ] = 	790.12	, [ 'z' ] = 	-0.4	}

}

for i=1, #Config.Pool, 1 do

	Config.Zones['Pool' .. i] = {
		Pos   = Config.Pool[i],
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 0
	}

end

Config.Uniforms = {

	job_wear = {
	  male = {
		  ['tshirt_1'] = 15, ['tshirt_2'] = 0,
		  ['torso_1'] = 243, ['torso_2'] = 5,
		  ['decals_1'] = 0, ['decals_2'] = 0,
		  --add the Scuba mask and set the glasses (small) mask to -1 ad off)
		  ['mask_1'] = 36, ['mask_2'] = 0,
		  ['arms'] = 8,     
		  ['pants_1'] = 94, ['pants_2'] = 0,
		  ['shoes_1'] = 67, ['shoes_2'] = 0,
		  ['glasses_1'] = -1, ['glasses_2'] = 0,
		  ['helmet_1'] = -1, ['helmet_2'] = 0,
		  ['chain_1'] = 0, ['chain_2'] = 0,
		  ['ears_1'] = -1, ['ears_2'] = 0
	    },
	  female = {
		  ['tshirt_1'] = 1, ['tshirt_2'] = 0,
		  ['torso_1'] = 251, ['torso_2'] = 5,
		  ['decals_1'] = 0, ['decals_2'] = 0,
		  ['mask_1'] = 36, ['mask_2'] = 0,
		  ['arms'] = 6,
		  ['pants_1'] = 97, ['pants_2'] = 5,
		  ['shoes_1'] = 70, ['shoes_2'] = 0,
		  ['glasses_1'] = -1, ['glasses_2'] = 0,
		  ['helmet_1'] = -1, ['helmet_2'] = 0,
		  ['chain_1'] = 0, ['chain_2'] = 0,
		  ['ears_1'] = -1, ['ears_2'] = 0
	    }
  

	}

}

