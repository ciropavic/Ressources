Config                            = {}
Config.DrawDistance               = 20.0

Config.EnablePlayerManagement     = true
Config.EnableSocietyOwnedVehicles = false
Config.EnableVaultManagement      = true
Config.EnableHelicopters          = false
Config.EnableMoneyWash            = false
Config.MaxInService               = -1
Config.Locale                     = 'fr'

Config.MissCraft                  = 10 -- %


Config.AuthorizedVehicles = {
    { name = 'sultan',  label = 'Coche Empresa' },
}

Config.Blips = {
    
    Blip = {
      Pos     = { x = 129.246, y = -1299.363, z = 29.501 },
      Sprite  = 121,
      Display = 4,
      Scale   = 1.2,
      Colour  = 27,
    },

}

Config.Zones = {

    Cloakrooms = {
        Pos   = { x = -249.25, y = 1131.64, z = 14.78 },
        Size  = { x = 0.5, y = 0.5, z = 0.5 },
        Color = { r = 255, g = 187, b = 255 },
        Type  = 3,
    },

    Vaults = {
        Pos   = { x = -264.28, y = 1139.26, z = 8.6 },
        Size  = { x = 0.5, y = 0.5, z = 0.5 },
        Color = { r = 30, g = 144, b = 255 },
        Type  = 3,
    },

    Fridge = {
        Pos   = { x = -262.93, y = 1143.08, z = 8.6 },
        Size  = { x = 0.5, y = 0.5, z = 0.5 },
        Color = { r = 248, g = 248, b = 255 },
        Type  = 3,
    },

    Vehicles = {
        Pos          = { x = -206.17, y = 1134.33, z =14.83 },
        SpawnPoint   = { x = -210.04, y = 1128.46, z = 14.86 },
        Size         = { x = 1.8, y = 1.8, z = 1.0 },
        Color        = { r = 255, g = 255, b = 0 },
        Type         = 20,
        Heading      = 182.43,
    },

    VehicleDeleters = {
        Pos   = { x = -210.04, y = 1128.46, z = 14.86 },
        Size  = { x = 3.0, y = 3.0, z = 0.2 },
        Color = { r = 255, g = 255, b = 0 },
        Type  = 20,
    },

--[[
    Helicopters = {
        Pos          = { x = 137.177, y = -1278.757, z = 28.371 },
        SpawnPoint   = { x = 138.436, y = -1263.095, z = 28.626 },
        Size         = { x = 1.8, y = 1.8, z = 1.0 },
        Color        = { r = 255, g = 255, b = 0 },
        Type         = 23,
        Heading      = 207.43,
    },

    HelicopterDeleters = {
        Pos   = { x = 133.203, y = -1265.573, z = 28.396 },
        Size  = { x = 3.0, y = 3.0, z = 0.2 },
        Color = { r = 255, g = 255, b = 0 },
        Type  = 1,
    },
]]--

    BossActions = {
        Pos   = { x = 94.951, y = -1294.021, z = 29.268 },
        Size  = { x = 1.5, y = 1.5, z = 1.0 },
        Color = { r = 0, g = 100, b = 0 },
        Type  = 20,
    },

    SellFarm = {
		Pos   = {x =967.158, y = 1.843, z = 79.70},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 136, g = 243, b = 216},
		Type  = 20
    },
    
