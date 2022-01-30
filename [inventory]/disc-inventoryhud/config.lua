Config = {}

Config.Locale = 'en'
Config.OpenControl = 289
Config.TrunkOpenControl = 47
Config.DeleteDropsOnStart = true
Config.HotKeyCooldown = 100
Config.CheckLicense = true

Config.Shops = {
    ['Tiendas'] = {
        coords = {
            vector3(1707.8, 1064.53, 25.21),
            vector3(1253.41, 1201.46, 25.1),
			vector3(-55.12, 909.89, 14.8),
            vector3(-104.67, 1128.46, 14.82),
			vector3(952.95, 354.32, 15.88),
			vector3(518.47, 2344.93, 16.32),
			vector3(-1582.43, 1042.19, 12.46),
			vector3(-1650.13, 562.84, 2.77),
			vector3(-939.16, 2465.78,24.31)
        },
        items = {
            { name = "bread", price = 10, count = 1000 },
            { name = "water", price = 7, count = 1000 },
            { name = "whisky", price = 100, count = 1000 },
            { name = "cigarett", price = 3, count = 1000 },
            { name = "beer", price = 15, count = 1000 },
            { name = "lighter", price = 10, count = 1000 },
            { name = "chips", price = 15, count = 1000 },
            { name = "champagne", price = 55, count = 1000 },
        },
        markerType = 2,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = 'Presiona ~r~[E]~h~ para abrir el Supermercado',
        show3D = true,
        enableBlip = true,
        job = 'all'
    },
	
	['Bar'] = {
        coords = {
			vector3(-166.74, 889.5, 15.7),
			vector3(956.39, 1413.35, 22.25),
			vector3(85.98, 1820.11, 15.64)
        },
        items = {
            { name = "bread", price = 10, count = 1000 },
            { name = "water", price = 7, count = 1000 },
            { name = "whisky", price = 100, count = 1000 },
            { name = "cigarett", price = 3, count = 1000 },
            { name = "beer", price = 15, count = 1000 },
            { name = "lighter", price = 10, count = 1000 },
            { name = "chips", price = 15, count = 1000 },
            { name = "champagne", price = 55, count = 1000 },
        },
        markerType = 2,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = 'Presiona ~r~[E]~h~ para abrir Bar',
        show3D = true,
        enableBlip = false,
        job = 'all'
    },


    ['Armeria'] = {
        coords = {
            vector3(1135.71, 930.7, 34.25),
			vector3(-1576.72, 1041.65, 12.46),
			vector3(-1418.76, 2234.84, 13.3),
			vector3(-1268.93, 1158.97, 14.62)
        },
        items = {
            { name = "disc_ammo_pistol", price = 1500, count = 1000, grade = 0 },
           -- { name = "disc_ammo_pistol_large", price = 650, count = 1, grade = 0 },
           -- { name = "disc_ammo_rifle", price = 1000, count = 1, grade = 0 },
          --  { name = "disc_ammo_rifle_large", price = 1050, count = 1, grade = 0 },
         --   { name = "disc_ammo_shotgun", price = 1060, count = 1, grade = 0 },
         --   { name = "disc_ammo_smg", price = 900, count = 1, grade = 0 },
           -- { name = "weapon_crowbar", price = 90, count = 1, grade = 0 },
            --{ name = "WEAPON_WEAPON_DAGGER", price = 750, count = 1, grade = 0 },
          --  { name = "WEAPON_FLASHLIGHT", price = 100, count = 1, grade = 0 },
            { name = "WEAPON_KNUCKLE", price = 500, count = 1000, grade = 0 },
			{ name = "WEAPON_PISTOL", price = 20000, count = 1000},
            { name = "WEAPON_BAT", price = 100, count = 1000},
            { name = "WEAPON_KNIFE", price = 150, count = 1000},
            { name = "silencieux", price = 500, count = 1000, grade = 0 },
			{ name = "flashlight", price = 1000, count = 1000, grade = 0 },
			{ name = "grip", price = 700, count = 1000, grade = 0 }
        },
        markerType = 2,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = 'Presiona ~r~[E]~h~ A la tienda de armas',
        show3D = true,
        weaponBlip = true,
        job = 'all'
    },
	
	------- Activar solo durante la Purga y no olvidar Desaactivarlas-----------
	
	['Autorepuestos'] = {
        coords = {
            vector3(-1429.29, 1958.38, 23.21)
        },
        items = {
            { name = "repairkit", price = 300, count = 1000 },
			{ name = "shell_oil", price = 600, count = 1000 },
            { name = "race_brakes", price = 4000, count = 1000 },
            { name = "race_suspension", price = 10000, count = 1000 },
			{ name = "race_transmition", price = 14000, count = 1000 },
			{ name = "v8engine", price = 20000, count = 1000 },
			{ name = "2jzengine", price = 21000, count = 1000 },
            { name = "michelin_tires", price = 500, count = 1000 },
            { name = "turbo_lvl_1", price = 25000, count = 1000 },
			{ name = "nos", price = 3000, count = 1000 }
        },
        markerType = 2,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = 'Presiona ~g~[E]~s~ Para abrir Autorepuestos',
        show3D = true,
        PawnShopBlip = true,
        job = 'all'
    },
	
	--['Autorepuestos Vips'] = {
    --    coords = {
    --        vector3(-1428.81, 1958.4, 23.21)
    --    },
    --    items = {
    --        { name = "shell_oil", price = 600, count = 1 },
    --        { name = "race_brakes", price = 4000, count = 1 },
    --        { name = "race_suspension", price = 10000, count = 1 },
	--		{ name = "race_transmition", price = 14000, count = 1 },
	--		{ name = "v8engine", price = 20000, count = 1 },
	--		{ name = "2jzengine", price = 21000, count = 1 },
    --        { name = "michelin_tires", price = 500, count = 1 },
    --        { name = "turbo_lvl_1", price = 25000, count = 1 },
	--		{ name = "nos", price = 3000, count = 1 }
    --    },
    --    markerType = 2,
    --    markerColour = { r = 255, g = 255, b = 255 },
    --    msg = 'Presiona ~g~[E]~s~ Para abrir Autorepuestos',
    --    show3D = true,
    --    PawnShopBlip = true,
    --    job = 'all'
    --},
	

    ['Casa Empeños'] = {
        coords = {
            vector3(76.02, 400.35, 13.55)
         --   vector3(-1459.3861083984, -413.91775512695, 35.735530853271)
        },
        items = {
            { name = "phone", price = 1400, count = 1000},
            { name = "radio", price = 300, count = 1000 },
            { name = "lockpick", price = 500, count = 1000 },
            { name = "bankidcard", price = 1500, count = 1000 },
            { name = "pacificidcard", price = 500, count = 1000 },
            { name = "oxycutter", price = 500, count = 1000 },
            { name = "disc_ammo_rifle", price = 1300, count = 1000 },
            { name = "bandage", price = 250, count = 1000 },
            { name = "medkit", price = 400, count = 1000 },
            { name = "bankidcard", price = 500, count = 1000 },
            { name = "nitro", price = 1500, count = 1000 },
            { name = "fixtool", price = 240, count = 1000 },
            { name = "methburn", price = 5000, count = 1000 },
            { name = "cokeburn", price = 5000, count =1000 },
            { name = "weedburn", price = 5000, count = 1000 },
            { name = "drugbags", price = 5, count = 1000 },
            { name = "rolpaper", price = 10, count = 1000 }
        },
        markerType = 2,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = 'Press ~r~[E]~h~ To Open The Pawn shop',
        show3D = true,
        PawnShopBlip = true,
        job = 'all'
    },
	
	['Telefonia'] = {
        coords = {
            vector3(1039.56, 666.54, 24.19),
			vector3(-1562.57, 1042.31, 12.46),
			 vector3(-1508.54, 1304.01, 25.44),
			vector3(-266.76, 2234.51, 12.91)
        },
        items = {
            { name = "phone", price = 1400, count = 10},
			{ name = "hifi", price = 2400, count = 10}
        },
        markerType = 2,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = 'Presiona ~r~[E]~h~ Para abrir Tienda',
        show3D = true,
        PawnShopBlip = true,
        job = 'all'
    },


    ['Bar Centro'] = {
        coords = {
            vector3(-367.0, 1292.44, 10.39)
        },
        items = {
            { name = "chocolate", price = 10, count = 1000 },
            { name = "water", price = 10, count = 1000 },
            { name = "coffee", price = 10, count = 1000 },
            { name = "milk", price = 10, count = 1000 },
            { name = "cupcake", price = 15, count = 1000 },
			{ name = "bread", price = 10, count = 1000 },
            { name = "water", price = 7, count = 1000 },
            { name = "whisky", price = 100, count = 1000 },
            { name = "cigarett", price = 3, count = 1000 },
            { name = "beer", price = 15, count = 1000 },
            { name = "lighter", price = 10, count = 1000 },
            { name = "chips", price = 15, count = 1000 },
            { name = "champagne", price = 55, count = 1000 },
            { name = "icecoffee", price = 15, count = 1000 }
        },
        markerType = 2,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = 'Presiona ~g~[E]~s~ Para llevar comida',
        show3D = true,
        PawnShopBlip = false,
        job = 'all'
    },
	
	['Hackers'] = {
        coords = {
        --    vector3(-659.18, -862.58, 24.5)
        },
        items = {
            { name = "hackerDevice", price = 1000, count = 1000 },
            { name = "secure_card", price = 500, count = 1000 },
            { name = "id_card_f", price = 350, count = 1000 }
        },
        markerType = 2,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = 'Presiona ~g~[E]~s~ Para abrir Comercial',
        show3D = true,
        PawnShopBlip = false,
        job = 'all'
    },
	
	['Ferreteria'] = {
        coords = {
            --vector3(388.19, -874.86, 29.29)
        },
        items = {
            { name = "hacha", price = 300, count = 1000 },
            { name = "drill", price = 2000, count = 1000 },
            { name = "thermal_charge", price = 5000, count = 1000 },
			{ name = "advancedlockpick", price = 2000, count = 1000 },
			{ name = "laptop_h", price = 5000, count = 1000 },
			{ name = "id_card", price = 500, count = 1000 },
            { name = "tyrekit", price = 500, count = 1000 },
            { name = "repairkit", price = 2000, count = 1000 },
            { name = "lockpick", price = 1000, count =1000 }
        },
        markerType = 2,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = 'Presiona ~g~[E]~s~ Para abrir Ferreteria',
        show3D = true,
        PawnShopBlip = true,
        job = 'all'
    },

	 ['Tienda Semillas'] = {
        coords = {
            vector3(1353.66, 1241.6, 22.48)
        },
        items = {
            { name = "weed_seed", price = 50, count = 10 },
            { name = "weedburn", price = 5000, count = 1 },
            { name = "drugbags", price = 80, count = 50 },
			{ name = "hqscale", price = 1500, count = 1 },
			{ name = "joint2g", price = 500, count = 1000 },
            { name = "rolpaper", price = 10, count = 1 }
        },
        markerType = 2,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = 'Presiona ~g~[E]~s~ Para comprar',
        show3D = true,
        PawnShopBlip = true,
        job = 'all'
    },

    ['DNI/Pasaporte'] = {
        coords = {
            vector3(1298.42, 1373.35, 30.83)
        },
        items = {
            { name = "idcard", price = 400, count = 1000 }
        },
        markerType = 2,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = 'Presiona ~g~[E]~s~ Para renovar DNI/Pasaporte',
        show3D = true,
        courtBlip = true,
        job = 'all'
    },

    ['Comercio Ilegal'] = {
        coords = {
       --     vector3(1258.9312744141, -2557.8510742188, 42.716121673584)
        },
        items = {
            { name = "WEAPON_COMPACTRIFLE", price = 0, count = 1000, grade = 2 },
            { name = "WEAPON_MINISMG", price = 0, count = 1000, grade = 0 },
            { name = "WEAPON_SPECIALCARBINE", price = 0, count = 1000, grade = 2 },
            { name = "WEAPON_ASSAULTRIFLE", price = 0, count = 1000, grade = 2 },
            { name = "WEAPON_ADVANCEDRIFLE", price = 0, count = 1000, grade = 2 },
            { name = "WEAPON_HEAVYSNIPER", price = 100, count = 1000, grade = 3 },
            { name = "WEAPON_GUSENBERG", price = 0, count = 1000, grade = 2 },
            { name = "WEAPON_BULLPUPRIFLE", price = 0, count = 1000, grade = 2 },
            { name = "WEAPON_ASSAULTSMG", price = 100000, count = 1000, grade = 2 },
            { name = "WEAPON_FLASHLIGHT", price = 0, count = 1000, grade = 0 },
            { name = "WEAPON_STUNGUN", price = 0, count = 1000, grade = 0 },
            { name = "WEAPON_COMBATPISTOL", price = 10000, count = 1000, grade = 0 },
            { name = "disc_ammo_pistol", price = 500, count = 1000, grade = 0 },
            { name = "disc_ammo_pistol_large", price = 700, count = 1000, grade = 0 },
            { name = "disc_ammo_rifle", price = 1000, count = 1000, grade = 0 },
            { name = "disc_ammo_rifle_large", price = 1000, count = 1000, grade = 0 },
            { name = "disc_ammo_shotgun", price = 1060, count = 1000, grade = 0 },
            { name = "disc_ammo_smg", price = 500, count = 1000, grade = 0 },
            { name = "disc_ammo_snp", price = 500, count =1000, grade = 0 },
            { name = "WEAPON_NIGHTSTICK", price = 1000, count = 1000, grade = 0 },
            { name = "WEAPON_FLASHLIGHT", price = 1000, count = 1000, grade = 0 },
            { name = "WEAPON_FLARE", price = 500, count = 1000, grade = 0 },
            { name = "WEAPON_BAT", price = 500, count = 1000},
            { name = "WEAPON_KNIFE", price = 500, count = 1000},
            { name = "silencieux", price = 1000, count = 1000, grade = 0 },
			{ name = "flashlight", price = 1000, count = 1000, grade = 0 },
			{ name = "grip", price = 1000, count = 1000, grade = 0 }
        },
        markerType = 2,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = 'Presiona ~r~[E]~h~ Al mercado negro',
        show3D = true,
        enableBlip = false,
        job = 'blackmarket'
    },
	
    ['Biton Armor'] = {
        coords = {
       --     vector3(-1866.85, 2065.68, 135.43)
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
        markerType = 2,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = 'Presiona ~y~[E]~h~ Para abrir biton Armor',
        show3D = true,
        enableBlip = false,
        job = 'biton'
    },

    ['Blood Armor'] = {
        coords = {
      --      vector3(727.76, -792.34, 16.47)
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
        markerType = 2,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = 'Presiona ~y~[E]~h~ Para abrir blood Armor',
        show3D = true,
        enableBlip = false,
        job = 'blood'
    },

      ['Diamonblack Armor'] = {
        coords = {
      --      vector3(-1181.39, 305.99, 69.89)
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
        markerType = 2,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = 'Presiona ~y~[E]~h~ Para abrir Diamonblack Armor',
        show3D = true,
        enableBlip = false,
        job = 'diamonblack'
    },

    ['Armeria The-Bronx'] = {
        coords = {
            vector3(666.42, 2251.48, 17.47)
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
        markerType = 2,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = 'Presiona ~y~[E]~h~ Para abrir Armeria',
        show3D = true,
        enableBlip = false,
        job = 'peaky'
    },
	
	['Vagos Armor'] = {
        coords = {
      --      vector3(330.18, -2014.29, 22.39)
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
        markerType = 2,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = 'Presiona ~y~[E]~h~ Para abrir el Armario',
        show3D = true,
        enableBlip = false,
        job = 'vagos'
    },

    ['Marabunta Armor'] = {
        coords = {
      --      vector3(1439.63, -1488.98, 66.62)
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
        markerType = 2,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = 'Presiona ~y~[E]~h~ Para abrir el Armario',
        show3D = true,
        enableBlip = false,
        job = 'marabunta'
    },

        ['The Cripts'] = {
        coords = {
            vector3(-1183.87, 2393.69, 30.89)
        },
        items = {
            { name = "disc_ammo_pistol", price = 700, count = 1, grade = 0 },
            { name = "disc_ammo_pistol_large", price = 750, count = 1, grade = 0 },
            { name = "disc_ammo_rifle", price = 800, count = 1, grade = 0 },
            { name = "disc_ammo_rifle_large", price = 1200, count = 1, grade = 0 },
            { name = "disc_ammo_shotgun", price = 1000, count = 1, grade = 0 },
            { name = "disc_ammo_smg", price = 800, count = 1, grade = 0 },
            { name = "disc_ammo_snp", price = 2000, count = 1, grade = 0 },
            --{ name = "WEAPON_HEAVYSNIPER", price = 750000, count = 1, grade = 0 },
            --{ name = "WEAPON_GUSENBERG", price = 200000, count = 1, grade = 0 },
            --{ name = "WEAPON_CARBINERIFLE_MK2", price = 150000, count = 1, grade = 0 },
			{ name = "WEAPON_MACHINEPISTOL", price = 50000, count = 1, grade = 0 },
			{ name = "WEAPON_SMG_MK2", price = 85000, count = 1, grade = 0 },
			{ name = "WEAPON_PISTOL_MK2", price = 50000, count = 1, grade = 0 },
			{ name = "WEAPON_SWITCHBLADE", price = 2000, count = 1, grade = 0 },
			{ name = "WEAPON_ASSAULTRIFLE", price = 100000, count = 1, grade = 0 },
            { name = "WEAPON_ASSAULTRIFLE_MK2", price = 150000, count = 1},
            --{ name = "WEAPON_SAWNOFFSHOTGUN", price = 10000, count = 1},
            { name = "silencieux", price = 500, count = 1, grade = 0 },
			{ name = "flashlight", price = 500, count = 1, grade = 0 },
			{ name = "grip", price = 500, count = 1, grade = 0 }
        },
        markerType = 2,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = 'Presiona ~y~[E]~h~ Para abrir Thefamilie Armor',
        show3D = true,
        enableBlip = false,
        job = 'oldschool'
    },

    ['|Armeria ChinaTow'] = {
        coords = {
            vector3(-1150.52, 1914.43, 24.78)
        },
        items = {
            { name = "disc_ammo_pistol", price = 700, count = 1, grade = 0 },
            { name = "disc_ammo_pistol_large", price = 750, count = 1, grade = 0 },
            { name = "disc_ammo_rifle", price = 800, count = 1, grade = 0 },
            { name = "disc_ammo_rifle_large", price = 1200, count = 1, grade = 0 },
            { name = "disc_ammo_shotgun", price = 1000, count = 1, grade = 0 },
            { name = "disc_ammo_smg", price = 800, count = 1, grade = 0 },
            { name = "disc_ammo_snp", price = 2000, count = 1, grade = 0 },
            --{ name = "WEAPON_HEAVYSNIPER", price = 750000, count = 1, grade = 0 },
            --{ name = "WEAPON_GUSENBERG", price = 200000, count = 1, grade = 0 },
            --{ name = "WEAPON_CARBINERIFLE_MK2", price = 150000, count = 1, grade = 0 },
			{ name = "WEAPON_MACHINEPISTOL", price = 50000, count = 1, grade = 0 },
			{ name = "WEAPON_SMG_MK2", price = 85000, count = 1, grade = 0 },
			{ name = "WEAPON_PISTOL_MK2", price = 50000, count = 1, grade = 0 },
			{ name = "WEAPON_SWITCHBLADE", price = 2000, count = 1, grade = 0 },
			{ name = "WEAPON_ASSAULTRIFLE", price = 100000, count = 1, grade = 0 },
            { name = "WEAPON_ASSAULTRIFLE_MK2", price = 150000, count = 1},
            --{ name = "WEAPON_SAWNOFFSHOTGUN", price = 10000, count = 1},
            { name = "silencieux", price = 500, count = 1, grade = 0 },
			{ name = "flashlight", price = 500, count = 1, grade = 0 },
			{ name = "grip", price = 500, count = 1, grade = 0 }
        },
        markerType = 2,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = '~h~Presione ~r~[E]~h~ Para abrir Peaky Armory',
        show3D = true,
        enableBlip = false,
        job = 'bloodbrothers'
    },

    ['Frigorifico Mafia The-Bronx'] = {
        coords = {
            vector3(-1171.77, 1924.69, 19.78)
        },
        items = {
            { name = "whisky", price = 100, count = 1 },
            { name = "wine", price = 70, count = 1 },
            { name = "cigarett", price = 3, count = 1 },
            { name = "beer", price = 15, count = 1 },
            { name = "lighter", price = 10, count = 1 },
        },
        markerType = 3,
        markerColour = { r = 255, g = 0, b = 0 },
        msg = 'Presiona ~r~[E]~h~ para abrir Frigorifico',
        show3D = true,
        enableBlip = false,
        job = 'bloodbrothers'
    },
	['Frigorifico The Cripts'] = {
        coords = {
            vector3(-1184.24, 2398.2, 26.06)
        },
        items = {
            { name = "whisky", price = 100, count = 1 },
            { name = "wine", price = 70, count = 1 },
            { name = "cigarett", price = 3, count = 1 },
            { name = "beer", price = 15, count = 1 },
            { name = "lighter", price = 10, count = 1 },
        },
        markerType = 3,
        markerColour = { r = 255, g = 0, b = 0 },
        msg = 'Presiona ~r~[E]~h~ para abrir Frigorifico',
        show3D = true,
        enableBlip = false,
        job = 'oldschool'
    },


    ['Ambulance Shop'] = {
        coords = {
            vector3(-1267.95, 2097.21, 23.33)
        },
        items = {
            { name = "medkit", price = 0, count = 1 },
			{ name = "GADGET_HAZMAT2", price = 0, count = 1 },
            { name = "bandage", price = 0, count = 1 }
        },
        markerType = 2,
        markerColour = { r = 0, g = 0, b = 255 },
        msg = 'Presiona ~r~[E]~h~ A la tienda de ambulancias',
        show3D = true,
        enableBlip = false,
        job = 'ambulance'
    },
	['Armeria Policial'] = {
        coords = {
            vector3(144.6, 2057.84, 10.15),
			vector3(1325.48, 1416.75, 25.87)
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
        markerType = 2,
        markerColour = { r = 0, g = 0, b = 255 },
        msg = 'Presiona ~g~[E]~h~ A la Armería de la Policía',
        show3D = true,
        job = 'police'
    },
	['Alimentos Prisioneros'] = {
        coords = {
            vector3(156.8, 2049.04, 10.13),
			vector3(1312.69, 1417.92, 30.83)
        },
        items = {
            { name = "water", price = 0, count = 1, grade = 0 },
			{ name = "coffee", price = 0, count = 1, grade = 0 },
            { name = "bread", price = 0, count = 1, grade = 0 }
        },
        markerType = 2,
        markerColour = { r = 0, g = 0, b = 255 },
        msg = 'Presiona ~g~[E]~h~ A la Armería de la Policía',
        show3D = true,
        job = 'police'
    },
}
Config.Stash = {
   ['Deposito Evidencias'] = {
        coords = vector3(176.64,2050.43,10.12),
        size = vector3(1.0, 1.0, 1.0),
        job = 'police',
        markerType = 2,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = 'Presiona ~r~[E]~h~ Para abrir cosas confiscadas',
        show3D = true
    },

    ['Deposito Joyas'] = {
        coords = vector3(174.23,2053.38,10.12),
        size = vector3(1.0, 1.0, 1.0),
        job = 'police',
        markerType = 2,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = 'Presiona ~r~[E]~h~ Para abrir el Deposito',
        show3D = true
    },
	['Deposito Drogas'] = {
        coords = vector3(176.58,2057.69,10.12),
        size = vector3(1.0, 1.0, 1.0),
        job = 'police',
        markerType = 2,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = 'Presiona ~r~[E]~h~ Para abrir el Deposito',
        show3D = true
    },
	['Deposito'] = {
        coords = vector3(1325.77,1406.74,34.36),
        size = vector3(1.0, 1.0, 1.0),
        job = 'police',
        markerType = 2,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = 'Presiona ~r~[E]~h~ Para abrir el Deposito',
        show3D = true
    },


   -- ['blackmarket Stash'] = {
   --  --   coords = vector3(1252.9504394531, -2577.5148925781, 42.948802947998),
   --     size = vector3(1.0, 1.0, 1.0),
   --     job = 'blackmarket',
   --     markerType = 2,
   --     markerColour = { r = 255, g = 255, b = 255 },
   --     msg = 'Presiona ~r~[E]~h~ To Alijo abierto del mercado negro',
   --     show3D = true
   -- },
   --
    ['Deposito ChinaTow'] = {
        coords = vector3(-1169.6, 1912.25, 19.78),
        size = vector3(0.5, 0.5, 0.5),
        job = 'bloodbrothers',
        markerType = 3,
        markerColour = { r = 255, g = 0, b = 0 },
        msg = '~h~Presiona ~r~[E]~h~ Para abrir Armario',
        show3D = true
    },
	['Deposito The-Cripts'] = {
        coords = vector3(-1183.59, 2390.69, 26.06),
        size = vector3(0.5, 0.5, 0.5),
        job = 'oldschool',
        markerType = 3,
        markerColour = { r = 255, g = 255, b = 0 },
        msg = '~h~Presiona ~r~[E]~h~ Para abrir Armario',
        show3D = true
    },
   --
   -- ['biton Stash'] = {
   --  --   coords = vector3(-1861.75, 2054.94, 135.46),
   --     size = vector3(1.0, 1.0, 1.0),
   --     job = 'biton',
   --     markerType = 2,
   --     markerColour = { r = 255, g = 255, b = 255 },
   --     msg = '~h~Presiona ~r~[E]~h~ Para abrir biton Deposito',
   --     show3D = true
   -- },
   --
   -- ['ballas Stash'] = {
   --  --   coords = vector3(118.91, -1965.85, 21.33),
   --     size = vector3(1.0, 1.0, 1.0),
   --     job = 'ballas',
   --     markerType = 2,
   --     markerColour = { r = 255, g = 255, b = 255 },
   --     msg = '~h~Presiona ~r~[E]~h~ Para abrir ballas Deposito',
   --     show3D = true
   -- },
   --
   -- ['marabunta Stash'] = {
   --  --   coords = vector3(1443.76, -1491.03, 66.62),
   --     size = vector3(1.0, 1.0, 1.0),
   --     job = 'marabunta',
   --     markerType = 2,
   --     markerColour = { r = 255, g = 255, b = 255 },
   --     msg = '~h~Presiona ~r~[E]~h~ Para abrir Marabunta Deposito',
   --     show3D = true
   -- },
   --
   --   ['thefamilie Stash'] = {
   --  --   coords = vector3(-155.61, -1604.37, 35.04),
   --     size = vector3(1.0, 1.0, 1.0),
   --     job = 'thefamilie',
   --     markerType = 2,
   --     markerColour = { r = 255, g = 255, b = 255 },
   --     msg = '~h~Presiona ~r~[E]~h~ Para abrir Deposito',
   --     show3D = true
   -- },
   --
   -- ['blood Stash'] = {
   --  --   coords = vector3(715.96, -791.45, 16.47),
   --     size = vector3(1.0, 1.0, 1.0),
   --     job = 'blood',
   --     markerType = 2,
   --     markerColour = { r = 255, g = 255, b = 255 },
   --     msg = '~h~Presiona ~r~[E]~h~ Para abrir Deposito',
   --     show3D = true
   -- },
   --
   -- ['vagos Stash'] = {
   --  --   coords = vector3(341.59, -2021.63, 25.59),
   --     size = vector3(1.0, 1.0, 1.0),
   --     job = 'vagos',
   --     markerType = 2,
   --     markerColour = { r = 255, g = 255, b = 255 },
   --     msg = '~h~Presiona ~r~[E]~h~ Para abrir Deposito',
   --     show3D = true
   -- },
   --
   -- ['diamonblack Stash'] = {
   --     coords = vector3(-1193.35, 301.39, 69.88),
   --     size = vector3(1.0, 1.0, 1.0),
   --     job = 'diamonblack',
   --     markerType = 2,
   --     markerColour = { r = 255, g = 255, b = 255 },
   --     msg = '~h~Presiona ~r~[E]~h~ Para abrir Deposito',
   --     show3D = true
   -- },

    ['Mechanic'] = {
        coords = vector3(-1427.95, 1979.94, 23.21),
        size = vector3(1.0, 1.0, 1.0),
        job = 'mechanic',
        markerType = 2,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = '~r~Presiona ~r~[E]~p~ Para abrir Deposito',
        show3D = true
    },
	
	['Taxi'] = {
        coords = vector3(902.63, -171.37, 74.08),
        size = vector3(1.0, 1.0, 1.0),
        job = 'taxi',
        markerType = 2,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = '~r~Presiona ~r~[E]~p~ Para abrir Deposito',
        show3D = true
    },
	
	['Ambulancias'] = {
        coords = vector3(-1263.04, 2093.39, 23.33),
        size = vector3(1.0, 1.0, 1.0),
        job = 'ambulance',
        markerType = 2,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = '~r~Presiona ~r~[E]~p~ Para abrir el Armario',
        show3D = true
    }
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
    WEAPON_SNOWBALL = 126349499
}

Config.FuelCan = 883325847
