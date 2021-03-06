Config = {}

Config.Locale = 'en'
Config.DrawDistance = 100.0 -- Change the distance before you can see the marker. Less is better performance.
Config.EnableBlips = false -- Set to false to disable blips.
Config.MarkerType = 1
Config.MarkerColor = { r = 255, g = 0, b = 0 } -- Change the marker color.

-- Set the time (in minutes) during the player is markered
Config.Timer = 1

Config.CooldownMinutes = 2

Config.CallCops = true -- Set to true if you want cops to be alerted when chopping is in progress
Config.CallCopsPercent = 2 -- (min1) if 1 then cops will be called every time=100%, 2=50%, 3=33%, 4=25%, 5=20%.
Config.CopsRequired = 2
Config.ShowCopsMisbehave = true --show notification when cops steal too

Config.NPCEnable = true -- Set to false to disable NPC Ped at shop location.
Config.NPCHash = 68070371 --Hash of the npc ped. Change only if you know what you are doing.
Config.NPCShop = { x = -1591.41, y = 795.11, z = 5.92, h = 187.561 } -- Location of the shop For the npc.

Config.RemovePart = 4500 -- 4s

Config.GiveBlack = false --- Give dirty cash
Config.AnyoneCanChop = true -- Pesonal Cars chop ### CAUTION WILL DELETE VEHICLES FROM DATABASE

Config.Zones = {
  Chopshop = {coords = vector3( -1582.98, 792.23, 4.92 ), name = _U('map_blip'), color = 49, sprite = 225, radius = 350.0, Pos = { x = -1582.98,y = 792.23,z = 5.92 }, Size = { x = 5.0, y = 5.0, z = 0.5 }, },
  StanleyShop = {coords = vector3( -1591.41, 795.11, 5.92 ), name = _U('map_blip_shop'), color = 50, sprite = 120, radius = 15.0, Pos = { x = -1591.41, y = 795.11, z = 5.92 }, Size = { x = 3.0, y = 1.0, z = 1.0 }, },

}

Config.Items = {
  -- Item and Price $
  "chatarra"
}


Config.ItemsPrices = {
  -- Item and Price $
  chatarra = 10
}
-- Jobs in this table are considered as cops
Config.WhitelistedCops = {
  'police'
}
