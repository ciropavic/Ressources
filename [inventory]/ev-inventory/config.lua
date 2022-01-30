Config = {}

Config.Locale = 'en'
Config.OpenControl = 289
Config.TrunkOpenControl = 0
Config.DeleteDropsOnStart = true
Config.HotKeyCooldown = 1000
Config.CheckLicense = true
Config.OpenAnim = true


Config.ExtraVisionShops = {

    ['EV Shops'] = {
        coords = {
            vector3(2557.458, 382.282, 106.622),
            vector3(3038.939, 585.954, 106.622),
            vector3(-3038.939, 1001.462, 7.908),
            vector3(547.431, 2671.710, 42.156),
            vector3(1961.464, 3740.672, 32.343),
            vector3(2678.916, 3280.671, 55.241),
            vector3(1729.563, 6414.126, 36.037),
            vector3(26.18, -1347.37, 29.5),
            vector3(-48.519, -1757.514, 29.421),
            vector3(-707.501, -914.260, 19.215),
            vector3(-1820.523, 792.518, 138.118),
            vector3(1698.388, 4924.404, 42.063),
            vector3(-1222.98, -907.04, 12.33),
            vector3(373.74, 325.96, 103.57),
            vector3(1166.024, 2708.930, 37.177),
            vector3(1392.562, 3604.684, 34.0)
        },
        items = {
            { name = "bread", price = 10, count = 1 },
            { name = "water", price = 7, count = 1 },
            { name = "whisky", price = 100, count = 1 },
            { name = "cigarett", price = 3, count = 1 },
            { name = "beer", price = 15, count = 1 },
            { name = "lighter", price = 10, count = 1 },
            { name = "chips", price = 15, count = 1 },
            { name = "champagne", price = 55, count = 1 },
        },
        markerType = 27,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = 'Presiona ~r~[E]~h~ para abrir el Supermercado',
        show3D = true,
        enableBlip = true,
        job = 'all'
    },

    ['EV Weapon Shop'] = {
        coords = {
            vector3(-662.1, -935.3, 20.8),
			vector3(810.19, -2157.3, 29.62),
			vector3(1693.4, 3759.5, 33.7),
			vector3(-330.7, 6083.97, 31.45),
			vector3(252.08, -50.26, 69.94),
			vector3(22.39, -1106.79, 29.8),
			vector3(2567.7, 294.75, 108.73),
			vector3(-1117.49, 2698.6, 18.55),
			vector3(842.41, -1033.4, 28.19)
        },
        items = {
            { name = "disc_ammo_pistol", price = 500, count = 1, grade = 0 },
            { name = "disc_ammo_pistol_large", price = 650, count = 1, grade = 0 },
            { name = "disc_ammo_rifle", price = 1000, count = 1, grade = 0 },
            { name = "disc_ammo_rifle_large", price = 1050, count = 1, grade = 0 },
            { name = "disc_ammo_shotgun", price = 1060, count = 1, grade = 0 },
            { name = "disc_ammo_smg", price = 900, count = 1, grade = 0 },
            { name = "disc_ammo_snp", price = 900, count = 1, grade = 0 },
            --{ name = "WEAPON_NIGHTSTICK", price = 150, count = 1, grade = 0 },
            --{ name = "WEAPON_FLASHLIGHT", price = 100, count = 1, grade = 0 },
            --{ name = "WEAPON_FLARE", price = 50, count = 1, grade = 0 },
            { name = "WEAPON_BAT", price = 10000, count = 1},
            { name = "WEAPON_KNIFE", price = 15000, count = 1},
            { name = "silencieux", price = 3000, count = 1, grade = 0 },
			{ name = "flashlight", price = 3000, count = 1, grade = 0 },
			{ name = "grip", price = 3000, count = 1, grade = 0 }
        },
        markerType = 27,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = 'Presiona ~r~[E]~h~ A la tienda de armas',
        show3D = true,
        weaponBlip = true,
        job = 'all'
    },
	
	------- Activar solo durante la Purga y no olvidar Desaactivarlas-----------
	
	
	

    ['Casa Empeños'] = {
        coords = {
            vector3(412.1565246582, 314.85778808594, 103.13260650635),
            vector3(-1459.3861083984, -413.91775512695, 35.735530853271)
        },
        items = {
            { name = "phone", price = 1400, count = 1},
            { name = "radio", price = 300, count = 1, },
            { name = "lockpick", price = 500, count = 1, },
            { name = "bankidcard", price = 1500, count = 1, },
            { name = "pacificidcard", price = 500, count = 1, },
            { name = "oxycutter", price = 500, count = 1, },
            { name = "disc_ammo_rifle", price = 1300, count = 1 },
            { name = "bandage", price = 250, count = 1 },
            { name = "medkit", price = 400, count = 1 },
            { name = "bankidcard", price = 500, count = 1 },
            { name = "nitro", price = 1500, count = 1 },
            { name = "fixtool", price = 240, count = 1 },
            { name = "methburn", price = 5000, count = 1 },
            { name = "cokeburn", price = 5000, count = 1 },
            { name = "weedburn", price = 5000, count = 1 },
            { name = "drugbags", price = 5, count = 1 },
            { name = "rolpaper", price = 10, count = 1 }
        },
        markerType = 27,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = 'Press ~r~[E]~h~ To Open The Pawn shop',
        show3D = true,
        PawnShopBlip = true,
        job = 'all'
    },
	
	['Telefonia'] = {
        coords = {
            vector3(-656.33, -857.61, 24.5)
        },
        items = {
            { name = "phone", price = 1400, count = 1}
        },
        markerType = 27,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = 'Presiona ~r~[E]~h~ Para abrir Tienda',
        show3D = true,
        PawnShopBlip = true,
        job = 'all'
    },


    ['Bar Centro'] = {
        coords = {
            vector3(263.26809692383, -821.15277099609, 29.437793731689)
        },
        items = {
            { name = "chocolate", price = 10, count = 1 },
            { name = "water", price = 10, count = 1 },
            { name = "coffee", price = 10, count = 1 },
            { name = "milk", price = 10, count = 1 },
            { name = "cupcake", price = 15, count = 1 },
            { name = "icecoffee", price = 15, count = 1 }
        },
        markerType = 27,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = 'Presiona ~g~[E]~s~ Para llevar comida',
        show3D = true,
        PawnShopBlip = true,
        job = 'starbucks'
    },
	
	['Hackers'] = {
        coords = {
            vector3(-659.18, -862.58, 24.5)
        },
        items = {
            { name = "hackerDevice", price = 1000, count = 1 },
            { name = "secure_card", price = 500, count = 1 },
            { name = "id_card_f", price = 350, count = 1 }
        },
        markerType = 27,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = 'Presiona ~g~[E]~s~ Para abrir Comercial',
        show3D = true,
        PawnShopBlip = false,
        job = 'all'
    },
	
	['Ferreteria'] = {
        coords = {
            vector3(388.19, -874.86, 29.29)
        },
        items = {
            { name = "hacha", price = 300, count = 1 },
            { name = "drill", price = 2000, count = 1 },
            { name = "thermal_charge", price = 5000, count = 1 },
			{ name = "advancedlockpick", price = 2000, count = 1 },
			{ name = "laptop_h", price = 5000, count = 1 },
			{ name = "id_card", price = 500, count = 1 },
            { name = "tyrekit", price = 500, count = 1 },
            { name = "repairkit", price = 2000, count = 1 },
            { name = "lockpick", price = 1000, count = 1 }
        },
        markerType = 27,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = 'Presiona ~g~[E]~s~ Para abrir Ferreteria',
        show3D = true,
        PawnShopBlip = true,
        job = 'all'
    },

	 ['Tienda Semillas'] = {
        coords = {
            vector3(379.33, -828.08, 29.3)
        },
        items = {
            { name = "weed_seed", price = 5, count = 1 },
            { name = "weedburn", price = 5000, count = 1 },
            { name = "drugbags", price = 5, count = 1 },
			{ name = "hqscale", price = 500, count = 1 },
            { name = "rolpaper", price = 10, count = 1 }
        },
        markerType = 27,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = 'Presiona ~g~[E]~s~ Para comprar',
        show3D = true,
        PawnShopBlip = true,
        job = 'all'
    },

    ['DNI/Pasaporte'] = {
        coords = {
            vector3(441.68, -984.18, 30.69)
        },
        items = {
            { name = "idcard", price = 400, count = 1 }
        },
        markerType = 27,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = 'Presiona ~g~[E]~s~ Para renovar DNI/Pasaporte',
        show3D = true,
        courtBlip = true,
        job = 'all'
    },

    ['Comercio Ilegal'] = {
        coords = {
            vector3(1258.9312744141, -2557.8510742188, 42.716121673584)
        },
        items = {
            { name = "WEAPON_COMPACTRIFLE", price = 0, count = 1, grade = 2 },
            { name = "WEAPON_MINISMG", price = 0, count = 1, grade = 0 },
            { name = "WEAPON_SPECIALCARBINE", price = 0, count = 1, grade = 2 },
            { name = "WEAPON_ASSAULTRIFLE", price = 0, count = 1, grade = 2 },
            { name = "WEAPON_ADVANCEDRIFLE", price = 0, count = 1, grade = 2 },
            { name = "WEAPON_HEAVYSNIPER", price = 100, count = 1, grade = 3 },
            { name = "WEAPON_GUSENBERG", price = 0, count = 1, grade = 2 },
            { name = "WEAPON_BULLPUPRIFLE", price = 0, count = 1, grade = 2 },
            { name = "WEAPON_ASSAULTSMG", price = 100000, count = 1, grade = 2 },
            { name = "WEAPON_FLASHLIGHT", price = 0, count = 1, grade = 0 },
            { name = "WEAPON_STUNGUN", price = 0, count = 1, grade = 0 },
            { name = "WEAPON_COMBATPISTOL", price = 10000, count = 1, grade = 0 },
            { name = "disc_ammo_pistol", price = 500, count = 1, grade = 0 },
            { name = "disc_ammo_pistol_large", price = 700, count = 1, grade = 0 },
            { name = "disc_ammo_rifle", price = 1000, count = 1, grade = 0 },
            { name = "disc_ammo_rifle_large", price = 1000, count = 1, grade = 0 },
            { name = "disc_ammo_shotgun", price = 1060, count = 1, grade = 0 },
            { name = "disc_ammo_smg", price = 500, count = 1, grade = 0 },
            { name = "disc_ammo_snp", price = 500, count = 1, grade = 0 },
            { name = "WEAPON_NIGHTSTICK", price = 1000, count = 1, grade = 0 },
            { name = "WEAPON_FLASHLIGHT", price = 1000, count = 1, grade = 0 },
            { name = "WEAPON_FLARE", price = 500, count = 1, grade = 0 },
            { name = "WEAPON_BAT", price = 500, count = 1},
            { name = "WEAPON_KNIFE", price = 500, count = 1},
            { name = "silencieux", price = 1000, count = 1, grade = 0 },
			{ name = "flashlight", price = 1000, count = 1, grade = 0 },
			{ name = "grip", price = 1000, count = 1, grade = 0 }
        },
        markerType = 27,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = 'Presiona ~r~[E]~h~ Al mercado negro',
        show3D = true,
        enableBlip = false,
        job = 'blackmarket'
    },
	
    ['Biton Armor'] = {
        coords = {
            vector3(-1866.85, 2065.68, 135.43)
        },
        items = {
            { name = "disc_ammo_pistol", price = 1300, count = 1, grade = 0 },
            { name = "disc_ammo_pistol_large", price = 1500, count = 1, grade = 0 },
            { name = "disc_ammo_rifle", price = 1800, count = 1, grade = 0 },
            { name = "disc_ammo_rifle_large", price = 2200, count = 1, grade = 0 },
            { name = "disc_ammo_shotgun", price = 2000, count = 1, grade = 0 },
            { name = "disc_ammo_smg", price = 1600, count = 1, grade = 0 },
            { name = "disc_ammo_snp", price = 3000, count = 1, grade = 0 },
            { name = "WEAPON_SNIPERRIFLE", price = 750000, count = 1, grade = 0 },
            --{ name = "WEAPON_GUSENBERG", price = 300000, count = 1, grade = 0 },
            { name = "WEAPON_CARBINERIFLE_MK2", price = 200000, count = 1, grade = 0 },
			--{ name = "WEAPON_MACHINEPISTOL", price = 75000, count = 1, grade = 0 },
			{ name = "WEAPON_SMG_MK2", price = 115000, count = 1, grade = 0 },
			{ name = "WEAPON_PISTOL_MK2", price = 20000, count = 1, grade = 0 },
			{ name = "WEAPON_SWITCHBLADE", price = 500, count = 1, grade = 0 },
			{ name = "WEAPON_ASSAULTRIFLE", price = 150000, count = 1, grade = 0 },
            { name = "WEAPON_ASSAULTRIFLE_MK2", price = 200000, count = 1},
            --{ name = "WEAPON_SAWNOFFSHOTGUN", price = 10000, count = 1},
            { name = "silencieux", price = 1000, count = 1, grade = 0 },
			{ name = "flashlight", price = 1000, count = 1, grade = 0 },
			{ name = "grip", price = 1000, count = 1, grade = 0 }
        },
        markerType = 27,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = 'Presiona ~y~[E]~h~ Para abrir biton Armor',
        show3D = true,
        enableBlip = false,
        job = 'biton'
    },

    ['Blood Armor'] = {
        coords = {
            vector3(727.76, -792.34, 16.47)
        },
        items = {
               { name = "disc_ammo_pistol", price = 1300, count = 1, grade = 0 },
            { name = "disc_ammo_pistol_large", price = 1500, count = 1, grade = 0 },
            { name = "disc_ammo_rifle", price = 1800, count = 1, grade = 0 },
            { name = "disc_ammo_rifle_large", price = 2200, count = 1, grade = 0 },
            { name = "disc_ammo_shotgun", price = 2000, count = 1, grade = 0 },
            { name = "disc_ammo_smg", price = 1600, count = 1, grade = 0 },
            { name = "disc_ammo_snp", price = 3000, count = 1, grade = 0 },
            { name = "WEAPON_SNIPERRIFLE", price = 750000, count = 1, grade = 0 },
            --{ name = "WEAPON_GUSENBERG", price = 300000, count = 1, grade = 0 },
            { name = "WEAPON_CARBINERIFLE_MK2", price = 200000, count = 1, grade = 0 },
			--{ name = "WEAPON_MACHINEPISTOL", price = 75000, count = 1, grade = 0 },
			{ name = "WEAPON_SMG_MK2", price = 115000, count = 1, grade = 0 },
			{ name = "WEAPON_PISTOL_MK2", price = 20000, count = 1, grade = 0 },
			{ name = "WEAPON_SWITCHBLADE", price = 500, count = 1, grade = 0 },
			{ name = "WEAPON_ASSAULTRIFLE", price = 150000, count = 1, grade = 0 },
            { name = "WEAPON_ASSAULTRIFLE_MK2", price = 200000, count = 1},
            --{ name = "WEAPON_SAWNOFFSHOTGUN", price = 10000, count = 1},
            { name = "silencieux", price = 1000, count = 1, grade = 0 },
			{ name = "flashlight", price = 1000, count = 1, grade = 0 },
			{ name = "grip", price = 1000, count = 1, grade = 0 }
        },
        markerType = 27,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = 'Presiona ~y~[E]~h~ Para abrir blood Armor',
        show3D = true,
        enableBlip = false,
        job = 'blood'
    },

      ['Diamonblack Armor'] = {
        coords = {
            vector3(-1181.39, 305.99, 69.89)
        },
        items = {
            { name = "disc_ammo_pistol", price = 1300, count = 1, grade = 0 },
            { name = "disc_ammo_pistol_large", price = 1500, count = 1, grade = 0 },
            { name = "disc_ammo_rifle", price = 1800, count = 1, grade = 0 },
            { name = "disc_ammo_rifle_large", price = 2200, count = 1, grade = 0 },
            { name = "disc_ammo_shotgun", price = 2000, count = 1, grade = 0 },
            { name = "disc_ammo_smg", price = 1600, count = 1, grade = 0 },
            { name = "disc_ammo_snp", price = 3000, count = 1, grade = 0 },
            { name = "WEAPON_SNIPERRIFLE", price = 750000, count = 1, grade = 0 },
            --{ name = "WEAPON_GUSENBERG", price = 300000, count = 1, grade = 0 },
            { name = "WEAPON_CARBINERIFLE_MK2", price = 200000, count = 1, grade = 0 },
			--{ name = "WEAPON_MACHINEPISTOL", price = 75000, count = 1, grade = 0 },
			{ name = "WEAPON_SMG_MK2", price = 115000, count = 1, grade = 0 },
			{ name = "WEAPON_PISTOL_MK2", price = 20000, count = 1, grade = 0 },
			{ name = "WEAPON_SWITCHBLADE", price = 500, count = 1, grade = 0 },
			{ name = "WEAPON_ASSAULTRIFLE", price = 150000, count = 1, grade = 0 },
            { name = "WEAPON_ASSAULTRIFLE_MK2", price = 200000, count = 1},
            --{ name = "WEAPON_SAWNOFFSHOTGUN", price = 10000, count = 1},
            { name = "silencieux", price = 1000, count = 1, grade = 0 },
			{ name = "flashlight", price = 1000, count = 1, grade = 0 },
			{ name = "grip", price = 1000, count = 1, grade = 0 }
        },
        markerType = 27,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = 'Presiona ~y~[E]~h~ Para abrir Diamonblack Armor',
        show3D = true,
        enableBlip = false,
        job = 'diamonblack'
    },

    ['Ballas Armor'] = {
        coords = {
            vector3(106.25, -1981.51, 20.96)
        },
        items = {
            { name = "disc_ammo_pistol", price = 1300, count = 1, grade = 0 },
         --   { name = "disc_ammo_pistol_large", price = 1500, count = 1, grade = 0 },
         --   { name = "disc_ammo_rifle", price = 1800, count = 1, grade = 0 },
         --   { name = "disc_ammo_rifle_large", price = 2200, count = 1, grade = 0 },
         --   { name = "disc_ammo_shotgun", price = 2000, count = 1, grade = 0 },
          --  { name = "disc_ammo_smg", price = 1600, count = 1, grade = 0 },
          --  { name = "disc_ammo_snp", price = 3000, count = 1, grade = 0 },
            { name = "WEAPON_SNSPISTOL", price = 50000, count = 1, grade = 0 },
          --  { name = "WEAPON_MACHETE", price = 2500, count = 1, grade = 0 },
           -- { name = "WEAPON_SWITCHBLADE", price = 3500, count = 1, grade = 0 },
            { name = "WEAPON_BAT", price = 7500, count = 1},
            { name = "WEAPON_KNIFE", price = 10000, count = 1}
            --{ name = "silencieux", price = 3000, count = 1, grade = 0 },
			--{ name = "flashlight", price = 2000, count = 1, grade = 0 },
			--{ name = "grip", price = 0, count = 1, grade = 0 }
        },
        markerType = 27,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = 'Presiona ~y~[E]~h~ Para abrir ballas Armor',
        show3D = true,
        enableBlip = false,
        job = 'ballas'
    },
	
	['Vagos Armor'] = {
        coords = {
            vector3(330.18, -2014.29, 22.39)
        },
        items = {
            { name = "disc_ammo_pistol", price = 1300, count = 1, grade = 0 },
           -- { name = "disc_ammo_pistol_large", price = 1500, count = 1, grade = 0 },
           -- { name = "disc_ammo_rifle", price = 1800, count = 1, grade = 0 },
           -- { name = "disc_ammo_rifle_large", price = 2200, count = 1, grade = 0 },
           -- { name = "disc_ammo_shotgun", price = 2000, count = 1, grade = 0 },
           -- { name = "disc_ammo_smg", price = 1600, count = 1, grade = 0 },
           -- { name = "disc_ammo_snp", price = 3000, count = 1, grade = 0 },
           { name = "WEAPON_SNSPISTOL", price = 50000, count = 1, grade = 0 },
           -- { name = "WEAPON_MACHETE", price = 2500, count = 1, grade = 0 },
           -- { name = "WEAPON_SWITCHBLADE", price = 3500, count = 1, grade = 0 },
            { name = "WEAPON_BAT", price = 7500, count = 1},
            { name = "WEAPON_KNIFE", price = 10000, count = 1}
            --{ name = "silencieux", price = 3000, count = 1, grade = 0 },
			--{ name = "flashlight", price = 2000, count = 1, grade = 0 },
			--{ name = "grip", price = 0, count = 1, grade = 0 }
        },
        markerType = 27,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = 'Presiona ~y~[E]~h~ Para abrir el Armario',
        show3D = true,
        enableBlip = false,
        job = 'vagos'
    },

    ['Marabunta Armor'] = {
        coords = {
            vector3(1439.63, -1488.98, 66.62)
        },
        items = {
            { name = "disc_ammo_pistol", price = 1300, count = 1, grade = 0 },
          --  { name = "disc_ammo_pistol_large", price = 1500, count = 1, grade = 0 },
           -- { name = "disc_ammo_rifle", price = 1800, count = 1, grade = 0 },
           -- { name = "disc_ammo_rifle_large", price = 2200, count = 1, grade = 0 },
            --{ name = "disc_ammo_shotgun", price = 2000, count = 1, grade = 0 },
           -- { name = "disc_ammo_smg", price = 1600, count = 1, grade = 0 },
           -- { name = "disc_ammo_snp", price = 3000, count = 1, grade = 0 },
           { name = "WEAPON_SNSPISTOL", price = 50000, count = 1, grade = 0 },
           -- { name = "WEAPON_MACHETE", price = 2500, count = 1, grade = 0 },
            --{ name = "WEAPON_SWITCHBLADE", price = 3500, count = 1, grade = 0 },
            { name = "WEAPON_BAT", price = 7500, count = 1},
            { name = "WEAPON_KNIFE", price = 10000, count = 1}
            --{ name = "silencieux", price = 3000, count = 1, grade = 0 },
			--{ name = "flashlight", price = 2000, count = 1, grade = 0 },
			--{ name = "grip", price = 0, count = 1, grade = 0 }
        },
        markerType = 27,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = 'Presiona ~y~[E]~h~ Para abrir el Armario',
        show3D = true,
        enableBlip = false,
        job = 'marabunta'
    },

        ['Thefamilie Armor'] = {
        coords = {
            vector3(-137.1, -1608.56, 35.03)
        },
        items = {
            { name = "disc_ammo_pistol", price = 1300, count = 1, grade = 0 },
           -- { name = "disc_ammo_pistol_large", price = 1500, count = 1, grade = 0 },
           -- { name = "disc_ammo_rifle", price = 1800, count = 1, grade = 0 },
           -- { name = "disc_ammo_rifle_large", price = 2200, count = 1, grade = 0 },
            --{ name = "disc_ammo_shotgun", price = 2000, count = 1, grade = 0 },
           -- { name = "disc_ammo_smg", price = 1600, count = 1, grade = 0 },
           -- { name = "disc_ammo_snp", price = 3000, count = 1, grade = 0 },
           { name = "WEAPON_SNSPISTOL", price = 50000, count = 1, grade = 0 },
           -- { name = "WEAPON_MACHETE", price = 2500, count = 1, grade = 0 },
           -- { name = "WEAPON_SWITCHBLADE", price = 3500, count = 1, grade = 0 },
            { name = "WEAPON_BAT", price = 7500, count = 1},
            { name = "WEAPON_KNIFE", price = 10000, count = 1}
            --{ name = "silencieux", price = 3000, count = 1, grade = 0 },
			--{ name = "flashlight", price = 2000, count = 1, grade = 0 },
			--{ name = "grip", price = 0, count = 1, grade = 0 }
        },
        markerType = 27,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = 'Presiona ~y~[E]~h~ Para abrir Thefamilie Armor',
        show3D = true,
        enableBlip = false,
        job = 'thefamilie'
    },

    ['PB'] = {
        coords = {
            vector3(-1517.84, 111.87, 50.05)
        },
        items = {
            { name = "disc_ammo_pistol", price = 700, count = 1, grade = 0 },
            { name = "disc_ammo_pistol_large", price = 750, count = 1, grade = 0 },
            { name = "disc_ammo_rifle", price = 800, count = 1, grade = 0 },
            { name = "disc_ammo_rifle_large", price = 1200, count = 1, grade = 0 },
            { name = "disc_ammo_shotgun", price = 1000, count = 1, grade = 0 },
            { name = "disc_ammo_smg", price = 800, count = 1, grade = 0 },
            { name = "disc_ammo_snp", price = 2000, count = 1, grade = 0 },
            { name = "WEAPON_HEAVYSNIPER", price = 750000, count = 1, grade = 0 },
            { name = "WEAPON_GUSENBERG", price = 200000, count = 1, grade = 0 },
            { name = "WEAPON_CARBINERIFLE_MK2", price = 150000, count = 1, grade = 0 },
			{ name = "WEAPON_MACHINEPISTOL", price = 50000, count = 1, grade = 0 },
			{ name = "WEAPON_SMG_MK2", price = 85000, count = 1, grade = 0 },
			{ name = "WEAPON_PISTOL_MK2", price = 14000, count = 1, grade = 0 },
			{ name = "WEAPON_SWITCHBLADE", price = 200, count = 1, grade = 0 },
			{ name = "WEAPON_ASSAULTRIFLE", price = 100000, count = 1, grade = 0 },
            { name = "WEAPON_ASSAULTRIFLE_MK2", price = 150000, count = 1},
            { name = "WEAPON_SAWNOFFSHOTGUN", price = 10000, count = 1},
            { name = "silencieux", price = 500, count = 1, grade = 0 },
			{ name = "flashlight", price = 500, count = 1, grade = 0 },
			{ name = "grip", price = 500, count = 1, grade = 0 }
        },
        markerType = 27,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = '~h~Presione ~r~[E]~h~ Para abrir Peaky Armory',
        show3D = true,
        enableBlip = false,
        job = 'peaky'
    },

    ['Peaky Market'] = {
        coords = {
            vector3(-1434.2691650391, 207.45541381836, 57.821437835693)
        },
        items = {
            { name = "whisky", price = 100, count = 1 },
            { name = "wine", price = 70, count = 1 },
            { name = "cigarett", price = 3, count = 1 },
            { name = "beer", price = 15, count = 1 },
            { name = "lighter", price = 10, count = 1 },
        },
        markerType = 27,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = 'Presiona ~r~[E]~h~ para abrir el Peaky Market',
        show3D = true,
        enableBlip = true,
        job = 'peaky'
    },


    ['Ambulance Shop'] = {
        coords = {
            vector3(311.27, -597.21, 43.28)
        },
        items = {
            { name = "medkit", price = 0, count = 1 },
            { name = "bandage", price = 0, count = 1 }
        },
        markerType = 27,
        markerColour = { r = 0, g = 0, b = 255 },
        msg = 'Presiona ~r~[E]~h~ A la tienda de ambulancias',
        show3D = true,
        enableBlip = false,
        job = 'ambulance'
    },

    ['Police Armory'] = {
        coords = {
            vector3(482.82, -995.29, 30.69)
        },
        items = {
            { name = "WEAPON_FLASHLIGHT", price = 0, count = 1, grade = 0 },
            { name = "WEAPON_STUNGUN", price = 0, count = 1, grade = 0 },
            { name = "WEAPON_NIGHTSTICK", price = 0, count = 1, grade = 0 },
			{ name = "WEAPON_COMBATPISTOL", price = 0, count = 1, grade = 0 },
			{ name = "WEAPON_APPISTOL", price = 0, count = 1, grade = 0 },
			{ name = "WEAPON_SMG", price = 0, count = 1, grade = 0 },
			{ name = "WEAPON_PUMPSHOTGUN", price = 0, count = 1, grade = 2 },
            { name = "WEAPON_HEAVYSNIPER", price = 0, count = 1, grade = 3 },
		    { name = "WEAPON_CARBINERIFLE", price = 0, count = 1, grade = 1 },
			{ name = "medkit", price = 0, count = 1, grade = 0 },
            { name = "bulletproof", price = 0, count = 1, grade = 2 },
			{ name = "WEAPON_BZGAS", price = 0, count = 1, grade = 3 },
            { name = "disc_ammo_pistol", price = 0, count = 1, grade = 0 },
            { name = "disc_ammo_pistol_large", price = 0, count = 1, grade = 0 },
            { name = "disc_ammo_rifle", price = 0, count = 1, grade = 0 },
            { name = "disc_ammo_rifle_large", price = 0, count = 1, grade = 0 },
            { name = "disc_ammo_shotgun", price = 1060, count = 1, grade = 0 },
            { name = "disc_ammo_smg", price = 0, count = 1, grade = 0 },
            { name = "disc_ammo_snp", price = 0, count = 1, grade = 0 },
            { name = "WEAPON_NIGHTSTICK", price = 0, count = 1, grade = 0 },
            { name = "WEAPON_FLASHLIGHT", price = 0, count = 1, grade = 0 },
            { name = "WEAPON_FLARE", price = 0, count = 1, grade = 0 },
            { name = "WEAPON_BAT", price = 0, count = 1},
            { name = "WEAPON_KNIFE", price = 0, count = 1},
            { name = "silencieux", price = 0, count = 1, grade = 0 },
			{ name = "flashlight", price = 0, count = 1, grade = 0 },
			{ name = "grip", price = 0, count = 1, grade = 0 }
        },
        markerType = 27,
        markerColour = { r = 0, g = 0, b = 255 },
        msg = 'Presiona ~g~[E]~h~ A la Armería de la Policía',
        show3D = true,
        job = 'police'
    },
}


