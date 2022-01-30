Config                            = {}
Config.Locale                     = 'fr'

Config.DrawDistance               = 100.0
Config.MaxInService               = -1
Config.EnablePlayerManagement     = false
Config.EnableSocietyOwnedVehicles = false

Config.NPCSpawnDistance           = 500.0
Config.NPCNextToDistance          = 25.0
Config.NPCJobEarnings             = { min = 530, max = 600 }

Config.Vehicles = {
	'asea',
	'asterope',
	'banshee',
	'blista',
	'elegy',
	'elegy2',
	'buffalo'
}

Config.Zones = {

	MechanicActions = {
		Pos   = { x = -1433.76, y = 1978.42, z = 23.21},
		Size  = { x = 0.5, y = 0.5, z = 0.5 },
		Color = { r = 204, g = 204, b = 0 },
		Type  = 3
	},

	Garage = {
		Pos   = { x = -1433.12, y = 1965.5, z = 23.21},
		Size  = { x = 1.5, y = 1.5, z = 1.0 },
		Color = { r = 204, g = 204, b = 0 },
		Type  = 3
	},
	
	Cloackroom = {
		Pos   = { x = -1419.22, y = 1981.75, z = 23.03 },
		Size  = { x = 1.5, y = 1.5, z = 1.0 },
		Color = { r = 204, g = 204, b = 0 },
		Type  = 3
	},	

	Craft = {
		Pos   = { x = -1432.97, y = 1979.54, z =28.21 },
		Size  = { x = 1.5, y = 1.5, z = 1.0 },
		Color = { r = 204, g = 204, b = 0 },
		Type  = 3
	},

	VehicleSpawnPoint = {
		Pos   = { x = -1432.02, y = 1935.38, z = 23.24 },
		Size  = { x = 0.5, y = 0.5, z = 0.5 },
		Color = { r = 204, g = 204, b = 0 },
		Type  = -1
	},

	VehicleDeleter = {
		Pos   = { x = -1413.63, y = 1942.55, z = 22.24 },
		Size  = { x = 3.0, y = 3.0, z = 1.0 },
		Color = { r = 204, g = 204, b = 0 },
		Type  = 27
	},

	VehicleDelivery = {
		Pos   = { x = -1470.26, y = 1937.54, z = 26.04 },
		Size  = { x = 10.0, y = 10.0, z = 3.0 },
		Color = { r = 204, g = 204, b = 0 },
		Type  = 27
	}
}

Config.Towables = {
	vector3(-1093.44, 2562.21, 34.49),
	vector3(197.45, 861.52, 14.62),
	vector3(1185.96, 1551.85, 35.91),
	
	vector3(1676.09, 1265.7, 28.92),
	vector3(1076.32, 511.9, 20.28),
	vector3(988.75, 2528.68, 17.04)
}

for k,v in ipairs(Config.Towables) do
	Config.Zones['Towable' .. k] = {
		Pos   = v,
		Size  = { x = 1.5, y = 1.5, z = 1.0 },
		Color = { r = 204, g = 204, b = 0 },
		Type  = -1
	}
end
