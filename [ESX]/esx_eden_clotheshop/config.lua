Config = {}
Config.Locale = 'es'

Config.Price = 250

Config.DrawDistance = 100.0
Config.MarkerSize   = {x = 0.5, y = 0.5, z = 1.0}
Config.MarkerColor  = {r = 102, g = 102, b = 204}
Config.MarkerType   = 2

Config.Zones = {}

Config.Shops = {
  {x=957.65,    y=396.08, z=15.85},
  {x=78.92,    y=173.87, z=14.86},
  {x=90.34,    y=1642.33, z=14.76},
  {x=-212.15,    y=2202.84, z=25.63},
  {x=-1265.88,    y=2096.93, z=23.33},
  {x=-1558.09,    y=1029.48, z=19.21},
  {x=-1600.17,    y=1040.36, z=12.46},
  {x=980.83,    y=1417.58, z=22.23},
}

for i=1, #Config.Shops, 1 do

	Config.Zones['Shop_' .. i] = {
	 	Pos   = Config.Shops[i],
	 	Size  = Config.MarkerSize,
	 	Color = Config.MarkerColor,
	 	Type  = Config.MarkerType
  }

end