Config.Stash = {
    ['police evidence'] = {
        coords = vector3(475.18,-997.36,26.27),
        size = vector3(1.0, 1.0, 1.0),
        job = 'police',
        markerType = 2,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = 'Presiona ~r~[E]~h~ Para abrir cosas confiscadas',
        show3D = true
    },

    ['Police Stash'] = {
        coords = vector3(462.23,-981.12,30.68),
        size = vector3(1.0, 1.0, 1.0),
        job = 'police',
        markerType = 2,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = 'Presiona ~r~[E]~h~ Para abrir el escondite de la policía',
        show3D = true
    },

    ['blackmarket Stash'] = {
        coords = vector3(1252.9504394531, -2577.5148925781, 42.948802947998),
        size = vector3(1.0, 1.0, 1.0),
        job = 'blackmarket',
        markerType = 2,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = 'Presiona ~r~[E]~h~ To Alijo abierto del mercado negro',
        show3D = true
    },

    ['Peaky Stash'] = {
        coords = vector3(-1517.76, 132.79, 55.67),
        size = vector3(1.0, 1.0, 1.0),
        job = 'peaky',
        markerType = 2,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = '~h~Presiona ~r~[E]~h~ Para abrir Peaky Stash',
        show3D = true
    },

    ['biton Stash'] = {
        coords = vector3(-1861.75, 2054.94, 135.46),
        size = vector3(1.0, 1.0, 1.0),
        job = 'biton',
        markerType = 2,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = '~h~Presiona ~r~[E]~h~ Para abrir biton Stash',
        show3D = true
    },

    ['ballas Stash'] = {
        coords = vector3(118.91, -1965.85, 21.33),
        size = vector3(1.0, 1.0, 1.0),
        job = 'ballas',
        markerType = 2,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = '~h~Presiona ~r~[E]~h~ Para abrir ballas Stash',
        show3D = true
    },

    ['marabunta Stash'] = {
        coords = vector3(1443.76, -1491.03, 66.62),
        size = vector3(1.0, 1.0, 1.0),
        job = 'marabunta',
        markerType = 2,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = '~h~Presiona ~r~[E]~h~ Para abrir Marabunta Stash',
        show3D = true
    },

      ['thefamilie Stash'] = {
        coords = vector3(-155.61, -1604.37, 35.04),
        size = vector3(1.0, 1.0, 1.0),
        job = 'thefamilie',
        markerType = 2,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = '~h~Presiona ~r~[E]~h~ Para abrir Stash',
        show3D = true
    },

    ['blood Stash'] = {
        coords = vector3(715.96, -791.45, 16.47),
        size = vector3(1.0, 1.0, 1.0),
        job = 'blood',
        markerType = 2,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = '~h~Presiona ~r~[E]~h~ Para abrir Stash',
        show3D = true
    },

    ['vagos Stash'] = {
        coords = vector3(341.59, -2021.63, 25.59),
        size = vector3(1.0, 1.0, 1.0),
        job = 'vagos',
        markerType = 2,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = '~h~Presiona ~r~[E]~h~ Para abrir Stash',
        show3D = true
    },

    ['diamonblack Stash'] = {
        coords = vector3(-1193.35, 301.39, 69.88),
        size = vector3(1.0, 1.0, 1.0),
        job = 'diamonblack',
        markerType = 2,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = '~h~Presiona ~r~[E]~h~ Para abrir Stash',
        show3D = true
    },

    ['Mechanic'] = {
        coords = vector3(-312.99, -130.14, 39.01),
        size = vector3(1.0, 1.0, 1.0),
        job = 'mechanic',
        markerType = 2,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = '~r~Presiona ~r~[E]~p~ Para abrir el alijo mecánico',
        show3D = true
    },
	
	['Ambulancias'] = {
        coords = vector3(298.67, -598.1, 43.28),
        size = vector3(1.0, 1.0, 1.0),
        job = 'ambulance',
        markerType = 2,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = '~r~Presiona ~r~[E]~p~ Para abrir el Armario',
        show3D = true
    },

}

