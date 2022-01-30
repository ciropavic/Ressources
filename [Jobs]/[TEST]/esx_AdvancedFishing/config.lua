Config = {}
	---------------------------------------------------------------
	--=====How long should it take for player to catch a fish=======--
	---------------------------------------------------------------
	--Time in miliseconds
	Config.FishTime = {a = 20000, b = 44000}
	
	--------------------------------------------------------
	--=====Prices of the items players can sell==========--
	--------------------------------------------------------
	--First amount minimum price second maximum amount (the amount player will get is random between those two numbers)
	Config.FishPrice = {a = 2000, b = 3000} --Will get clean money THIS PRICE IS FOR EVERY 5 FISH ITEMS (5 kg)
	Config.TurtlePrice = {a = 12000, b = 18000} --Will get dirty money
	Config.SharkPrice = {a = 40000, b = 60000} --Will get dirty money

	--------------------------------------------------------
	--=====Locations where players can sell stuff========--
	--------------------------------------------------------

	Config.SellFish = {x = 1248.63, y = 492.49, z = 20.47} --Place where players can sell their fish
	Config.SellTurtle = {x = 1258.98, y = 2485.93, z = 15.67} --Place where players can sell their turtles 
	Config.SellShark = {x = -1097.79 , y = 718.1, z = 3.45} --Place where players can sell their sharks

	--------------------------------------------------------
	--=====Locations where players can rent boats========--
	--------------------------------------------------------
Config.MarkerZones = { 
	
    {x = -307.3   ,y = 301.15 ,z = 0.48, xs = -312.08  , ys = 300.32, zs = 1.0 },
	

}