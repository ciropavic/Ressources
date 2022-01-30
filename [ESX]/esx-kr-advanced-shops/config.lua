Config                            = {}
Config.DrawDistance               = 20.0
Config.Locale = 'en'
Config.DeliveryTime = 5000 -- IN SECOUNDS DEFAULT (18000) IS 5 HOURS / 300 MINUTES
Config.TimeBetweenRobberies = 0
Config.CutOnRobbery = 10 -- IN PERCENTAGE FROM THE TARGET SHOP
Config.RequiredPolices = 2 -- For the robbery
Config.SellValue = 2 -- This is the shops value divided by 2
Config.ChangeNamePrice = 5000 -- In $ - how much you can change the shops name for

-- CONFIG ITEMS, DON'T FORGET TO ADD CORRECT NUMBER IN THE BRACKETS
Config.Items = {
    [1] = {label = "Agua",       item = "water",        price = 5},
    [2] = {label = "Pan",      item = "bread",       price = 5},
    [3] = {label = "Cerveza",      item = "beer",       price = 10},
    [4] = {label = "Champagne",      item = "champagne",       price = 25},
    [5] = {label = "Patatas Fritas",      item = "chips",       price = 5},
    [6] = {label = "Cigarro",      item = "cigarett",       price = 5},
    [7] = {label = "Cocacola",      item = "cocacola",       price = 10},
    [8] = {label = "Cafe",      item = "coffe",       price = 5},
    [9] = {label = "Gintonic",      item = "gintonic",       price = 25},
    [10] = {label = "Tequila",      item = "tequila",       price = 25},
    [11] = {label = "Mechero",      item = "lighter",       price = 5},
    --[12] = {label = "Bread",      item = "bread",       price = 5},
    --[13] = {label = "Bread",      item = "bread",       price = 5},
   -- [14] = {label = "Bread",      item = "bread",       price = 5},
    --[15] = {label = "Bread",      item = "bread",       price = 5},
    --[16] = {label = "Bread",      item = "bread",       price = 5},
   -- [17] = {label = "Bread",      item = "bread",       price = 5},
   -- [18] = {label = "Bread",      item = "bread",       price = 5},
   -- [19] = {label = "Bread",      item = "bread",       price = 5},
   -- [20] = {label = "Bread",      item = "bread",       price = 5},
   -- [2] = {label = "Bread",      item = "bread",       price = 5},
   -- [2] = {label = "Bread",      item = "bread",       price = 5},
   -- [2] = {label = "Bread",      item = "bread",       price = 5},
  --  [2] = {label = "Bread",      item = "bread",       price = 5},
   -- [2] = {label = "Bread",      item = "bread",       price = 5},

}

Config.Images = {
  [1] = {item = "water",   src = "img/water.png"},
  [2] = {item = "bread",   src = "img/bread.png"},
  [3] = {item = "beer",   src = "img/beer.png"},
  [4] = {item = "champagne",   src = "img/champagne.png"},
  [5] = {item = "chips",   src = "img/bolchips.png"},
  [6] = {item = "cigarett",   src = "img/cigarett.png"},
  [7] = {item = "cocacola",   src = "img/clcola.png"},
  [8] = {item = "coffe",   src = "img/coffe.png"},
  [9] = {item = "gintonic",   src = "img/gintonic.png"},
  [10] = {item = "tequila",   src = "img/tequila.png"},
  [11] = {item = "lighter",   src = "img/lighter.png"},
  --[12] = {item = "bread",   src = "img/burger.png"},
}

