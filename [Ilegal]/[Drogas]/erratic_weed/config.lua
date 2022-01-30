Config = {}
Config.Locale = 'es' -- English, German or Spanish - (en/de/es)

Config.useMythic = true -- change this if you want to use mythic_notify or not
Config.progBar = true -- change this if you want to use Progress Bar or not
Config.useCD = true -- change this if you want to have a global cooldown or not
Config.cdTime = 1200000 -- global cooldown in ms. Set to 20 minutes by default - (https://www.timecalculator.net/minutes-to-milliseconds)
Config.doorHeading = 330.38 -- change this to the proper heading to look at the door you start the runs with
Config.price = 500 -- amount you have to pay to start a run 
Config.weedTime = 60000 -- time in ms the effects of weed will last for
Config.pickupTime = 5000 -- time it takes to pick up the delivery 
Config.randBrick = math.random(16,30) -- change the numbers to how much weed you want players to receive after breaking down bricks
Config.takeBrick = 2 -- amount of brick you want to take after processing
Config.getCoords = false -- gets coords with /mycoords
Config.pilotPed = "s_m_m_pilot_02" -- change this to have a different ped as the planes pilot - (lsit of peds: https://wiki.rage.mp/index.php?title=Peds)
Config.landPlane = false -- cambia esto si quieres que el avión vuele y aterrice o si debería aparecer en el suelo

Config.locations = {
	[1] = { 
		fuel = {x = 1587.5, y = 399.85, z = 7.49}, -- location of the jerry can/waypoint
		landingLoc = {x = 1584.75, y = 414.88, z = 6.35}, -- don't mess with this unless you know what you're doing
		plane = {x = 1582.7, y = 414.43, z = 6.29, h = 302.69}, -- don't mess with this unless you know what you're doing
		runwayStart = {x = 1884.35, y = 620.77, z = 2.27}, -- don't mess with this unless you know what you're doing
		runwayEnd = {x = 1582.58, y = 411.91, z = 6.43}, -- don't mess with this unless you know what you're doing
		fuselage = {x = 1585.47, y = 414.77, z = 6.35}, -- location of the 3D text to fuel the plane
		stationary = {x = 1582.9, y = 416.19, z = 6.31, h = 305.29}, -- ubicación del avión si Config.landPlane es falso 
		delivery = {x = -137.56, y = 2725.91, z = 0.3}, -- delivery location
		hangar = {x = -302.39, y = 155.87, z = -0.0}, -- end location
		parking = {x = 1584.51, y = 414.7, z = 6.35}, -- don't mess with this unless you know what you're doing															
	},

}




