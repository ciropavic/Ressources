Config                            = {}

Config.DrawDistance               = 100.0
Config.MarkerType                 = 27
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 0.5 }
Config.MarkerColor                = { r = 255, g = 0, b = 0 }

Config.EnablePlayerManagement     = false
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- enable if you're using esx_identity
Config.EnableNonFreemodePeds      = true -- turn this on if you want custom peds
Config.EnableLicenses             = false -- enable if you're using esx_license

Config.EnableHandcuffTimer        = true -- enable handcuff timer? will unrestrain player after the time ends
Config.HandcuffTimer              = 10 * 60000 -- 10 mins

Config.EnableJobBlip              = true -- enable blips for colleagues, requires esx_society

Config.MaxInService               = -1
Config.Locale                     = 'fr'

Config.yakuzaStations = {

	LSPD = {

		Blip = {
			Coords  = vector3(1365.76, 1137.76, 113.76),
			Sprite  = 60,
			Display = 4,
			Scale   = 1.2,
			Colour  = 29
		},

		Cloakrooms = {
			--vector3(-1548.19, 104.86, 56.78)
		},

		Armories = {
			vector3(1405.57, 1137.91, 109.75)        
		},

		Vehicles = {
			{
				Spawner = vector3(1407.8, 1114.85, 114.84),
				InsideShop = vector3(1393.59, 1117.35, 114.18),
				SpawnPoints = {
					{ coords = vector3(1393.59, 1117.35, 114.18), heading = 88.8, radius = 6.0 },
					{ coords = vector3(1393.59, 1117.35, 114.18), heading = 88.8, radius = 6.0 }
				}
			}
		},

		Helicopters = {
			{
				--Spawner = vector3(967.37, -2250.68, 30.55),
				InsideShop = vector3(982.47, -2244.92, 30.56),
				SpawnPoints = {
					{ coords = vector3(982.47, -2244.92, 30.56), heading = 80.67, radius = 10.0 }
				}
			}
		},

		BossActions = {
			vector3(1394.4, 1158.71, 114.33)        
		}

	}

}

