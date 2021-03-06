Config              = {}
Config.DrawDistance = 100.0
Config.CopsRequired = 1
Config.BlipUpdateTime = 3000 --In milliseconds. I used it on 3000. If you want instant update, 50 is more than enough. Even 100 is good. I hope it doesn't kill FPS and the server.
Config.CooldownMinutes = 10
Config.Locale = 'es'

Config.Zones = {
	VehicleSpawner = {
		Pos   = {x = 1132.81, y = 1703.6, z = 32.57},
		Size  = {x = 0.5, y = 0.5, z = 0.5},
		Color = {r = 204, g = 0, b = 0},
		Type  = 3,
		Colour    = 6, --BLIP
		Id        = 229, --BLIP
	},
}

Config.VehicleSpawnPoint = {
      Pos   = {x = 1123.27, y = 1694.38, z = 32.17, alpha = 267.00}, --alpha is the orientation of the car
      Size  = {x = 3.0, y = 3.0, z = 1.0},
      Type  = -1,
}

Config.Delivery = {
	--Desert
	--Trevor Airfield 9.22KM
	Delivery1 = {
		Pos      = {x = 387.89, y = 501.7, z = 3.68},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Payment  = 3500,
		Cars = {'zentorno','t20','reaper','italigtb','pfister811'},
	},
	--Lighthouse 9.61KM
	Delivery4 = {
		Pos      = {x = -451.04, y = 2315.6, z = 17.71},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Payment  = 4000,
		Cars = {'sultanrs','osiris','cyclone','ruston','turismor'},
	},
	--House in Paleto 12.94KM
	Delivery7 = {
		Pos      = {x = -1124.56, y = 2594.15, z = 32.74},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Payment  = 45000,
		Cars = {'entityxf','sheava','gp1','vagner','neon'},
	},
	--Great Ocean Highway 10.47KM
	Delivery10 = {
		Pos      = {x = -1628.56, y = 545.47, z = 1.75},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Payment  = 3800,
		Cars = {'nero','seven70','tempesta','xa21','raiden'},
	},
	--Marina Drive Desert 8.15KM
	Delivery13 = {
		Pos      = {x = 1197.97, y = 2408.91, z = 16.36},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Payment  = 3000,
		Cars = {'specter','comet5','nightshade','sc1','banshee2'},
	},
}
