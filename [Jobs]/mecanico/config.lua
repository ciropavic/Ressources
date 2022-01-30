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
    ["cone"] = {model = `prop_roadcone02a`, freeze = true},
    ["barier"] = {model = `prop_barrier_work06a`, freeze = false},
    ["schotten"] = {model = `prop_snow_sign_road_06g`, freeze = false},
    ["tent"] = {model = `prop_gazebo_03`, freeze = false},
    ["light"] = {model = `prop_worklight_03b`, freeze = true},
}

Config.Shops = {
   Shop = {
       Cams = {
           vector3(459.82534790039, -988.85571289063, 24.914850234985)
       }
   }
}


Config.Locations = {
   ["duty"] = {
	[1] = {x = -310.87, y = -137.43, z = 39.01, h = 244.654},
	--[2] = { x = 1853.224609375, y = 3689.7761230469, z = 34.26704788208},
   },    
   ["vehicle"] = {
       [1] = {x = -371.39, y = -109.83, z = 38.68, h = 48.654},
    --   [2] = {x = 471.13, y = -1024.05, z = 28.17, h = 274.5},
    --   [3] = { x = 1853.5269775391, y = 3671.7905273438, z = 33.745693206787},
   },    
   ["impound"] = {
      --[1] = {x = -320.89, y = -126.1, z = 38.97, h = 70.654},
    --  [2] = {x = -436.14, y = 5982.63, z = 31.34, h = 136.0, r = 1.0},
  }, 
   ["stash"] = {
	[1] = {x = -345.17, y = -109.18, z = 39.01, h = 66.654},
   },
   ["sheriff_stash"] = {
--[1] = { x = 1842.3568115234, y = 3690.5415039063, z = 34.267086029053},
   },
   ["boss"] = {
	[1] = { x = -304.46, y = -120.64, z = 39.01},
	--[2] = { x = 1863.2894287109, y = 3689.3461914063, z = 34.267074584961},
   },    
   ["helicopter"] = {
      -- [1] = {x = 449.168, y = -981.325, z = 43.691, h = 87.234},
      -- [2] = {x = -475.43, y = 5988.353, z = 31.716, h = 31.34},
   }, 
    ["armory"] = {
	--[1] = {x = 453.075, y = -980.124, z = 30.889},
   }, 
   ["sheriff_armory"] = {
	--[1] = { x = 1840.7115478516, y = 3691.4047851563, z = 34.267726898193},
},     
   ["trash"] = {
     --  [1] = {x = 471.01, y = -988.05, z = 24.92, h = 299.5},
   },      
   ["evidence"] = {
	  -- [1] = {x = 467.72, y = -992.02, z = 24.92},
	  -- [2] = {x = 466.42, y = -988.71, z = 24.92},
	  -- [3] = {x = 468.47, y = -988.78, z = 24.92},
	  -- [4] = { x = 1855.6506347656, y = 3699.2360839844, z = 34.267074584961},
   },  
   ["cameras"] = {
	--[1] = { x = 469.40350341797, y = -980.40557861328, z = 25.568618774414 },
	--[2] = { x = 1858.6840820313, y = 3695.3325195313, z = 34.267070770264},
},  
   ["stations"] = {
	   [1] = {label = "Taller Mecanico", coords = {x = -323.77, y = -126.58, z = 39.01}},
   },
   ["license"] = {
		--[1] = { x = 451.2658996582, y = -974.65533447266, z = 30.689546585083},
		--[2] = { x = 1861.5081787109, y = 3691.8110351563, z = 34.267074584961}
	},
	["personal"] = {
		[1] = { x = -311.73, y = -126.23, z = 39.01}
	}
}
Config.Helicopter = "polmav"
Config.HelicopterGrade = 2

