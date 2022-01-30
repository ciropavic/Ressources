Config = {

    Locations = {
        [1] = {
            ["shelfs"] = {
                {["x"] = 134.84, ["y"] = -1064.53, ["z"] = 29.25, ["value"] = "checkout"},
                {["x"] = 133.94, ["y"] = -1066.37, ["z"] = 29.25, ["value"] = "checkout"},
                {["x"] = 132.91, ["y"] = -1068.64, ["z"] = 29.26, ["value"] = "checkout"},
                {["x"] = 131.97, ["y"] = -1070.78, ["z"] = 29.26, ["value"] = "checkout"},
                {["x"] = 131.05, ["y"] = -1072.63, ["z"] = 29.27, ["value"] = "checkout"},
                {["x"] = 128.48, ["y"] = -1074.15, ["z"] = 29.27, ["value"] = "bebida"},
                {["x"] = 127.11, ["y"] = -1074.24, ["z"] = 29.27, ["value"] = "complemento"},
                {["x"] = 125.55, ["y"] = -1074.3, ["z"] = 29.27, ["value"] = "menu"},
                {["x"] = 124.03, ["y"] = -1074.4, ["z"] = 29.28, ["value"] = "postre"},
            },
            ["blip"] = {
                ["x"] = 29.41, ["y"] = -1345.01, ["z"] = 29.5
            },
            ["cashier"] = {
                ["x"] = 136.01, ["y"] = -1065.35, ["z"] = 28.48, ["h"] = 65.76, --Ped en el Mostrador
                ["hash"] = "u_m_y_burgerdrug_01"
            },
        },
        [2] = {
            ["shelfs"] = {
            },
            ["cashier"] = {
                ["x"] = 135.12, ["y"] = -1067.38, ["z"] = 28.48, ["h"] = 64.48, --Ped en el Mostrador
                ["hash"] = "u_m_y_burgerdrug_01"
            },
        },
        [3] = {
            ["shelfs"] = {
            },
            ["cashier"] = {
                ["x"] = 134.09, ["y"] = -1069.64, ["z"] = 28.48, ["h"] = 66.12, --Ped en el Mostrador
                ["hash"] = "u_m_y_burgerdrug_01"
            },
        },
        [4] = {
            ["shelfs"] = {
            },
            ["cashier"] = {
                ["x"] = 133.2, ["y"] = -1071.63, ["z"] = 28.48, ["h"] = 66.62, --Ped en el Mostrador
                ["hash"] = "u_m_y_burgerdrug_01"
            },
        },
        [5] = {
            ["shelfs"] = {
            },
            ["cashier"] = {
                ["x"] = 132.37, ["y"] = -1073.54, ["z"] = 28.48, ["h"] = 60.96, --Ped en el Mostrador
                ["hash"] = "u_m_y_burgerdrug_01"
            },
        },
    },

    --[[
    U can specify the hash of the cashier like this:
        ["cashier"] = {
            ["x"] = 0.0, ["y"] = 0.0, ["z"] = 0.0, ["h"] = 0.0,     (h = heading)
            ["hash"] = "mp_m_freemode_01"
        },
        or ["hash"] = 1885233650
    ]]--
    
    Locales = {
        ["checkout"] = "Caja Registradora",
        ["postre"] = "Postres",
        ["bebida"] = "Bebidas",
        ["complemento"] = "Complementos",
        ["menu"] = "McMenús",
    },

    Items = {
        ["bebida"] = {
            {label = "Botella de Agua", item = "water", price = 10},
            {label = "CocaCola", item = "colacola", price = 20},
            {label = "Fanta", item = "limonade", price = 20},
            {label = "Nestea", item = "icetea", price = 20},
            {label = "Red Bull", item = "energy", price = 30},
        },
        ["complemento"] = {
            {label = "Alitas de Pollo", item = "alitas", price = 40},
            {label = "Nuggets de Pollo", item = "nuggets", price = 40},
            {label = "Patatas Fritas", item = "patatas", price = 30},
            {label = "Hamburguesa Sola", item = "burguer", price = 20},
        },
        ["menu"] = {
            {label = "McMenú", item = "mcmenu", price = 45},
            {label = "Menú Ensalada", item = "mcensalada", price = 35},
        },
        ["postre"] = {
            {label = "McFlurry", item = "mcflurry", price = 40},
            {label = "Cono De Helado", item = "conohelado", price = 40},

        },
    },
}