Config = {}

-- # Locale to be used. You can create your own by simple copying the 'en' and translating the values.
Config.Locale       				= 'en' -- Traduções disponives en / br

-- # By how many services a player's community service gets extended if he tries to escape
Config.ServiceExtensionOnEscape		= 2

-- # No cambie esto a menos que sepa lo que está haciendo.
Config.ServiceLocation 				= {x =  -539.73, y = -80.94, z = 4.84}

-- # No cambie esto a menos que sepa lo que está haciendo.
Config.ReleaseLocation				= {x = 34.34, y = 1714.76, z = 14.71}


-- # Don't change this unless you know what you are doing.
Config.ServiceLocations = {
	{ type = "cleaning", coords = vector3(-531.76, -99.08, 4.84) },
	{ type = "cleaning", coords = vector3(-551.58, -88.06, 4.84) },
	{ type = "cleaning", coords = vector3(-527.24, -71.33, 4.84) },
	{ type = "cleaning", coords = vector3(-545.5, -53.51, 4.84) },
	{ type = "cleaning", coords = vector3(-564.65, -66.31, 4.84) },
	{ type = "gardening", coords = vector3(-512.75, -68.78, 5.54) },
	{ type = "gardening", coords = vector3(-578.49, -58.41, 5.54) },
	{ type = "gardening", coords = vector3(-570.79, -79.71, 5.54) },
	{ type = "gardening", coords = vector3(-574.76, -91.36, 5.54) },
	{ type = "gardening", coords = vector3(-509.55, -93.45, 5.54) }
}



Config.Uniforms = {
	prison_wear = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1']  = 80, ['torso_2']  = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms']     = 119, ['pants_1']  = 7,
			['pants_2']  = 0,   ['shoes_1']  = 12,
			['shoes_2']  = 12,  ['chain_1']  = 0,
			['chain_2']  = 0
		},
		female = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1']  = 80, ['torso_2']  = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms']     = 119, ['pants_1']  = 7,
			['pants_2']  = 0,   ['shoes_1']  = 12,
			['shoes_2']  = 12,  ['chain_1']  = 0,
			['chain_2']  = 0
		}
	}
}