Config.Zones = {

  ShopCenter = {
    Pos   = {x = 162.81,   y = 156.34,  z = 8.59, number = 'center'},
  },
  Shop1 = {
    Pos   = {x = 452.20,   y = -806.03,  z = 27.65, number = 1},
  },
  Shop2 = {
    Pos = {x = 460.96,   y = -798.39,  z = 27.33, number = 2},
  },
  Shop3 = {
    Pos = {x = 460.44,   y = -790.87,  z = 27.35, number = 3},
  },
  Shop4 = {
    Pos = {x = 453.62,   y = -787.29,  z = 27.35, number = 4},
  },
  Shop5 = {
    Pos = {x = 459.19,   y = -778.25,  z = 27.35, number = 5},
  },
  Shop6 = {
    Pos = {x = 450.28,   y = -759.53,  z = 27.35, number = 6},
  },
  Shop7 = {
    Pos = {x = 450.70,   y = -752.91,  z = 27.35, number = 7},
  },
  Shop8 = {
    Pos = {x = 460.82,   y = -740.52,  z = 27.35, number = 8},
  },
  Shop9 = {
    Pos = {x = 453.90,   y = -735.86,  z = 27.35, number = 9},
  },
  Shop10 = {
    Pos = {x = 453.63,   y = -713.13,  z = 27.35, number = 10},
  },
  Shop11 = {
    Pos = {x = 459.14,   y = -701.44,  z = 27.37, number = 11},
  },
  Shop12 = {
    Pos = {x = 0.0,   y = 0.0,  z = 0.0, number = 12},
  },
  Shop13 = {
    Pos = {x = 0.0,   y = 0.0,  z = 0.0, number = 13},
  },
  Shop14 = {
    Pos = {x = 0.0,   y = 0.0,  z = 0.0, number = 14},
  },
  Shop15 = {
    Pos = {x = 0.0,   y = 0.0,  z = 0.0, number = 15},
  },
  Shop16 = {
    Pos = {x = 0.0,   y = 0.0,  z = 0.0, number = 16},
  },
  Shop17 = {
    Pos = {x = 0.0,   y = 0.0,  z = 0.0, number = 17},
  },
  Shop18 = {
    Pos = {x = 0.0,   y = 0.0,  z = 0.0, number = 18},
  },
  Shop19 = {
    Pos = {x = 0.0,   y = 0.0,  z = 0.0, number = 19},
  },
  Shop20 = {
    Pos = {x = 0.0,   y = 0.0,  z = 0.0, number = 20}
  },
  Robbery1 = {
    Pos   = {x = 98.25,   y = -1300.38,  z = 28.26, number = 101, red = true},
  },
  Robbery2 = {
    Pos   = {x = -1482.84,   y = -376.53,  z = 39.16, number = 102, red = true},
  },
  Robbery3 = {
    Pos   = {x = 0.0,   y = 0.0,  z = 0.0, number = 103, red = true},
  },
  Robbery4 = {
    Pos   = {x = 0.0,   y = 0.0,  z = 0.0, number = 104, red = true},
  },
  Robbery5 = {
    Pos   = {x = 0.0,   y = 0.0,  z = 0.0, number = 105, red = true},
  },
  Robbery6 = {
    Pos   = {x = 0.0,   y = 0.0,  z = 0.0, number = 106, red = true},
  },
  Robbery7 = {
    Pos   = {x = 0.0,   y = 0.0,  z = 0.0, number = 107, red = true},
  },
  Robbery8 = {
    Pos   = {x = 0.0,   y = 0.0,  z = 0.0, number = 108, red = true},
  },
  Robbery9 = {
    Pos   = {x = 0.0,   y = 0.0,  z = 0.0, number = 109, red = true},
  },
  Robbery10 = {
    Pos   = {x = 0.0,   y = 0.0,  z = 0.0, number = 110, red = true},
  },
  Robbery11 = {
    Pos   = {x = 0.0,   y = 0.0,  z = 0.0, number = 111, red = true},
  },
  Robbery12 = {
    Pos   = {x = 0.0,   y = 0.0,  z = 0.0, number = 112, red = true},
  },
  Robbery13 = {
    Pos   = {x = 0.0,   y = 0.0,  z = 0.0, number = 113, red = true},
  },
  Robbery14 = {
    Pos   = {x = 0.0,   y = 0.0,  z = 0.0, number = 114, red = true},
  },
  Robbery15 = {
    Pos   = {x = 0.0,   y = 0.0,  z = 0.0, number = 115, red = true},
  },
  Robbery16 = {
    Pos   = {x = 0.0,   y = 0.0,  z = 0.0, number = 116, red = true},
  },
  Robbery17 = {
    Pos   = {x = 0.0,   y = 0.0,  z = 0.0, number = 117, red = true},
  },
  Robbery18= {
    Pos   = {x = 0.0,   y = 0.0,  z = 0.0, number = 118, red = true},
  },
  Robbery19 = {
    Pos   = {x = 0.0,   y = 0.0,  z = 0.0, number = 119, red = true},
  },
  Robbery20= {
    Pos   = {x = 0.0,   y = 0.0,  z = 0.0, number = 120, red = true},
  },
}