Config.Steal = {
    black_money = true,
    cash = true
}

Config.Seize = {
    black_money = true,
    cash = true
}

Config.VehicleLimit = {
    ['Zentorno'] = 10,
    ['Panto'] = 1,
    ['Zion'] = 5
}


Config.ItemsWeight = {
bread = 1.00,
water = 1.00,
medkit = 2.00,
bankidcard = 2.00,
beer = 1.00,   
cigarett = 1.00,   
diamond = 3.00,
firstaid = 1.00,
zlom = 1.00,
weapon_license = 1.00,
vicodin = 1.00,
vest = 6.00,
tuning_laptop = 3.00,
phone = 1.40,
rolex = 2.00,
pacificidcard = 1.00,
oxycutter = 2.00,
oxy = 2.00,
morphine = 1.00,
milk = 1.00,
meth = 3.00,
lockpick = 2.00,
joint = 1.00,
idcard = 1.00,
hydrocodone = 2.00,
gold = 4.00,
gauze = 1.00,
fixkit = 3.00,
bandage = 1.00,
ammo_snp = 4.00,  
disc_ammo_smg = 2.00,
disc_ammo_shotgun = 3.00,
disc_ammo_rifle = 3.00,
disc_ammo_pistol = 2.00,
adrenaline = 1.00,
rope = 1.00,
handcuffs = 1.00,
WEAPON_WRENCH = 4.00,
WEAPON_VINTAGEPISTOL = 6.00,
WEAPON_SWITCHBLADE = 3.00,
WEAPON_STUNGUN = 2.00,
WEAPON_SPECIALCARBINE = 25.00,
WEAPON_STICKYBOMB = 8.00,
WEAPON_SNSPISTOL = 7.00,
WEAPON_SNIPERRIFLE = 30.00,
WEAPON_SMG = 8.00,
WEAPON_SAWNOFFSHOTGUN = 13.00,
WEAPON_RPG = 40.00,
WEAPON_REVOLVER = 12.00,
WEAPON_PUMPSHOTGUN = 25.00,
WEAPON_POOLCUE = 4.00,
WEAPON_PISTOL50 = 6.00,
WEAPON_PISTOL = 7.00,
WEAPON_PETROLCAN = 5.00,
WEAPON_NIGHTSTICK = 3.00,
WEAPON_MUSKET = 13.00,
WEAPON_MINISMG = 9.00,
WEAPON_MICROSMG = 10.00,
WEAPON_MARKSMANRIFLE = 20.00,
WEAPON_MACHETE = 3.00,
WEAPON_KNUCKLE = 2.00,
WEAPON_KNIFE = 2.00,
WEAPON_HEAVYSNIPER = 30.00,
WEAPON_HATCHET = 5.00,
WEAPON_HAMMER = 8.00,
WEAPON_GRENADE = 4.00,
WEAPON_GOLFCLUB = 3.00,
GARBAGEBAG = 3.00,
WEAPON_FLASHLIGHT = 2.00,
WEAPON_FLAREGUN = 5.00,
WEAPON_DOUBLEACTION = 7.00,
WEAPON_DAGGER = 2.00,
WEAPON_CROWBAR = 3.00,
WEAPON_COMPACTRIFLE = 22.00,
WEAPON_COMBATPISTOL = 9.00,
WEAPON_COMBATPDW = 8.00,
WEAPON_CARBINERIFLE = 24.00,
WEAPON_BZGAS = 6.00,
WEAPON_BULLPUPRIFLE = 28.00,
WEAPON_BOTTLE = 2.00,
WEAPON_BATTLEAXE = 5.00,
WEAPON_BAT = 4.00,
WEAPON_ASSAULTSMG = 9.00,
WEAPON_ASSAULTRIFLE = 27.00,
WEAPON_APPISTOL = 11.00,
WEAPON_ADVANCEDRIFLE = 26.00,
}