Config.AuthorizedWeapons = {
	recruit = {
		{ weapon = 'WEAPON_PISTOL', price = 5000 },
		{ weapon = 'WEAPON_MACHINEPISTOL', price = 10000 },
	    { weapon = 'WEAPON_ASSAULTRIFLE_MK2', price = 35000 },
		{ weapon = 'WEAPON_ASSAULTRIFLE', price = 25000 },
		{ weapon = 'WEAPON_CARBINERIFLE_MK2', price = 35000 },
		{ weapon = 'WEAPON_PISTOL_MK2',  price = 8000 },
		{ weapon = 'WEAPON_COMBATPISTOL', price = 5000 },
		{ weapon = 'WEAPON_SMG_MK2', price = 12000 }, 
		{ weapon = 'WEAPON_KNUCKLE', price = 500 },
		--{ weapon = 'WEAPON_BULLPUPRIFLE', price = 65000 },
		--{ weapon = 'WEAPON_SNIPERRIFLE', price = 70000 },
		{ weapon = 'WEAPON_SWITCHBLADE', price = 500 }
		--{ weapon = 'WEAPON_APPISTOL', price = 25000 },
		--{ weapon = 'WEAPON_DOUBLEACTION', price = 10000 },
		--{ weapon = 'WEAPON_MINISMG', price = 75000 }
		--{ weapon = 'WEAPON_ADVANCEDRIFLE', price = 40000 },
	    --{ weapon = 'WEAPON_COMPACTRIFLE', price = 45000 },
		--{ weapon = 'WEAPON_STICKYBOMB', price = 3000 }
	},

	officer = {
		{ weapon = 'WEAPON_PISTOL', price = 5000 },
		{ weapon = 'WEAPON_MACHINEPISTOL', price = 10000 },
	    { weapon = 'WEAPON_ASSAULTRIFLE_MK2', price = 35000 },
		{ weapon = 'WEAPON_ASSAULTRIFLE', price = 25000 },
		{ weapon = 'WEAPON_CARBINERIFLE_MK2', price = 35000 },
		{ weapon = 'WEAPON_PISTOL_MK2',  price = 8000 },
		{ weapon = 'WEAPON_COMBATPISTOL', price = 5000 },
		{ weapon = 'WEAPON_SMG_MK2', price = 12000 }, 
		{ weapon = 'WEAPON_KNUCKLE', price = 500 },
		--{ weapon = 'WEAPON_BULLPUPRIFLE', price = 65000 },
		--{ weapon = 'WEAPON_SNIPERRIFLE', price = 70000 },
		{ weapon = 'WEAPON_SWITCHBLADE', price = 500 }
		--{ weapon = 'WEAPON_APPISTOL', price = 25000 },
		--{ weapon = 'WEAPON_DOUBLEACTION', price = 10000 },
		--{ weapon = 'WEAPON_MINISMG', price = 75000 }
		--{ weapon = 'WEAPON_ADVANCEDRIFLE', price = 40000 },
	    --{ weapon = 'WEAPON_COMPACTRIFLE', price = 45000 },
		--{ weapon = 'WEAPON_STICKYBOMB', price = 3000 }
	},

	sergeant = {
	    { weapon = 'WEAPON_PISTOL', price = 5000 },
		{ weapon = 'WEAPON_MACHINEPISTOL', price = 10000 },
	    { weapon = 'WEAPON_ASSAULTRIFLE_MK2', price = 35000 },
		{ weapon = 'WEAPON_ASSAULTRIFLE', price = 25000 },
		{ weapon = 'WEAPON_CARBINERIFLE_MK2', price = 35000 },
		{ weapon = 'WEAPON_PISTOL_MK2',  price = 8000 },
		{ weapon = 'WEAPON_COMBATPISTOL', price = 5000 },
		{ weapon = 'WEAPON_SMG_MK2', price = 12000 }, 
		{ weapon = 'WEAPON_KNUCKLE', price = 500 },
		--{ weapon = 'WEAPON_BULLPUPRIFLE', price = 65000 },
		--{ weapon = 'WEAPON_SNIPERRIFLE', price = 70000 },
		{ weapon = 'WEAPON_SWITCHBLADE', price = 500 }
		--{ weapon = 'WEAPON_APPISTOL', price = 25000 },
		--{ weapon = 'WEAPON_DOUBLEACTION', price = 10000 },
		--{ weapon = 'WEAPON_MINISMG', price = 75000 }
		--{ weapon = 'WEAPON_ADVANCEDRIFLE', price = 40000 },
	    --{ weapon = 'WEAPON_COMPACTRIFLE', price = 45000 },
		--{ weapon = 'WEAPON_STICKYBOMB', price = 3000 }
	},

	intendent = {
	   	{ weapon = 'WEAPON_PISTOL', price = 5000 },
		{ weapon = 'WEAPON_MACHINEPISTOL', price = 10000 },
	    { weapon = 'WEAPON_ASSAULTRIFLE_MK2', price = 35000 },
		{ weapon = 'WEAPON_ASSAULTRIFLE', price = 25000 },
		{ weapon = 'WEAPON_CARBINERIFLE_MK2', price = 35000 },
		{ weapon = 'WEAPON_PISTOL_MK2',  price = 8000 },
		{ weapon = 'WEAPON_COMBATPISTOL', price = 5000 },
		{ weapon = 'WEAPON_SMG_MK2', price = 12000 }, 
		{ weapon = 'WEAPON_KNUCKLE', price = 500 },
		--{ weapon = 'WEAPON_BULLPUPRIFLE', price = 65000 },
		--{ weapon = 'WEAPON_SNIPERRIFLE', price = 70000 },
		{ weapon = 'WEAPON_SWITCHBLADE', price = 500 }
		--{ weapon = 'WEAPON_APPISTOL', price = 25000 },
		--{ weapon = 'WEAPON_DOUBLEACTION', price = 10000 },
		--{ weapon = 'WEAPON_MINISMG', price = 75000 }
		--{ weapon = 'WEAPON_ADVANCEDRIFLE', price = 40000 },
	    --{ weapon = 'WEAPON_COMPACTRIFLE', price = 45000 },
		--{ weapon = 'WEAPON_STICKYBOMB', price = 3000 }
	},

	lieutenant = {
		{ weapon = 'WEAPON_PISTOL', price = 5000 },
		{ weapon = 'WEAPON_MACHINEPISTOL', price = 10000 },
	    { weapon = 'WEAPON_ASSAULTRIFLE_MK2', price = 35000 },
		{ weapon = 'WEAPON_ASSAULTRIFLE', price = 25000 },
		{ weapon = 'WEAPON_CARBINERIFLE_MK2', price = 35000 },
		{ weapon = 'WEAPON_PISTOL_MK2',  price = 8000 },
		{ weapon = 'WEAPON_COMBATPISTOL', price = 5000 },
		{ weapon = 'WEAPON_SMG_MK2', price = 12000 }, 
		{ weapon = 'WEAPON_KNUCKLE', price = 500 },
		--{ weapon = 'WEAPON_BULLPUPRIFLE', price = 65000 },
		--{ weapon = 'WEAPON_SNIPERRIFLE', price = 70000 },
		{ weapon = 'WEAPON_SWITCHBLADE', price = 500 }
		--{ weapon = 'WEAPON_APPISTOL', price = 25000 },
		--{ weapon = 'WEAPON_DOUBLEACTION', price = 10000 },
		--{ weapon = 'WEAPON_MINISMG', price = 75000 }
		--{ weapon = 'WEAPON_ADVANCEDRIFLE', price = 40000 },
	    --{ weapon = 'WEAPON_COMPACTRIFLE', price = 45000 },
		--{ weapon = 'WEAPON_STICKYBOMB', price = 3000 }
	},

	chef = {
	    { weapon = 'WEAPON_PISTOL', price = 5000 },
		{ weapon = 'WEAPON_MACHINEPISTOL', price = 10000 },
	    { weapon = 'WEAPON_ASSAULTRIFLE_MK2', price = 35000 },
		{ weapon = 'WEAPON_ASSAULTRIFLE', price = 25000 },
		{ weapon = 'WEAPON_CARBINERIFLE_MK2', price = 35000 },
		{ weapon = 'WEAPON_PISTOL_MK2',  price = 8000 },
		{ weapon = 'WEAPON_COMBATPISTOL', price = 5000 },
		{ weapon = 'WEAPON_SMG_MK2', price = 12000 }, 
		{ weapon = 'WEAPON_KNUCKLE', price = 500 },
		--{ weapon = 'WEAPON_BULLPUPRIFLE', price = 65000 },
		--{ weapon = 'WEAPON_SNIPERRIFLE', price = 70000 },
		{ weapon = 'WEAPON_SWITCHBLADE', price = 500 }
		--{ weapon = 'WEAPON_APPISTOL', price = 25000 },
		--{ weapon = 'WEAPON_DOUBLEACTION', price = 10000 },
		--{ weapon = 'WEAPON_MINISMG', price = 75000 }
		--{ weapon = 'WEAPON_ADVANCEDRIFLE', price = 40000 },
	    --{ weapon = 'WEAPON_COMPACTRIFLE', price = 45000 },
		--{ weapon = 'WEAPON_STICKYBOMB', price = 3000 }
	},

	boss = {
		{ weapon = 'WEAPON_PISTOL', price = 5000 },
		{ weapon = 'WEAPON_MACHINEPISTOL', price = 10000 },
	    { weapon = 'WEAPON_ASSAULTRIFLE_MK2', price = 35000 },
		{ weapon = 'WEAPON_ASSAULTRIFLE', price = 25000 },
		{ weapon = 'WEAPON_CARBINERIFLE_MK2', price = 35000 },
		{ weapon = 'WEAPON_PISTOL_MK2',  price = 8000 },
		{ weapon = 'WEAPON_COMBATPISTOL', price = 5000 },
		{ weapon = 'WEAPON_SMG_MK2', price = 12000 }, 
		{ weapon = 'WEAPON_KNUCKLE', price = 500 },
		--{ weapon = 'WEAPON_BULLPUPRIFLE', price = 65000 },
		--{ weapon = 'WEAPON_SNIPERRIFLE', price = 70000 },
		{ weapon = 'WEAPON_SWITCHBLADE', price = 500 }
		--{ weapon = 'WEAPON_APPISTOL', price = 25000 },
		--{ weapon = 'WEAPON_DOUBLEACTION', price = 10000 },
		--{ weapon = 'WEAPON_MINISMG', price = 75000 }
		--{ weapon = 'WEAPON_ADVANCEDRIFLE', price = 40000 },
	    --{ weapon = 'WEAPON_COMPACTRIFLE', price = 45000 },
		--{ weapon = 'WEAPON_STICKYBOMB', price = 3000 }
	}
}