-----------------------
-------- SHOPS --------

    Flacons = {
        Name  = "Alcohol",
        Pos   = { x = -262.15, y = 1138.03, z = 8.6 },
        Size  = { x = 0.5, y = 0.5, z = 0.5 },
        Color = { r = 238, g = 0, b = 0 },
        Type  = 3,
        Items = {
            { name = 'jager',      label = _U('jager'),   price = 5 },
            { name = 'vodka',      label = _U('vodka'),   price = 5 },
            { name = 'rhum',       label = _U('rhum'),    price = 5 },
            { name = 'whisky',     label = _U('whisky'),  price = 5 },
            { name = 'tequila',    label = _U('tequila'), price = 5 },
			{ name = 'beer',    label = _U('cerveza'), price = 5 },
            { name = 'martini',    label = _U('martini'), price = 5 }
        },
    },

    NoAlcool = {
        Name  = "Refrescos",
        Pos   = { x = -261.64, y = 1142.94, z = 8.6 },
        Size  = { x = 1.0, y = 1.0, z = 1.0 },
        Color = { r = 238, g = 110, b = 0 },
        Type  = 20,
        Items = {
            { name = 'cocacola',    label = _U('coca'),     price = 2 },
            { name = 'caprisun',    label = _U('caprisun'), price = 2 },
            { name = 'fanta',       label = _U('fanta'),    price = 2 },
            { name = 'jusfruit',    label = _U('jusfruit'), price = 2 },
            { name = 'icetea',      label = _U('icetea'),   price = 2 },
            { name = 'redbull',     label = _U('redbull'),  price = 2 },
            { name = 'drpepper',    label = _U('drpepper'), price = 2 },
            { name = 'limonade',    label = _U('limonade'), price = 2 }
        },
    },

    Apero = {
        Name  = "Tapeo",
        Pos   = { x = -264.85, y = 1140.91, z = 8.6 },
        Size  = { x = 1.0, y = 1.0, z = 1.0 },
        Color = { r = 142, g = 125, b = 76 },
        Type  = 20,
        Items = {
            { name = 'bolcacahuetes',   label = _U('bolcacahuetes'),    price = 4 },
            { name = 'bolnoixcajou',    label = _U('bolnoixcajou'),     price = 4 },
            { name = 'bolpistache',     label = _U('bolpistache'),      price = 4 },
            { name = 'bolchips',        label = _U('bolchips'),         price = 4 },
            { name = 'saucisson',       label = _U('saucisson'),        price = 6 },
            { name = 'grapperaisin',    label = _U('grapperaisin'),     price = 4 },
            { name = 'ice',             label = _U('ice'),              price = 2 },
            { name = 'menthe',          label = _U('menthe'),           price = 2 }
        },
    },

    --[[
    Ice = {
        Name  = "Achats Glace",
        Pos   = { x = 26.979, y = -1343.457, z = 28.517 },
        Size  = { x = 1.6, y = 1.6, z = 1.0 },
        Color = { r = 255, g = 255, b = 255 },
        Type  = 23,
        Items = {
            { name = 'ice',     label = _U('ice'),      price = 1 },
            { name = 'menthe',  label = _U('menthe'),   price = 2 }
        },
    },
    ]]--
}


-----------------------
----- TELEPORTERS -----

