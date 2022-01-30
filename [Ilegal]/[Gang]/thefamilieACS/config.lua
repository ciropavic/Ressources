Config = {}

-- thefamilie Armory Positions:
Config.ArmoryZones = {
	thefamilieArmory = {
		Pos = {
			--{x = 707.49,  y = -791.29, z = 16.47},       
			{x = 0.0,  y = 0.0, z = 0.0}
		}
	}
}

--thefamilie Kevlar Positions:
Config.KevlarZones = {
	thefamilieKevlar = {
		Pos = {
			{x = -130.68,  y = -1606.48, z = 35.03},    
			{x = 0,  y = 0, z = 0}
		}
	}
}

--thefamilie Attachments Positions:
Config.AttachmentZones = {
	thefamilieAttachments = {
		Pos = {
			{x = -133.77,  y = -1603.88, z = 35.03},       
			{x = 0,  y = 0, z = 0} 
		}
	}
}

-- thefamilie Armory Marker Settings:
Config.KeyToOpenArmory = 38															-- default 38 is E
Config.ArmoryMarker = 27 															-- marker type
Config.ArmoryMarkerColor = { r = 50, g = 50, b = 204, a = 100 } 					-- rgba color of the marker
Config.ArmoryMarkerScale = { x = 1.0, y = 1.0, z = 1.0 }  							-- the scale for the marker on the x, y and z axis
Config.ArmoryDraw3DText = "Presiona ~g~ [E] ~s~ para ~y~ Abrir Armeria~s~"					-- set your desired text here

-- thefamilie Kevlar Marker Settings:
Config.KeyToOpenKevlar = 38															-- default 38 is E
Config.KevlarMarker = 27 															-- marker type
Config.KevlarMarkerColor = { r = 50, g = 50, b = 204, a = 100 } 					-- rgba color of the marker
Config.KevlarMarkerScale = { x = 1.0, y = 1.0, z = 1.0 }  							-- the scale for the marker on the x, y and z axis
Config.KevlarDraw3DText = "Presiona ~g~[E]~s~ para ~y~ Ponerte un chaleco~s~"					-- set your desired text here

-- thefamilie Attachments Marker Settings:
Config.KeyToOpenAttachments = 38													-- default 38 is E
Config.AttachmentsMarker = 27 														-- marker type
Config.AttachmentsMarkerColor = { r = 50, g = 50, b = 204, a = 100 } 				-- rgba color of the marker
Config.AttachmentsMarkerScale = { x = 1.0, y = 1.0, z = 1.0 }   					-- the scale for the marker on the x, y and z axis
Config.AttachmentsDraw3DText = "Presiona ~g~[E]~s~ para ~y~Abrir menu de accesorios~s~"		-- set your desired text here

-- Menu Element Labels:
Config.WeaponStorage = "Armas"
Config.RestockWeapon = "Depositar"
--Config.Vest1 = "Kevlar 1"					-- 25% armor
--Config.Vest2 = "Kevlar 2"					-- 50% armor
--Config.Vest3 = "Kevlar 3"					-- 75% armor
Config.Vest4 = "Chaleco antibalas"					-- 100% armor
Config.RemoveVest = "Despegar"			-- 0% armor

-- Menu Title Labels_
Config.thefamilieArmoryTitle = "Armas"
Config.WeaponStorageTitle = "Armas"
Config.RestockWeaponTitle = "Depositar"
Config.thefamilieKevlarTitle = "Chaleco"
Config.ChooseWeaponTitle = "Elige el arma"
Config.AttachmentTitle = "Accesorios"

-- ESX Show Notifications_
Config.ContactSuperVisor = "Ya sacaste esta arma, contacta a un supervisor"
Config.NothefamilieOnline = "Ningún oficial de policía está en línea"
Config.WeaponMustBeInHand = "Tienes que sostener el arma en tu mano"
Config.clipEquipped = "Has equipado una linterna ~r~%s ~s~"
Config.clipRemove = "Quitaste una linterna por ~r~%s ~s~"
Config.ScopeEquipped = "Ha equipado un visor para ~r~%s ~s~"
Config.ScopeRemove = "Eliminaste un alcance para ~r~%s ~s~"
Config.SuppressorEquipped = "Has equipado un telescopio~s~ con ~r~%s ~s~"
Config.SuppressorRemove = "Eliminaste un alcance~s~ de ~r~%s ~s~"