Config.AuthorizedVehicles = {
	Shared = {
	{ model = 'hakuchou', label = 'Moto', price = 1000 },
	{ model = 'granger', label = '4x4', price = 3000 },
	{ model = 'benson', label = 'Camion', price = 5000 },
	{ model = 'kuruma', label = 'Deportivo', price = 6000 },
	
	},

	recruit = {

	},

	officer = {

	},

	sergeant = {

	},

	intendent = {

	},

	lieutenant = {

	},

	chef = {

	},

	boss = {

	}
}

Config.AuthorizedHelicopters = {
	recruit = {
		{ model = 'volatus', label = 'Helicoptero', livery = 0, price = 200000 }
	},

	officer = {
		{ model = 'volatus', label = 'Helicoptero', livery = 0, price = 200000 }
	},

	sergeant = {
		{ model = 'volatus', label = 'Helicoptero', livery = 0, price = 200000 }
	},

	intendent = {
		{ model = 'volatus', label = 'Helicoptero', livery = 0, price = 200000 }
	},

	lieutenant = {
		{ model = 'volatus', label = 'Helicoptero', livery = 0, price = 200000 }
	},

	chef = {
		{ model = 'volatus', label = 'Helicoptero', livery = 0, price = 200000 }
	},

	boss = {
		{ model = 'volatus', label = 'Helicoptero2', livery = 0, price = 200000 },
		{ model = 'seasparrow', label = 'Helicoptero3', livery = 0, price = 200000 }
	}
}

