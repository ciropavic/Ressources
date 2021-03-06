Config = {}
Config.Locale = 'es' -- English, German or Spanish - (en/de/es)

Config.useMythic = false -- change this if you want to use mythic_notify or not
Config.progBar = true -- change this if you want to use Progress Bar or not
Config.useCD = true -- change this if you want to have a global cooldown or not
Config.cdTime = 1200000 -- global cooldown in ms. Set to 20 minutes by default - (https://www.timecalculator.net/minutes-to-milliseconds)
Config.doorHeading = 330.38 -- change this to the proper heading to look at the door you start the runs with
Config.price = 500 -- amount you have to pay to start a run 
Config.cokeTime = 60000 -- time in ms the effects of coke will last for
Config.pickupTime = 5000 -- time it takes to pick up the delivery 
Config.randBrick = math.random(16,30) -- change the numbers to how much coke you want players to receive after breaking down bricks
Config.takeBrick = 1 -- amount of brick you want to take after processing
Config.getCoords = false -- gets coords with /mycoords
Config.pilotPed = "s_m_m_pilot_02" -- change this to have a different ped as the planes pilot - (lsit of peds: https://wiki.rage.mp/index.php?title=Peds)
Config.landPlane = false -- change this if you want the plane to fly and land or if it should spawn on the ground

Config.locations = {
	[1] = { 
		fuel = {x = 2112.94, y = 4778.69, z = 40.92}, -- location of the jerry can/waypoint
		landingLoc = {x = 2120.55, y = 4810.15, z = 41.2}, -- don't mess with this unless you know what you're doing
		plane = {x = 489.37, y = 1948.55, z = 0.3, h = 263.69}, -- don't mess with this unless you know what you're doing
		runwayStart = {x = 441.63, y = 1937.28, z = 0.36}, -- don't mess with this unless you know what you're doing
		runwayEnd = {x = 489.37, y = 1948.55, z = 0.3}, -- don't mess with this unless you know what you're doing
		fuselage = {x = 2133.49, y = 4783.78, z = 41.9}, -- location of the 3D text to fuel the plane
		stationary = {x = 2133.49, y = 4783.78, z = 41.9, h = 16.29}, -- location of the plane if Config.landPlane is false 
		delivery = {x = 804.73, y = 7540.75, z = 0.26}, -- delivery location
		hangar = {x = 2134.474, y = 4780.939, z = 40.97027}, -- end location
		parking = {x = 489.37, y = 1948.55, z = 0.3}, -- don't mess with this unless you know what you're doing													
	},

}