Config.SecurityCameras = {
    hideradar = false,
    cameras = {
        [1] = {label = "Pacific Bank CAM#1", x = 257.45, y = 210.07, z = 109.08, r = {x = -25.0, y = 0.0, z = 28.05}, canRotate = false, isOnline = true},
        [2] = {label = "Pacific Bank CAM#2", x = 232.86, y = 221.46, z = 107.83, r = {x = -25.0, y = 0.0, z = -140.91}, canRotate = false, isOnline = true},
        [3] = {label = "Pacific Bank CAM#3", x = 252.27, y = 225.52, z = 103.99, r = {x = -35.0, y = 0.0, z = -74.87}, canRotate = false, isOnline = true},
        [4] = {label = "Limited Ltd Grove St. CAM#1", x = -53.1433, y = -1746.714, z = 31.546, r = {x = -35.0, y = 0.0, z = -168.9182}, canRotate = false, isOnline = true},
        [5] = {label = "Rob's Liqour Prosperity St. CAM#1", x = -1482.9, y = -380.463, z = 42.363, r = {x = -35.0, y = 0.0, z = 79.53281}, canRotate = false, isOnline = true},
        [6] = {label = "Rob's Liqour San Andreas Ave. CAM#1", x = -1224.874, y = -911.094, z = 14.401, r = {x = -35.0, y = 0.0, z = -6.778894}, canRotate = false, isOnline = true},
        [7] = {label = "Limited Ltd Ginger St. CAM#1", x = -718.153, y = -909.211, z = 21.49, r = {x = -35.0, y = 0.0, z = -137.1431}, canRotate = false, isOnline = true},
        [8] = {label = "24/7 Supermarkt Innocence Blvd. CAM#1", x = 23.885, y = -1342.441, z = 31.672, r = {x = -35.0, y = 0.0, z = -142.9191}, canRotate = false, isOnline = true},
        [9] = {label = "Rob's Liqour El Rancho Blvd. CAM#1", x = 1133.024, y = -978.712, z = 48.515, r = {x = -35.0, y = 0.0, z = -137.302}, canRotate = false, isOnline = true},
        [10] = {label = "Limited Ltd West Mirror Drive CAM#1", x = 1151.93, y = -320.389, z = 71.33, r = {x = -35.0, y = 0.0, z = -119.4468}, canRotate = false, isOnline = true},
        [11] = {label = "24/7 Supermarkt Clinton Ave CAM#1", x = 383.402, y = 328.915, z = 105.541, r = {x = -35.0, y = 0.0, z = 118.585}, canRotate = false, isOnline = true},
        [12] = {label = "Limited Ltd Banham Canyon Dr CAM#1", x = -1832.057, y = 789.389, z = 140.436, r = {x = -35.0, y = 0.0, z = -91.481}, canRotate = false, isOnline = true},
        [13] = {label = "Rob's Liqour Great Ocean Hwy CAM#1", x = -2966.15, y = 387.067, z = 17.393, r = {x = -35.0, y = 0.0, z = 32.92229}, canRotate = false, isOnline = true},
        [14] = {label = "24/7 Supermarkt Ineseno Road CAM#1", x = -3046.749, y = 592.491, z = 9.808, r = {x = -35.0, y = 0.0, z = -116.673}, canRotate = false, isOnline = true},
        [15] = {label = "24/7 Supermarkt Barbareno Rd. CAM#1", x = -3246.489, y = 1010.408, z = 14.705, r = {x = -35.0, y = 0.0, z = -135.2151}, canRotate = false, isOnline = true},
        [16] = {label = "24/7 Supermarkt Route 68 CAM#1", x = 539.773, y = 2664.904, z = 44.056, r = {x = -35.0, y = 0.0, z = -42.947}, canRotate = false, isOnline = true},
        [17] = {label = "Rob's Liqour Route 68 CAM#1", x = 1169.855, y = 2711.493, z = 40.432, r = {x = -35.0, y = 0.0, z = 127.17}, canRotate = false, isOnline = true},
        [18] = {label = "24/7 Supermarkt Senora Fwy CAM#1", x = 2673.579, y = 3281.265, z = 57.541, r = {x = -35.0, y = 0.0, z = -80.242}, canRotate = false, isOnline = true},
        [19] = {label = "24/7 Supermarkt Alhambra Dr. CAM#1", x = 1966.24, y = 3749.545, z = 34.143, r = {x = -35.0, y = 0.0, z = 163.065}, canRotate = false, isOnline = true},
        [20] = {label = "24/7 Supermarkt Senora Fwy CAM#2", x = 1729.522, y = 6419.87, z = 37.262, r = {x = -35.0, y = 0.0, z = -160.089}, canRotate = false, isOnline = true},
        [21] = {label = "Fleeca Bank Hawick Ave CAM#1", x = 309.341, y = -281.439, z = 55.88, r = {x = -35.0, y = 0.0, z = -146.1595}, canRotate = false, isOnline = true},
        [22] = {label = "Fleeca Bank Legion Square CAM#1", x = 144.871, y = -1043.044, z = 31.017, r = {x = -35.0, y = 0.0, z = -143.9796}, canRotate = false, isOnline = true},
        [23] = {label = "Fleeca Bank Hawick Ave CAM#2", x = -355.7643, y = -52.506, z = 50.746, r = {x = -35.0, y = 0.0, z = -143.8711}, canRotate = false, isOnline = true},
        [24] = {label = "Fleeca Bank Del Perro Blvd CAM#1", x = -1214.226, y = -335.86, z = 39.515, r = {x = -35.0, y = 0.0, z = -97.862}, canRotate = false, isOnline = true},
        [25] = {label = "Fleeca Bank Great Ocean Hwy CAM#1", x = -2958.885, y = 478.983, z = 17.406, r = {x = -35.0, y = 0.0, z = -34.69595}, canRotate = false, isOnline = true},
        [26] = {label = "Paleto Bank CAM#1", x = -102.939, y = 6467.668, z = 33.424, r = {x = -35.0, y = 0.0, z = 24.66}, canRotate = false, isOnline = true},
        [27] = {label = "Del Vecchio Liquor Paleto Bay", x = -163.75, y = 6323.45, z = 33.424, r = {x = -35.0, y = 0.0, z = 260.00}, canRotate = false, isOnline = true},
        [28] = {label = "Don's Country Store Paleto Bay CAM#1", x = 166.42, y = 6634.4, z = 33.69, r = {x = -35.0, y = 0.0, z = 32.00}, canRotate = false, isOnline = true},
        [29] = {label = "Don's Country Store Paleto Bay CAM#2", x = 163.74, y = 6644.34, z = 33.69, r = {x = -35.0, y = 0.0, z = 168.00}, canRotate = false, isOnline = true},
        [30] = {label = "Don's Country Store Paleto Bay CAM#3", x = 169.54, y = 6640.89, z = 33.69, r = {x = -35.0, y = 0.0, z = 5.78}, canRotate = false, isOnline = true},
        [31] = {label = "Vangelico Juwelier CAM#1", x = -627.54, y = -239.74, z = 40.33, r = {x = -35.0, y = 0.0, z = 5.78}, canRotate = true, isOnline = true},
        [32] = {label = "Vangelico Juwelier CAM#2", x = -627.51, y = -229.51, z = 40.24, r = {x = -35.0, y = 0.0, z = -95.78}, canRotate = true, isOnline = true},
        [33] = {label = "Vangelico Juwelier CAM#3", x = -620.3, y = -224.31, z = 40.23, r = {x = -35.0, y = 0.0, z = 165.78}, canRotate = true, isOnline = true},
        [34] = {label = "Vangelico Juwelier CAM#4", x = -622.57, y = -236.3, z = 40.31, r = {x = -35.0, y = 0.0, z = 5.78}, canRotate = true, isOnline = true},
        [35] = {label = "Ballas CAM#1", x = 125.28897094727, y = -1924.2360839844, z = 25.730609893799, r = {x = -35.0, y = 1.0, z = 165.78}, canRotate = true, isOnline = true},
        [36] = {label = "Ballas CAM#2", x = 61.664333343506, y = -1939.1297607422, z = 26.996032714844, r = {x = -35.0, y = 1.0, z = 8.78}, canRotate = true, isOnline = true},
        [37] = {label = "Vagos CAM#1", x = 369.89205932617, y = -2062.7670898438, z = 30.394943237305, r = {x = -35.0, y = 0.0, z = 8.78}, canRotate = true, isOnline = true},
        [38] = {label = "Vagos CAM#2", x = 326.43893432617, y = -2056.1362304688, z = 30.394943237305, r = {x = -35.0, y = 0.0, z = 8.78}, canRotate = true, isOnline = true},
        [39] = {label = "BlackMarket CAM#1", x = -806.22723388672, y = 184.38835144043, z = 74.003074645996, r = {x = -25.0, y = 0.0, z = 115.78}, canRotate = true, isOnline = true},
        [40] = {label = "BlackMarket CAM#2", x = -811.16833496094, y = 172.12225341797, z = 85.94660949707, r = {x = -35.0, y = 0.0, z = 8.78}, canRotate = true, isOnline = true},
        [41] = {label = "BlackMarket CAM#3", x = -807.59204101563, y = 152.53588867188, z = 77.947578430176, r = {x = -35.0, y = 0.0, z = 8.78}, canRotate = true, isOnline = true},
    },
}

Config.Vehicles = {
	{ name = 'flatbed', label = "Grua Grande", grade = 1},
	{ name = 'TowTruck2', label = "Grua Mediana", grade = 4},
	{ name = 'Docktug', label = "Grua Camiones", grade = 1},
    { name = 'Sadler', label = "Coche", grade = 1},
   -- { name = 'police', label = "Yasam Bike", grade= 2},
	--{ name = 'police', label = "pol10", grade = 5},
   -- { name = 'police', label = "police2", grade = 6},
   -- { name = 'police', label = "Police Range Rover", grade = 0},
}