--Courtesy DoctorTwitch
Config.VehicleSlot = {
    [0] = 20, --Compact
    [1] = 30, --Sedan
    [2] = 20, --SUV
    [3] = 30, --Coupes
    [4] = 20, --Muscle
    [5] = 20, --Sports Classics
    [6] = 20, --Sports
    [7] = 20, --Super
    [8] = 0, --Motorcycles
    [9] = 15, --Off-road
    [10] = 40, --Industrial
    [11] = 40, --Utility
    [12] = 60, --Vans
    [13] = 20, --Cycles
    [14] = 20, --Boats
    [15] = 20, --Helicopters
    [16] = 20, --Planes
    [17] = 40, --Service
    [18] = 40, --Emergency
    [19] = 90, --Military
    [20] = 0, --Commercial
    [21] = 0 --Trains
}

Config.Throwables = {
    WEAPON_MOLOTOV = 615608432,
    WEAPON_GRENADE = -1813897027,
    WEAPON_STICKYBOMB = 741814745,
    WEAPON_PROXMINE = -1420407917,
    WEAPON_SMOKEGRENADE = -37975472,
    WEAPON_PIPEBOMB = -1169823560,
    WEAPON_FLARE = 1233104067,
    WEAPON_SNOWBALL = 126349499
}

Config.FuelCan = 883325847