-- ProgressBar Text_
Config.Progress1 = "Guarda las armas"
Config.Progress2 = "Quítate el chaleco"
Config.Progress3 = "Ponte el chaleco"

-- ProgressBar Timer, in seconds:
Config.RestockTimer = 2
Config.RemoveVestTimer = 2
Config.WearVestTimer = 2

-- Ped Component Variation (Body Armor that player will wear)
--Config.VestVariation1 = { componentId = 9, drawableId = 12, textureId = 0, paletteId = 12 } -- 25%
--Config.VestVariation2 = { componentId = 9, drawableId = 1, textureId = 0, paletteId = 0 } -- 50%
--Config.VestVariation3 = { componentId = 9, drawableId = 1, textureId = 2, paletteId = 0 } -- 75%
Config.VestVariation4 = { componentId = 9, drawableId = 6, textureId = 0, paletteId = 12 } -- 100%

-- Set the exact name from your jobs database for thefamilie
Config.thefamilieDatabaseName = 'thefamilie'

-- Set required thefamilie job grade to restock weapon
Config.RestockGrade = 4

-- Set amount of ammo you want when taking a weapon out
Config.AmmountOfAmmo = 250

-- Here u add weapons and its components (set nil at a component to disable it).
Config.WeaponsInArmory = {
	{ weaponHash = 'WEAPON_PISTOL', label = 'PISTOLA', type = 'pistol', attachment = true, clip = 0xED265A1C, scope = 0x359B7AAE, suppressor = 0x65EA7EBB},
	{ weaponHash = 'WEAPON_PISTOL_MK2', label = 'PISTOLA MK2', type = 'pistol', attachment = true, clip = 0x85FEA109, scope = 0x21E34793, suppressor = 0x65EA7EBB  },
	{ weaponHash = 'WEAPON_PISTOL_MK2', label = 'PISTOLA MK3', type = 'pistol', attachment = true, clip = 0x2BBD7A3A, scope = 0x8ED4BB70, suppressor = 0x21E34793  },
	--{ weaponHash = 'WEAPON_COMBATPISTOL', label = 'PISTOLA DE COMBATE', type = 'pistol', attachment = true, clip = 0xD67B4F2D, scope = 0x359B7AAE, suppressor = 0xC304849A},
	--{ weaponHash = 'WEAPON_APPISTOL', label = 'PISTOLA PERFORANTE', type = 'appistol', attachment = true, clip = 0x249A17D5, scope = 0x359B7AAE, suppressor = 0xC304849A},
	--{ weaponHash = 'WEAPON_PISTOL50', label = 'PISTOLA 50', type = 'pistol', attachment = true, clip = 0xD9D3AC92, scope = 0x359B7AAE, suppressor = 0xA73D4664},
	--{ weaponHash = 'WEAPON_SNSPISTOL', label = 'PISTOLA ', type = 'pistol', attachment = true, clip = 0x7B0033B3, scope = nil, suppressor = 0x8033ECAF},
	--{ weaponHash = 'WEAPON_SNSPISTOL_MK2', label = 'PISTOLA SNS ', type = 'pistol', attachment = true, clip = 0xC111EB26, scope = 0x47DE9258, suppressor = 0x65EA7EBB},
	--{ weaponHash = 'WEAPON_HEAVYPISTOL', label = 'PISTOLA PESADA', type = 'pistol', attachment = true, clip = 0x64F9C62B, scope = 0x7A6A7B7B, suppressor = 0xC304849A},
	--{ weaponHash = 'WEAPON_REVOLVER', label = 'REVOLVER', type = 'pistol', attachment = true, clip = 0xE9867CE3, scope = 0x9493B80D, suppressor = 0x16EE3040},
	--{ weaponHash = 'WEAPON_REVOLVER_MK2', label = 'REVOLVER MEJORADO', type = 'pistol', attachment = true, clip = 0xDC8BA3F, scope = 0x49B2945, suppressor = 0x27077CCB},
	--{ weaponHash = 'WEAPON_VINTAGEPISTOL', label = 'PISTOLA', type = 'pistol', attachment = true, clip = 0x33BA12E8, scope = nil, suppressor = 0xC304849A},
	{ weaponHash = 'WEAPON_MACHINEPISTOL', label = 'TEC-9', type = 'pistol', attachment = true, clip = 0xA9E9CAF4, scope = nil, suppressor = 0xC304849A  },
	--{ weaponHash = 'WEAPON_MICROSMG', label = 'MICROSMG', type = 'microsmg', attachment = true, clip = 0x10E6BA2B, scope = 0x9D2FBF29, suppressor = 0xA73D4664},
	--{ weaponHash = 'WEAPON_SMG', label = 'SMG ', type = 'smg', attachment = true, clip = 0x79C77076, scope = 0x3DECC7DA, suppressor = 0xC304849A},
	{ weaponHash = 'WEAPON_SMG_MK2', label = 'SMG MK2', type = 'smg', attachment = true, clip = 0xB5A715F, scope = 0x3DECC7DA, suppressor = 0xC304849A},
	{ weaponHash = 'WEAPON_SMG_MK2', label = 'SMG MK3', type = 'smg', attachment = true, clip = 0xD99222E5, scope = 0xE502AB6B, suppressor = 0xEC9068CC},
	--{ weaponHash = 'WEAPON_ASSAULTSMG', label = 'SMG ASSAULT', type = 'smg asalto', attachment = true, clip = 0xBB46E417, scope = 0x9D2FBF29, suppressor = 0xA73D4664},
	--{ weaponHash = 'WEAPON_MINISMG', label = 'MINISMG ', type = 'minismg', attachment = true, clip = 0x937ED0B7, scope = nil0xB5A715F, suppressor = nil0xB5A715F},
    --{ weaponHash = 'WEAPON_COMBATPDW', label = 'PDW', type = 'smg', attachment = true, clip = 0x6EB8C8DB, scope = 0xAA2C45B4, suppressor = 0xC164F53  },
    --{ weaponHash = 'WEAPON_PUMPSHOTGUN', label = 'ESCOPETA', type = 'escopeta', attachment = true, clip = 0x7BC4CDDC, scope = 0xA2D79DDB, suppressor = 0xE608B35E  },
    --{ weaponHash = 'WEAPON_PUMPSHOTGUN_MK2', label = 'ESCOPETAMK2', type = 'escopeta mejorada', attachment = true, clip = 0x3BE4465D, scope = 0x49B2945, suppressor = 0x5F7DCE4D  },
    --{ weaponHash = 'WEAPON_ASSAULTSHOTGUN', label = 'ESCOPETA ASALTO', type = 'escopeta asalto', attachment = true, clip = 0x86BD7F72, scope = 0xC164F53, suppressor = 0x837445AA  },
	--{ weaponHash = 'WEAPON_BULLPUPSHOTGUN', label = 'ESCOPETA BULL', type = 'escopeta bullpup', attachment = true, clip = 0x7BC4CDDC, scope = 0xC164F53, suppressor = 0xA73D4664  },
	--{ weaponHash = 'WEAPON_HEAVYSHOTGUN', label = 'ESCOPETA PESADA', type = 'escopeta pesada', attachment = true, clip = 0x88C7DA53, scope = 0xC164F53, suppressor = 0xA73D4664  },
	{ weaponHash = 'WEAPON_ASSAULTRIFLE', label = 'AK ', type = 'rifle', attachment = true, clip = 0xDBF0A53D, scope = 0x9D2FBF29, suppressor = 0xA73D4664 },
	{ weaponHash = 'WEAPON_ASSAULTRIFLE_MK2', label = 'AK MK2', type = 'rifle mejorado', attachment = true, clip = 0x63E0A098, scope = 0xC66B6542, suppressor = 0xA73D4664 },
	--{ weaponHash = 'WEAPON_CARBINERIFLE', label = 'CARABINA ', type = 'rifle', attachment = true, clip = 0xBA62E935, scope = 0xA0D89C42, suppressor = 0x837445AA  },
	--{ weaponHash = 'WEAPON_CARBINERIFLE_MK2', label = 'CARABINA MK2', type = 'rifle', attachment = true, clip = 0x44032F11, scope = 0xC66B6542, suppressor = 0x837445AA  },
	--{ weaponHash = 'WEAPON_ADVANCEDRIFLE', label = 'RIFLE AVANZADO', type = 'rifle', attachment = true, clip = 0x8EC1C979, scope = 0xAA2C45B4, suppressor = 0x837445AA  },
	--{ weaponHash = 'WEAPON_SPECIALCARBINE', label = 'ESPECIAL CARABINA ', type = 'rifle', attachment = true, clip = 0x6B59AEAA, scope = 0xA0D89C42, suppressor = 0xA73D4664  },
	--{ weaponHash = 'WEAPON_SPECIALCARBINE_MK2', label = 'ESPECIAL CARABINA MEJORADA', type = 'rifle', attachment = true, clip = 0x503DEA90, scope = 0xC66B6542, suppressor = 0xF97F783B  },
	--{ weaponHash = 'WEAPON_BULLPUPRIFLE', label = 'BULLPUP ', type = 'rifle', attachment = true, clip = 0xB3688B0F, scope = 0xAA2C45B4, suppressor = 0x837445AA  },
	--{ weaponHash = 'WEAPON_BULLPUPRIFLE_MK2', label = 'BULLPUP MK2', type = 'rifle', attachment = true, clip = 0x43621710, scope = 0x3F3C8181, suppressor = 0x837445AA  },
	--{ weaponHash = 'WEAPON_COMPACTRIFLE', label = 'COMPACT ', type = 'rifle', attachment = true, clip = 0xC607740E, scope = nil, suppressor = nil  },
	--{ weaponHash = 'WEAPON_MG', label = 'MG ', type = 'AMETRALLADORA', attachment = true, clip = 0x82158B47, scope = 0x3C00AFED, suppressor = 0xD6DABABE  },
	--{ weaponHash = 'WEAPON_COMBATMG', label = 'MG COMBAT ', type = 'AMETRALLADORA CBT', attachment = true, clip = 0xD6C59CD6, scope = 0xA0D89C42, suppressor = 0xC164F53  },
	--{ weaponHash = 'WEAPON_COMBATMG_MK2', label = 'MG COMBAT MK2 ', type = 'AMETRALLADORA CBT MK2', attachment = true, clip = 0x57EF1CC8, scope = 0xC66B6542, suppressor = 0xB5E2575B  },
	--{ weaponHash = 'WEAPON_GUSENBERG', label = 'THOMPSOM ', type = 'THOMPSOM', attachment = true, clip = 0xEAC8C270, scope = nil, suppressor = nil  },
	--{ weaponHash = 'WEAPON_SNIPERRIFLE', label = 'SNIPER', type = 'sniperifle', attachment = true, clip = 0xE6CFD1AA, scope = 0xBC54DA77, suppressor = 0x4032B5E7  },
	--{ weaponHash = 'WEAPON_HEAVYSNIPER', label = 'SNIPER PESADO', type = 'sniperifle', attachment = true, clip = nil, scope = 0xBC54DA77, suppressor = nil  },
	--{ weaponHash = 'WEAPON_HEAVYSNIPER_MK2', label = 'SNIPER PESADO MK2', type = 'sniperifle mk2', attachment = true, clip = 0x89EBDAA7, scope = 0x2E43DA41, suppressor = 0xAC42DF71  },
	--{ weaponHash = 'WEAPON_GRENADELAUNCHER', label = 'SNIPER PESADO MK2', type = 'sniperifle mk2', attachment = true, clip = 0x7BC4CDDC, scope = 0xC164F53, suppressor = 0xAA2C45B4  },
}

Config.DiscordWebook = ""
