Config = {}

Config.Locale = 'en'

Config.Enabled = true
Config.Debug = false
Config.DrawDistance = 50
Config.Pay = 25
Config.Vehicle = 'forklift'
Config.DamageLimit = 20.00

Config.Pallet = 'prop_boxpile_07d'

Config.Zones = {
    Locker = {
        Pos     = vector3(-1079.37, 1260.57, 3.98),
        Color   = {r = 238, g = 238, b = 0},
        Size    = {x = 0.5, y = 0.5, z = 0.5},
        Type    = 3,    
    },

    Garage = {
        Pos     = vector3(-1086.6, 1292.61, 3.98),
        Color   = {r = 238, g = 238, b = 0},
        Size    = {x = 0.5, y = 0.5, z = 0.5},
        Type    = 3,    
    },

    Return = {
        Pos     = vector3(-1083.06, 1291.86, 3.98),
        Color   = {r = 238, g = 238, b = 0},
        Size    = {x = 2.0, y = 2.0, z = 1.0},
        Type    = 3,
    },

    FLT = {
        Pos     = vector3(-1082.83, 1292.45, 3.98),
		Color   = {r = 238, g = 238, b = 0},
        Size    = {x = 2.0, y = 2.0, z = 1.0},
        Type    = 3,
        Heading = 172.00
    },

    Pickup = {
        Color   = {r = 238, g = 238, b = 0},
        Size    = {x = 0.5, y = 0.5, z = 0.5},
        Bounce  = true,
        Type    = 0
    },

    Drop = {
        Color   = {r = 238, g = 0, b = 0},
        Size    = {x = 0.5, y = 0.5, z = 0.5},
        Bounce  = true,
        Type    = 3
    },    
}

function TranslateVector(p, dir, dist)
    local angle = math.rad(dir - 90)
    local x = p.x + dist * math.cos(angle)
    local y = p.y + dist * math.sin(angle)
    return vector3(x, y, p.z)
end

Config.Points = {

    -- Berth 25
    -- Berth 153 (Post OP)
    { Pos = vector3(-1111.5, 1252.18, 5.06), Heading = 348.00 },   
    { Pos = vector3(-1079.77, 1314.21, 3.98), Heading = 92.00 },           
    
    -- Train Shed
    { Pos = vector3(-1070.88, 1286.77, 3.98), Heading = 80.00 },     
    { Pos = vector3(-1079.92, 1310.29, 3.98), Heading = 83.00 },    

    -- Octopus Ship
    { Pos = vector3(-1095.64, 1272.53, 3.98), Heading = 79.00 }, 
    { Pos = vector3(-1088.27, 1306.19, 3.98), Heading = 261.00 },     
    
}




-----------------------------
--          Props          --
-----------------------------

Config.Population = {
    Enabled = true,
    Peds = {
        { x = 29.73, y = -2659.19, z = 5.00, h = 90.00, anim = "WORLD_HUMAN_WELDING" },
        { x = 38.78, y = -2660.30, z = 5.00, h = 270.00, anim = "WORLD_HUMAN_WELDING" },
        { x = 10.14, y = -2667.49, z = 5.00, h = 90.00, anim = "WORLD_HUMAN_WELDING" },
        { x = 29.73, y = -2667.49, z = 5.00, h = 90.00, anim = "WORLD_HUMAN_WELDING" },
        { x = 9.06, y = -2664.05, z = 5.00, h = 270.00, anim = "WORLD_HUMAN_HANG_OUT_STREET" },
        { x = 10.23, y = -2664.17, z = 5.00, h = 77.04, anim = "WORLD_HUMAN_HANG_OUT_STREET" },
        { x = 23.12, y = -2637.86, z = 5.00, h = 186.00, anim = "WORLD_HUMAN_HANG_OUT_STREET" },
        { x = 22.19, y = -2638.75, z = 5.00, h = 314.00, anim = "WORLD_HUMAN_HANG_OUT_STREET" },
        { x = 23.58, y = -2639.04, z = 5.00, h = 40.00, anim = "WORLD_HUMAN_HANG_OUT_STREET" },
        { x = 13.40, y = -2654.54, z = 5.00, h = 0.00, anim = "WORLD_HUMAN_JANITOR" },
        { x = 8.41, y = -2653.74, z = 5.00, h = 0.00, anim = "WORLD_HUMAN_SMOKING" },
        { x = 14.24, y = -2664.20, z = 5.00, h = 230.00, anim = "CODE_HUMAN_MEDIC_KNEEL" },
        { x = 15.46, y = -2663.82, z = 5.00, h = 140.00, anim = "CODE_HUMAN_MEDIC_KNEEL" },
        { x = 14.17, y = -2665.48, z = 5.00, h = 327.00, anim = "WORLD_HUMAN_CLIPBOARD" },
        { x = 42.77, y = -2649.36, z = 5.00, h = 217.00, anim = "WORLD_HUMAN_CLIPBOARD" },
    },
    Radio = { x = 8.60, y = -2658.69, z = 7.50, h = 90.00, model = 'prop_boombox_01' }
}