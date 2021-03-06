Config                            = {}

Config.DrawDistance               = 100.0

Config.Marker                     = { type = 21, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 0, a = 255, rotate = false }

Config.ReviveReward               = 15  -- revive reward, set to 0 if you don't want it enabled
Config.AntiCombatLog              = true -- enable anti-combat logging?

Config.Locale = 'es'

local second = 1000
local minute = 60 * second

Config.EarlyRespawnTimer          = 50 * second  -- Time til respawn is available
Config.BleedoutTimer              = 5 * minute -- Time til the player bleeds out
Config.RemoveWeaponsAfterRPDeath = false
Config.RemoveItemsAfterRPDeath = true
Config.RemoveCashAfterRPDeath = true
Config.EnablePlayerManagement     = true
Config.RespawnPoint = { coords = vector3(-1255.63, 2112.18, 23.33), heading = 310.54 }

Config.Hospitals = {

	CentralLosSantos = {

		Blip = {
			coords = vector3(-1255.63, 2112.18, 23.33),
			sprite = 61,
			scale  = 1.0,
			color  = 1
		},

		Pharmacies = {
			--vector3(306.7, -601.87, 43.28)
		},

		Vehicles = {
			vector3(-1266.93, 2138.54, 22.28)
		},

		Helicopters = {
			{
				Spawner = vector3(360.26, -583.24, 74.17),
				InsideShop = vector3(350.93338012695, -587.94268798828, 74.164474487305),
				Marker = { type = 34, x = 1.5, y = 1.5, z = 1.5, r = 100, g = 150, b = 150, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(350.88, -587.79, 74.55), heading = 90, radius = 10.0 }
				}
			}
		},

		FastTravels = {

			{ -- Hospital to roof
				From = vector3(332.37585449219, -595.80358886719, 43.283981323242),
				To = { coords = vector3(343.08, -584.68, 74.17), heading = 252.46 },
				Marker = { type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false }
			},

			{ -- Roof to hospital
				From = vector3(338.50521850586, -583.93109130859, 74.164398193359),
				To = { coords = vector3(330.41, -601.13, 43.29), heading = 69.68 },
				Marker = { type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false }
			},

		},


	}
}

Config.Vehicles = {
	{ name = 'ambulance', label = "Ambulancia", grade = 0},
}

Config.AuthorizedHelicopters = {
	ambulance = {},
	doctor = {},
	chief_doctor = {},
	boss = {
	    { model = 'maverick', label = 'Ambulance Maverick', livery = 1, price = 1 }
	}
}