Config.TeleportZones = {
  EnterBuilding = {
    Pos       = { x = 132.608, y = -1293.978, z = 29.269 },
    Size      = { x = 1.2, y = 1.2, z = 0.1 },
    Color     = { r = 128, g = 128, b = 128 },
    Marker    = 20,
    Hint      = _U('e_to_enter_1'),
    Teleport  = { x = 126.742, y = -1278.386, z = 28.569 }
  },

  ExitBuilding = {
    Pos       = { x = 132.517, y = -1290.901, z = 29.269 },
    Size      = { x = 1.2, y = 1.2, z = 0.1 },
    Color     = { r = 128, g = 128, b = 128 },
    Marker    = 20,
    Hint      = _U('e_to_exit_1'),
    Teleport  = { x = 131.175, y = -1295.598, z = 28.569 },
  },

--[[
  EnterHeliport = {
    Pos       = { x = 126.843, y = -729.012, z = 241.201 },
    Size      = { x = 2.0, y = 2.0, z = 0.2 },
    Color     = { r = 204, g = 204, b = 0 },
    Marker    = 1,
    Hint      = _U('e_to_enter_2),
    Teleport  = { x = -65.944, y = -818.589, z =  320.801 }
  },

  ExitHeliport = {
    Pos       = { x = -67.236, y = -821.702, z = 320.401 },
    Size      = { x = 2.0, y = 2.0, z = 0.2 },
    Color     = { r = 204, g = 204, b = 0 },
    Marker    = 1,
    Hint      = _U('e_to_exit_2'),
    Teleport  = { x = 124.164, y = -728.231, z = 241.801 },
  },
]]--
}


-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements

Config.Uniforms = {
  barman_outfit = {
    male = {
        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
        ['torso_1'] = 40,   ['torso_2'] = 0,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 40,
        ['pants_1'] = 28,   ['pants_2'] = 2,
        ['shoes_1'] = 38,   ['shoes_2'] = 4,
        ['chain_1'] = 118,  ['chain_2'] = 0
    },
    female = {
        ['tshirt_1'] = 3,   ['tshirt_2'] = 0,
        ['torso_1'] = 8,    ['torso_2'] = 2,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 5,
        ['pants_1'] = 44,   ['pants_2'] = 4,
        ['shoes_1'] = 0,    ['shoes_2'] = 0,
        ['chain_1'] = 0,    ['chain_2'] = 2
    }
  },
  dancer_outfit_1 = {
    male = {
        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
        ['torso_1'] = 15,   ['torso_2'] = 0,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 40,
        ['pants_1'] = 61,   ['pants_2'] = 9,
        ['shoes_1'] = 16,   ['shoes_2'] = 9,
        ['chain_1'] = 118,  ['chain_2'] = 0
    },
    female = {
        ['tshirt_1'] = 3,   ['tshirt_2'] = 0,
        ['torso_1'] = 22,   ['torso_2'] = 0,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 4,
        ['pants_1'] = 22,   ['pants_2'] = 0,
        ['shoes_1'] = 18,   ['shoes_2'] = 0,
        ['chain_1'] = 61,   ['chain_2'] = 1
    }
  },
  dancer_outfit_2 = {
    male = {
        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
        ['torso_1'] = 62,   ['torso_2'] = 0,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 14,
        ['pants_1'] = 4,    ['pants_2'] = 0,
        ['shoes_1'] = 34,   ['shoes_2'] = 0,
        ['chain_1'] = 118,  ['chain_2'] = 0
    },
    female = {
        ['tshirt_1'] = 3,   ['tshirt_2'] = 0,
        ['torso_1'] = 22,   ['torso_2'] = 2,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 4,
        ['pants_1'] = 20,   ['pants_2'] = 2,
        ['shoes_1'] = 18,   ['shoes_2'] = 2,
        ['chain_1'] = 0,    ['chain_2'] = 0
    }
  },
  dancer_outfit_3 = {
    male = {
        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
        ['torso_1'] = 15,   ['torso_2'] = 0,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 15,
        ['pants_1'] = 4,    ['pants_2'] = 0,
        ['shoes_1'] = 34,   ['shoes_2'] = 0,
        ['chain_1'] = 118,  ['chain_2'] = 0
    },
    female = {
        ['tshirt_1'] = 3,   ['tshirt_2'] = 0,
        ['torso_1'] = 22,   ['torso_2'] = 1,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 15,
        ['pants_1'] = 19,   ['pants_2'] = 1,
        ['shoes_1'] = 19,   ['shoes_2'] = 3,
        ['chain_1'] = 0,    ['chain_2'] = 0
    }
  },
  dancer_outfit_4 = {
    male = {
        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
        ['torso_1'] = 15,   ['torso_2'] = 0,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 15,
        ['pants_1'] = 61,   ['pants_2'] = 5,
        ['shoes_1'] = 34,   ['shoes_2'] = 0,
        ['chain_1'] = 118,  ['chain_2'] = 0
    },
    female = {
        ['tshirt_1'] = 3,   ['tshirt_2'] = 0,
        ['torso_1'] = 82,   ['torso_2'] = 0,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 15,
        ['pants_1'] = 63,   ['pants_2'] = 11,
        ['shoes_1'] = 41,   ['shoes_2'] = 11,
        ['chain_1'] = 0,    ['chain_2'] = 0
    }
  },
  dancer_outfit_5 = {
    male = {
        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
        ['torso_1'] = 15,   ['torso_2'] = 0,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 15,
        ['pants_1'] = 21,   ['pants_2'] = 0,
        ['shoes_1'] = 34,   ['shoes_2'] = 0,
        ['chain_1'] = 118,  ['chain_2'] = 0
    },
    female = {
        ['tshirt_1'] = 3,   ['tshirt_2'] = 0,
        ['torso_1'] = 15,   ['torso_2'] = 5,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 15,
        ['pants_1'] = 63,   ['pants_2'] = 2,
        ['shoes_1'] = 41,   ['shoes_2'] = 2,
        ['chain_1'] = 0,    ['chain_2'] = 0
    }
  },
  dancer_outfit_6 = {
    male = {
        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
        ['torso_1'] = 15,   ['torso_2'] = 0,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 15,
        ['pants_1'] = 81,   ['pants_2'] = 0,
        ['shoes_1'] = 34,   ['shoes_2'] = 0,
        ['chain_1'] = 118,  ['chain_2'] = 0
    },
    female = {
        ['tshirt_1'] = 3,   ['tshirt_2'] = 0,
        ['torso_1'] = 18,   ['torso_2'] = 3,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 15,
        ['pants_1'] = 63,   ['pants_2'] = 10,
        ['shoes_1'] = 41,   ['shoes_2'] = 10,
        ['chain_1'] = 0,    ['chain_2'] = 0
    }
  },
  dancer_outfit_7 = {
    male = {
        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
        ['torso_1'] = 15,   ['torso_2'] = 0,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 40,
        ['pants_1'] = 61,   ['pants_2'] = 9,
        ['shoes_1'] = 16,   ['shoes_2'] = 9,
        ['chain_1'] = 118,  ['chain_2'] = 0
    },
    female = {
        ['tshirt_1'] = 3,   ['tshirt_2'] = 0,
        ['torso_1'] = 111,  ['torso_2'] = 6,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 15,
        ['pants_1'] = 63,   ['pants_2'] = 6,
        ['shoes_1'] = 41,   ['shoes_2'] = 6,
        ['chain_1'] = 0,    ['chain_2'] = 0
    }
  }
}