-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements

Config.Uniforms = {
	recruit_wear = {
		male = {
			['tshirt_1'] = 16,  ['tshirt_2'] = 0,
			['torso_1'] = 205,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 32,
			['pants_1'] = 31,   ['pants_2'] = 2,
			['shoes_1'] = 60,   ['shoes_2'] = 0,
			['helmet_1'] = 39,  ['helmet_2'] = 2,
			['chain_1'] = 1,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 205,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 14,
			['pants_1'] = 31,   ['pants_2'] = 2,
			['shoes_1'] = 60,   ['shoes_2'] = 0,
			['helmet_1'] = 39,  ['helmet_2'] = 2,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0
		}
	},
	officer_wear = {
		male = {
	  ['tshirt_1'] = 16,  ['tshirt_2'] = 3,
	  ['torso_1'] = 205,   ['torso_2'] = 0,
	  ['decals_1'] = 0,   ['decals_2'] = 0,
	  ['arms'] = 32,
	  ['pants_1'] = 31,   ['pants_2'] = 2,
	  ['shoes_1'] = 60,   ['shoes_2'] = 0,
	  ['helmet_1'] = 39,  ['helmet_2'] = 2,
	  ['chain_1'] = 1,    ['chain_2'] = 0,
	  ['ears_1'] = -1,     ['ears_2'] = 0
		},
		female = {
	  ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 205,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 14,
			['pants_1'] = 31,   ['pants_2'] = 1,
			['shoes_1'] = 24,   ['shoes_2'] = 0,
			['helmet_1'] = 39,  ['helmet_2'] = 2,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0
		}
	},
	sergeant_wear = {
		male = {
	  ['tshirt_1'] = 16,  ['tshirt_2'] = 0,
	  ['torso_1'] = 205,   ['torso_2'] = 0,
	  ['decals_1'] = 0,   ['decals_2'] = 0,
	  ['arms'] = 32,
	  ['pants_1'] = 31,   ['pants_2'] = 2,
	  ['shoes_1'] = 60,   ['shoes_2'] = 0,
	  ['helmet_1'] = 39,  ['helmet_2'] = 2,
	  ['chain_1'] = 1,    ['chain_2'] = 0,
	  ['ears_1'] = 0,     ['ears_2'] = 0
		},
		female = {
	  ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 205,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 32,
			['pants_1'] = 11,   ['pants_2'] = 1,
			['shoes_1'] = 24,   ['shoes_2'] = 0,
			['helmet_1'] = 39,  ['helmet_2'] = 2,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0
		}
	},
	intendent_wear = {
		male = {
	  ['tshirt_1'] = 16,  ['tshirt_2'] = 0,
	  ['torso_1'] = 205,   ['torso_2'] = 0,
	  ['decals_1'] = 0,   ['decals_2'] = 0,
	  ['arms'] = 32,
	  ['pants_1'] = 31,   ['pants_2'] = 2,
	  ['shoes_1'] = 60,   ['shoes_2'] = 0,
	  ['helmet_1'] = 39,  ['helmet_2'] = 2,
	  ['chain_1'] = 1,    ['chain_2'] = 0,
	  ['ears_1'] = 0,     ['ears_2'] = 0
		},
		female = {
	  ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 46,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 14,
			['pants_1'] = 11,   ['pants_2'] = 1,
			['shoes_1'] = 24,   ['shoes_2'] = 0,
			['helmet_1'] = 39,  ['helmet_2'] = 2,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0
		}
	},
	lieutenant_wear = { -- currently the same as intendent_wear
		male = {
	  ['tshirt_1'] = 16,  ['tshirt_2'] = 0,
	  ['torso_1'] = 205,   ['torso_2'] = 0,
	  ['decals_1'] = 0,   ['decals_2'] = 0,
	  ['arms'] = 32,
	  ['pants_1'] = 31,   ['pants_2'] = 2,
	  ['shoes_1'] = 60,   ['shoes_2'] = 0,
	  ['helmet_1'] = 39,  ['helmet_2'] = 2,
	  ['chain_1'] = 1,    ['chain_2'] = 0,
	  ['ears_1'] = 0,     ['ears_2'] = 0
		},
		female = {
	  ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 46,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 14,
			['pants_1'] = 11,   ['pants_2'] = 1,
			['shoes_1'] = 24,   ['shoes_2'] = 0,
			['helmet_1'] = 39,  ['helmet_2'] = 2,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0
		}
	},
	chef_wear = {
		male = {
	  ['tshirt_1'] = 16,  ['tshirt_2'] = 0,
	  ['torso_1'] = 205,   ['torso_2'] = 0,
	  ['decals_1'] = 0,   ['decals_2'] = 0,
	  ['arms'] = 32,
	  ['pants_1'] = 31,   ['pants_2'] = 2,
	  ['shoes_1'] = 60,   ['shoes_2'] = 0,
	  ['helmet_1'] = 39,  ['helmet_2'] = 2,
	  ['chain_1'] = 1,    ['chain_2'] = 0,
	  ['ears_1'] = 0,     ['ears_2'] = 0
		},
		female = {
	  ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 46,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 32,
			['pants_1'] = 11,   ['pants_2'] = 1,
			['shoes_1'] = 24,   ['shoes_2'] = 0,
			['helmet_1'] = 39,  ['helmet_2'] = 2,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0
		}
	},
	boss_wear = { -- currently the same as chef_wear
		male = {
	  ['tshirt_1'] = 16,  ['tshirt_2'] = 0,
	  ['torso_1'] = 205,   ['torso_2'] = 0,
	  ['decals_1'] = 0,   ['decals_2'] = 0,
	  ['arms'] = 32,
	  ['pants_1'] = 31,   ['pants_2'] = 2,
	  ['shoes_1'] = 60,   ['shoes_2'] = 0,
	  ['helmet_1'] = 39,  ['helmet_2'] = 2,
	  ['chain_1'] = 1,    ['chain_2'] = 0,
	  ['ears_1'] = 0,     ['ears_2'] = 0
		},
		female = {
	  ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 43,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 18,
			['pants_1'] = 81,   ['pants_2'] = 0,
			['shoes_1'] = 60,   ['shoes_2'] = 4,
			['helmet_1'] = 39,  ['helmet_2'] = 2,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0
		}
	},
	bullet_wear = {
		male = {
			['bproof_1'] = 11,  ['bproof_2'] = 1
		},
		female = {
			['bproof_1'] = 13,  ['bproof_2'] = 1
		}
	},
	gilet_wear = {
		male = {
			['tshirt_1'] = 59,  ['tshirt_2'] = 1
		},
		female = {
			['tshirt_1'] = 36,  ['tshirt_2'] = 1
		}
	}

}