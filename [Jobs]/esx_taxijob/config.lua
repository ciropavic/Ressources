Config                            = {}

Config.DrawDistance               = 10.0 -- How close do you need to be for the markers to be drawn (in GTA units).

Config.NPCJobEarnings             = {min = 300, max = 600}
Config.MinimumDistance            = 3000 -- Minimum NPC job destination distance from the pickup in GTA units, a higher number prevents nearby destionations.

Config.MaxInService               = -1 -- How much people can be in service at once?
Config.EnablePlayerManagement     = true -- Enable society managing.
Config.EnableSocietyOwnedVehicles = false

Config.Locale                     = 'en'

Config.AuthorizedVehicles = {
	{model = 'taxi', label = 'Taxi'}
}

Config.Zones = {

	VehicleSpawner = {
		Pos   = {x = 2369.69, y = 1345.79, z = 6.08},
		Size  = {x = 1.0, y = 1.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 21, Rotate = true
	},

	VehicleSpawnPoint = {
		Pos     = {x = 2403.63, y = 1231.37, z = 5.25},
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Type    = -1, Rotate = false,
		Heading = 358.0
	},

	VehicleDeleter = {
		Pos   = {x = 2403.55, y = 1240.1, z = 5.25},
		Size  = {x = 3.0, y = 3.0, z = 0.25},
		Color = {r = 255, g = 0, b = 0},
		Type  = 27, Rotate = false
	},

	TaxiActions = {
		Pos   = {x = 2369.45, y = 1350.14, z = 6.08},
		Size  = {x = 1.0, y = 1.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 20, Rotate = true
	},

	Cloakroom = {
		Pos     = {x = 2369.45, y = 1350.14, z = 6.08},
		Size    = {x = 1.0, y = 1.0, z = 1.0},
		Color   = {r = 204, g = 204, b = 0},
		Type    = 21, Rotate = true
	}
}

Config.JobLocations = {
	vector3(-1093.44, 2562.21, 34.49),
	vector3(197.45, 861.52, 14.62),
	vector3(1185.96, 1551.85, 35.91),
	
	vector3(1676.09, 1265.7, 28.92),
	vector3(1076.32, 511.9, 20.28),
	vector3(988.75, 2528.68, 17.04)
}
