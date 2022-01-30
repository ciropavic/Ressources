Config = {}


local StringCharset = {}
local NumberCharset = {}

for i = 48,  57 do table.insert(NumberCharset, string.char(i)) end
for i = 65,  90 do table.insert(StringCharset, string.char(i)) end
for i = 97, 122 do table.insert(StringCharset, string.char(i)) end

Config.RandomStr = function(length)
	if length > 0 then
		return Config.RandomStr(length-1) .. StringCharset[math.random(1, #StringCharset)]
	else
		return ''
	end
end

Config.RandomInt = function(length)
	if length > 0 then
		return Config.RandomInt(length-1) .. NumberCharset[math.random(1, #NumberCharset)]
	else
		return ''
	end
end


Config.Objects = {
    ["cone"] = {model = `prop_roadcone02a`, freeze = false},
    ["barier"] = {model = `prop_barrier_work06a`, freeze = true},
    ["schotten"] = {model = `prop_snow_sign_road_06g`, freeze = true},
    ["tent"] = {model = `prop_gazebo_03`, freeze = true},
    ["light"] = {model = `prop_worklight_03b`, freeze = true},
}

Config.Shops = {
   Shop = {
       Cams = {
           --vector3(459.82534790039, -988.85571289063, 24.914850234985)
       }
   }
}


Config.Locations = {
   ["duty"] = {
	[1] = {x = 159.16, y = 2050.85, z = 10.13, h = 81.21},
	[2] = {x = 1309.89, y = 1375.33, z = 30.83, h = 99.21},
   },    
   ["vehicle"] = {
       [1] = {x = 145.45, y = 2021.96, z = 14.61, h = 176.91},
       [2] = {x = 151.38, y = 2021.87, z = 14.6, h =183.5},
       [3] = { x = 157.64, y = 2022.56, z = 14.6, h =175.5},
	   [4] = { x = 1299.74, y = 1422.08, z = 38.5, h =231.5},
   },    
   ["impound"] = {
      [1] = {x = 163.61, y = 2022.25, z = 14.61, h = 74.64},
      --[2] = {x = -190.71, y = -1173.9, z = 23.04, h = 189.0, r = 1.0},
  }, 
   ["stash"] = {
	--[1] = {x = 463.09, y = -980.26, z = 30.69, h = 90.654},
   },
   ["sheriff_stash"] = {
	--[1] = { x = 1842.3568115234, y = 3690.5415039063, z = 34.267086029053},
   },
   ["boss"] = {
	[1] = { x = 2205.92, y = 1312.76, z = 6.14},
   },    
   ["helicopter"] = {
       [1] = {x = 449.168, y = -981.325, z = 43.691, h = 87.234},
       [2] = {x = -475.43, y = 5988.353, z = 31.716, h = 31.34},
   }, 
    ["armory"] = {
	--[1] = {x = 482.82, y = -995.29, z = 30.69},
   }, 
   ["sheriff_armory"] = {
	--[1] = { x = 1840.7115478516, y = 3691.4047851563, z = 34.267726898193},
},     
   ["trash"] = {
     --  [1] = {x = 470.41, y = -988.61, z = 26.27, h = 169.0},
   },      
   ["evidence"] = {
	  -- [1] = {x = 475.18, y = -997.36, z = 26.27},
	  -- [2] = {x = 475.13, y = -994.11, z = 26.27},
	  -- [3] = {x = 472, y = -997.07, z = 26.27},
	  -- [4] = { x = 1855.6506347656, y = 3699.2360839844, z = 34.267074584961},
   },  
   ["cameras"] = {
	[1] = { x = 153.99, y = 2038.22, z = 14.14 },
	[2] = { x = 1311.22, y = 1370.6, z = 30.83},
},  
   ["stations"] = {
	   [1] = {label = "Estacion Policial", coords = {x = 154.35, y = 2051.67, z = 10.13}},
	   [2] = {label = "Estacion Policial", coords = {x = 1311.22, y = 1370.6, z = 30.83}},
   },
   ["license"] = {
		[1] = { x = 1297.39, y = 1380.05, z = 30.83},
		--[2] = { x = 1861.5081787109, y = 3691.8110351563, z = 34.267074584961}
	},
	["personal"] = {
		[1] = { x = 463.12, y = -982.47, z = 30.69}
	}
}
Config.Helicopter = "polmav"
Config.HelicopterGrade = 2

Config.SecurityCameras = {
    hideradar = false,
    cameras = {
        [1] = {label = "Banco CAM#1", x = 46.98, y = 363.98, z = 16.41, r = {x = -25.0, y = 0.0, z = 88.05}, canRotate = true, isOnline = true},
        [2] = {label = "Banco CAM#2", x = 68.38, y = 362.61, z = 16.41, r = {x = -25.0, y = 0.0, z = 40.91}, canRotate = true, isOnline = true},
        [3] = {label = "Banco CAM#3", x = 69.15, y = 383.2, z = 16.41, r = {x = -35.0, y = 0.0, z = 4.87}, canRotate = true, isOnline = true},
        [4] = {label = "Boveda Banco CAM#1", x = 68.09, y = 367.66, z = 9.91, r = {x = -35.0, y = 0.0, z = 68.9182}, canRotate = true, isOnline = true},
        [5] = {label = "Boveda Banco CAM#2", x = 51.43, y = 369.62, z = 9.91, r = {x = -35.0, y = 0.0, z = 79.53281}, canRotate = true, isOnline = true},
        [6] = {label = "Ayuntamiento CAM#1", x = -89.56, y = 1442.37, z = 16.6, r = {x = -35.0, y = 0.0, z = 0.778894}, canRotate = true, isOnline = true},
    },
}

Config.Vehicles = {
	{ name = 'policeb', label = "MotoBmwCNP", grade = 1},
	{ name = 'police3', label = "FordTahoeCNP", grade = 3},
	{ name = 'sheriff', label = "FordFiestaCNP", grade = 2},
  { name = 'police2', label = "LexusCNP", grade = 4},
  { name = 'police', label = "C4picassoCNP", grade= 0},
	{ name = 'ghispo2', label = "MasseratiCNP", grade = 1},
  { name = 'policet', label = "SprinterFurgonCNP", grade = 2},
  { name = 'bentley2', label = "BentleySecretaCNP", grade = 4},
  { name = 'lpd_golfz1', label = "Golf8CNP", grade = 1},
  { name = 'policeold2', label = "SeatAlteaXLCNP", grade = 4},
  { name = 'police4', label = "BmWM8SecretaCNP", grade = 1},
  { name = 'lpd_a8z1', label = "A8SecretaCNP", grade = 1},
  { name = 'mustang', label = "MustangSecretaCNP", grade= 2},
}