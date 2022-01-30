Config = {}

Config.Locale = 'en'

Config.Delays = {
	WeedProcessing = 1000 * 10,
	MethProcessing = 1000 * 10,
	CokeProcessing = 1000 * 10,
	lsdProcessing = 1000 * 10,
	HeroinProcessing = 1000 * 10,
	thionylchlorideProcessing = 1000 * 10,
}

Config.DrugDealerItems = {
	heroin = 54,
	marijuana = 78,
	meth = 103,
	coke = 120,
	lsd = 200,
	joint2g = 25,
	meth1g = 50,
	coke1g = 75,
	weedbrick = 2000,
	methbrick = 4000,
	cokebrick = 6000,
	
}

Config.ChemicalsConvertionItems = {
	hydrochloric_acid = 0,
	sodium_hydroxide = 0,
	sulfuric_acid = 0,
	lsa = 0,
}

Config.ChemicalsLicenseEnabled = false --Will Enable or Disable the need for a Chemicals License.
Config.MoneyWashLicenseEnabled = false --Will Enable or Disable the need for a MoneyWash License.

Config.LicensePrices = {
	weed_processing = {label = _U('license_weed'), price = 15000}
}

Config.Licenses = {
	chemicalslisence = 100000,
}

Config.GiveBlack = true -- give black money? if disabled it'll give regular cash.

Config.CircleZones = {
	--Weed
	WeedField = {coords = vector3(2224.64, 5577.03, 53.85), name = _U('blip_WeedFarm'), color = 25, sprite = 496, radius = 100.0},
	WeedProcessing = {coords = vector3(381.85, -816.57, 29.3), name = _U('blip_weedprocessing'), color = 25, sprite = 496, radius = 100.0},
	
	--meth
	MethProcessing = {coords = vector3(1390.33, 3608.5, 38.94), name = _U('blip_methprocessing'), color = 26, sprite = 51, radius = 0.0},
	HydrochloricAcidFarm = {coords = vector3(2724.12, 1583.03, 24.5), name = _U('blip_HydrochloricAcidFarm'), color = 26, sprite = 361, radius = 7.0},
	SulfuricAcidFarm = {coords = vector3(3333.34, 5160.22, 18.31), name = _U('blip_SulfuricAcidFarm'), color = 26, sprite = 361, radius = 5.0},
	SodiumHydroxideFarm = {coords = vector3(3617.04, 3738.73, 28.69), name = _U('blip_SodiumHydroxideFarm'), color = 26, sprite = 361, radius = 7.0},
	
	--Chemicals
	ChemicalsField = {coords = vector3(817.46, -3192.84, 5.9), name = _U('blip_ChemicalsFarm'), color = 3, sprite = 499, radius = 0.0},
	ChemicalsConvertionMenu = {coords = vector3(3718.8, 4533.45, 21.67), name = _U('blip_ChemicalsProcessing'), color = 3, sprite = 499, radius = 0.0},
	
	--Coke
	CokeField = {coords = vector3(-310.43, 2496.34, 76.60), name = _U('blip_CokeFarm'), color = 1, sprite = 501, radius = 20.0},
	CokeProcessing = {coords = vector3(1979.05, -2612.23, 3.55), name = _U('blip_Cokeprocessing'),color = 1, sprite = 501, radius = 20.0},
	
	--LSD
	lsdProcessing = {coords = vector3(91.26, 3749.31, 40.77), name = _U('blip_lsdprocessing'),color = 46, sprite = 51, radius = 20.0},
	thionylchlorideProcessing = {coords = vector3(1903.98, 4922.70, 48.16), name = _U('blip_lsdprocessing'),color = 46, sprite = 51, radius = 20.0},
	
	--Heroin
	HeroinField = {coords = vector3(16.34, 6875.94, 12.64), name = _U('blip_heroinfield'), color = 56, sprite = 285, radius = 20},
	HeroinProcessing = {coords = vector3(2432.18, 4970.08, 42.35), name = _U('blip_heroinprocessing'), color = 56, sprite = 285, radius = 100.0},

	--DrugDealer
	DrugDealer = {coords = vector3(-1172.02, -1571.98, 4.66), name = _U('blip_drugdealer'), color = 26, sprite = 378, radius = 25.0},
	
	--License
	--LicenseShop = {coords = vector3(707.17, -962.5, 30.4), name = _U('blip_lsdprocessing'),color = 25, sprite = 496, radius = 20.0},
	
	--MoneyWash
	---MoneyWash = {coords = vector3(0.0, 0.0, 0.0), name = _U('blip_drugdealer'), color = 6, sprite = 378, radius = 25.0},
}
