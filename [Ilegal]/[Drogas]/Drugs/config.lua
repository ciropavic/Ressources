--------------------------------
------- Created by Hamza -------
-------------------------------- 

Config = {}

-- // Set max cap on how many drugs a player can sell between a server-restart, remember this cannot be 0, instead set to 9999999999 for unlimited // --
Config.maxCap = 150

-- // MISSION REWARD // --
Config.Reward = {
	["meth"] = math.random(1,3),
	["coke"] = math.random(1,3),
	["weed"] = math.random(4,10),
}

-- // MISSION LOCATIONS // --
Config.MissionPosition = 
{
	{
		Location = vector3(621.52,2222.86,11.21), -- https://gyazo.com/98c3e756a054c647d2e1e42e417fe8a6
		InUse = false,
		GoonSpawns = {
			vector3(621.93,2230.5,11.05),
			vector3(609.2,2219.89,11.27),
			vector3(593.68,2234.01,12.0)
		}
	},
	{
		Location = vector3(180.71,474.1,14.76), -- https://gyazo.com/bed93c619d979177ceec51ce7de78b60
		InUse = false,
		GoonSpawns = {
			vector3(180.64,476.72,14.76),
			vector3(178.3,466.91,14.76),
			vector3(152.39,471.76,14.76),
			vector3(165.67,482.55,17.36)
		}
	}--,
	-- add more missions here, remember "," after last ")"
}
