Crafting = {}
-- You can configure locations here
Crafting.Locations = {
    [1] = {x = 110.74, y = -1981.23, z = 20.96},    --ballas
    [2] = {x = 337.65, y = -2012.19, z = 22.39},  --vagos
    [3] = {x = 1435.64, y = -1490.39, z = 66.62},  -- marabunta
    [4] = {x = -137.82, y = -1610.27, z = 35.03},  --thefamilie
    [5] = {x = 3094.55, y = -4715.6, z = 27.28}, 
}
--[[
    You can add or remove if you want, be sure to use the right format like this:
    ["item_name"] = {
        label = "Item Label",
        needs = {
            ["item_to_use_name"] = {label = "Item Use Label", count = 1}, 
            ["item_to_use_name2"] = {label = "Item Use Label", count = 2},
        },
        threshold = 0,
    },

    #! 
        Threshold level is a level that gets saved (in the database) by crafting, if you craft succefully you gain points, if you fail you lose points.
        The threshold level can be changed to your liking.
    #!

    Also if you don't have the items below make sure to remove it and create your own version.
]]--
Crafting.Items = {
    ["partarml"] = {
        label = "Partes de arma larga",
        needs = {
            ["partarmc"] = {label = "Madera", count = 1},
            ["partarmm"] = {label = "Hiero", count = 2},
        },
        threshold = 0,
    },
    ["lockpick"] = {
        label = "Ganzua",
        needs = {
            ["wood"] = {label = "Madera", count = 10},
            ["iron"] = {label = "Hiero", count = 10},
        },
        threshold = 0,
    },
    ["advancedlockpick"] = {
        label = "Ganzua Avanzada",
        needs = {
            ["wood"] = {label = "Madera", count = 10},
            ["iron"] = {label = "Hiero", count = 15},
            ["diamond"] = {label = "diamante", count = 1},
        },
        threshold = 0,
    },
    ["disc_ammo_pistol"] = {
        label = "municion de pistola",
        needs = {
            ["iron"] = {label = "Hierro", count = 5},
            ["copper"] = {label = "Cobre", count = 5},
            ["stones"] = {label = "Piedras", count = 5},
            ["steel"] = {label = "Acero", count = 2}, 
         },
        threshold = 0,
    },
    ["disc_ammo_pistol_large"] = {
        label = "municion de pistola grande",
        needs = {
            ["iron"] = {label = "Hierro", count = 10},
           ["copper"] = {label = "Cobre", count = 10},
            ["stones"] = {label = "Piedras", count = 10},
            ["steel"] = {label = "Acero", count = 2},
        },
        threshold = 0,
    },
    ["disc_ammo_rifle"] = {
        label = "municion de rifle",
        needs = {
           ["iron"] = {label = "Hierro", count = 15},
            ["copper"] = {label = "Cobre", count = 15},
            ["stones"] = {label = "Piedras", count = 15},
            ["steel"] = {label = "Acero", count = 3},
        },
        threshold = 0,
    },
    ["disc_ammo_rifle_large"] = {
        label = "municion de rifle grande",
        needs = {
            ["iron"] = {label = "Hierro", count = 20},
            ["copper"] = {label = "Cobre", count = 20},
            ["stones"] = {label = "Piedras", count = 20},
            ["steel"] = {label = "Acero", count = 4},
        },
        threshold = 0,
    },
    ["disc_ammo_shotgun"] = {
        label = "municion de escopeta",
        needs = {
            ["iron"] = {label = "Hierro", count = 15},
          ["copper"] = {label = "Cobre", count = 15},
            ["stones"] = {label = "Piedras", count = 15},
            ["steel"] = {label = "Acero", count = 3},
        },
        threshold = 0,
    },
    ["disc_ammo_shotgun_large"] = {
        label = "municion de escopeta grande",
        needs = {
           ["iron"] = {label = "Hierro", count = 15},
           ["copper"] = {label = "Cobre", count = 15},
            ["stones"] = {label = "Piedras", count = 15},
            ["steel"] = {label = "Acero", count = 3},
        },
        threshold = 0,
    },
    ["disc_ammo_smg"] = {
        label = "municion de smg",
        needs = {
           ["iron"] = {label = "Hierro", count = 15},
           ["copper"] = {label = "Cobre", count = 15},
            ["stones"] = {label = "Piedras", count = 15},
            ["steel"] = {label = "Acero", count = 3},
        },
        threshold = 0,
    },
    ["disc_ammo_smg_large"] = {
        label = "municion de smg grande",
        needs = {
           ["iron"] = {label = "Hierro", count = 20},
           ["copper"] = {label = "Cobre", count = 20},
            ["stones"] = {label = "Piedras", count = 20},
            ["steel"] = {label = "Acero", count = 4},
        },
        threshold = 0,
    },
    ["disc_ammo_snp"] = {
        label = "municion de franco",
        needs = {
           ["iron"] = {label = "Hierro", count = 20},
           ["copper"] = {label = "Cobre", count = 20},
            ["stones"] = {label = "Piedras", count = 20},
            ["steel"] = {label = "Acero", count = 4},
        },
        threshold = 0,
    },
    ["disc_ammo_snp_large"] = {
        label = "municion de franco grande",
        needs = {
            ["iron"] = {label = "Hierro", count = 25},
            ["copper"] = {label = "Cobre", count = 25},
            ["stones"] = {label = "Piedras", count = 25},
            ["steel"] = {label = "Acero", count = 5},
        },
        threshold = 0,
    },
    ["thermal_charge"] = {
        label = "thermal_charge",
        needs = {
            ["iron"] = {label = "Hierro", count = 20},
            ["copper"] = {label = "Cobre", count = 20},
            ["stones"] = {label = "Piedras", count = 5},
            ["wood"] = {label = "Madera", count = 5},
            ["steel"] = {label = "Acero", count = 1},
        },
        threshold = 0,
    },
    ["bulletproof"] = {
        label = "Chaleco antibalas",
        needs = {
            ["iron"] = {label = "Hierro", count = 50},
            ["copper"] = {label = "Cobre", count = 50},
            ["stones"] = {label = "Piedras", count = 20},
            ["steel"] = {label = "Acero", count = 10},
        },
        threshold = 0,
    },
    ["WEAPON_SWITCHBLADE"] = {
        label = "Navaja",
        needs = {
            ["iron"] = {label = "Hierro", count = 25},
            ["copper"] = {label = "Cobre", count = 25},
            ["wood"] = {label = "Madera", count = 5},
            ["steel"] = {label = "Acero", count = 5},
        },
        threshold = 0,
    },

    ["WEAPON_PISTOL"] = {
        label = "Pistola",
        needs = {
           ["iron"] = {label = "Hierro", count = 50},
            ["copper"] = {label = "Cobre", count = 50},
            ["wood"] = {label = "Madera", count = 25},
            ["steel"] = {label = "Acero", count = 10},
            ["partarmc"] = {label = "Partes de arma corta", count = 5},
        },
        threshold = 0,
    },

       ["WEAPON_PISTOL_MK2"] = {
        label = "Pistola",
        needs = {
           ["iron"] = {label = "Hierro", count = 80},
            ["copper"] = {label = "Cobre", count = 80},
            ["wood"] = {label = "Madera", count = 40},
            ["steel"] = {label = "Acero", count = 15},
            ["partarmc"] = {label = "Partes de arma corta", count = 5},
            ["partarmm"] = {label = "Partes de arma media", count = 5},
        },
        threshold = 0,
    },

    ["WEAPON_MACHINEPISTOL"] = {
        label = "MACHINEPISTOL",
        needs = {
            ["iron"] = {label = "Hierro", count = 70},
            ["copper"] = {label = "Copper", count = 70},
           ["wood"] = {label = "Madera", count = 40},
           ["steel"] = {label = "Acero", count = 20},
           ["partarmm"] = {label = "Partes de arma media", count = 10},
        },
        threshold = 0,
    },

      ["WEAPON_SMG_MK2"] = {
        label = "Smg MKII",
        needs = {
            ["iron"] = {label = "Hierro", count = 105},
            ["copper"] = {label = "Copper", count = 105},
           ["wood"] = {label = "Madera", count = 60},
           ["steel"] = {label = "Acero", count = 30},
           ["partarmm"] = {label = "Partes de arma media", count = 10},
           ["partarml"] = {label = "Partes de arma larga", count = 10},
        },
        threshold = 0,
    },
     ["WEAPON_SAWNOFFSHOTGUN"] = {
        label = "Recortada",
        needs = {
           ["iron"] = {label = "Hierro", count = 80},
            ["copper"] = {label = "Cobre", count = 80},
           ["wood"] = {label = "Madera", count = 50},
            ["steel"] = {label = "Acero", count = 30},
            ["partarmm"] = {label = "Partes de arma media", count = 10},
        },
        threshold = 0,
    },
    ["WEAPON_ASSAULTRIFLE"] = {
        label = "Rifle",
        needs = {
           ["iron"] = {label = "Hierro", count = 100},
           ["copper"] = {label = "Cobre", count = 100},
           ["steel"] = {label = "Acero", count = 40},
           ["wood"] = {label = "Madera", count = 75},
           ["gold"] = {label = "Oro", count = 30},
           ["partarml"] = {label = "Partes de arma larga", count = 20},
           ["partarmm"] = {label = "Partes de arma media", count = 10},
        },
        threshold = 0,
    },

        ["WEAPON_ASSAULTRIFLE_MK2"] = {
        label = "Rifle MKII",
        needs = {
           ["iron"] = {label = "Hierro", count = 150},
           ["copper"] = {label = "Cobre", count = 150},
           ["steel"] = {label = "Acero", count = 60},
           ["wood"] = {label = "Madera", count = 105},
           ["gold"] = {label = "Oro", count = 40},
           ["partarml"] = {label = "Partes de arma larga", count = 30},
           ["partarmm"] = {label = "Partes de arma media", count = 15},
           ["partarmc"] = {label = "Partes de arma corta", count = 10},
        },
        threshold = 0,
    },
     ["WEAPON_SNIPERRIFLE"] = {
        label = "Franco",
        needs = {
            ["iron"] = {label = "Hierro", count = 200},
            ["copper"] = {label = "Cobre", count = 200},
            ["steel"] = {label = "Acero", count = 50},
            ["diamond"] = {label = "Diamantes", count = 50},
            ["gold"] = {label = "Oro", count = 50},
            ["wood"] = {label = "Madera", count = 100},
            ["partarml"] = {label = "Partes de arma larga", count = 50},
            ["partarmm"] = {label = "Partes de arma media", count = 20},
        },
        threshold = 0,
    },
}