Config = {}

local Prefix = "[DIAMANTE RP] "
Config.DiscordServerID = 621761402385989652 -- Discord Server ID
Config.DiscordBotToken = "48FNqCu5_MHoS9J8ijn4pAkWegiEsOR6" -- Discord Bot Token. You can create one on https://discord.com/developers/applications
Config.ApiLink = "3fae1602ddc222a68912cf735e2acbbb6c69347979644cf5c30a4e83bcff14e4" -- API Stuff
Config.ApiKey = "3fae1602ddc222a68912cf735e2acbbb6c69347979644cf5c30a4e83bcff14e4"-- API Stuff
Config.maxServerSlots = 128

Config.Roles = {
	Example = {
		roleID = "621764430488797205",
		points = 50,
		name = "Fundador"
	},

	Example2 = {
		roleID = "780108629390393365",
		points = 20,
		name = "Donator"
	},
}

Config.Colors = {
	"accent",
	"good",
	"warning",
	"attention",
}

Config.Verifiying = Prefix .. "Espere, descargando contenido de la base de datos de DIAMANTE RP."
Config.VerifiyingLauncher = Prefix .. "Espere, verificando que ingresó a través del lanzador."
Config.VerifiyingDiscord = Prefix .. "Espere, verificando su ID de Discord."
Config.VerifiyingSteam = Prefix .. "Espere, verificando su Steam."
Config.VerifiyingQueue = Prefix .. "Espere, agregándole a la cola."

Config.NotWhitelisted = Prefix .. "Lo siento, no te encontré en nuestra base de datos."
Config.NoDiscord = Prefix .. "Asegúrate de que tu Discord esté abierta."
Config.NoSteam = Prefix .. "Asegúrate de que tu Steam esté abierto."
Config.NoLauncher = Prefix .. "Solo se puede acceder al servidor a través de su lanzador."
Config.Blacklisted = Prefix .. "Estás en la lista negra del servidor, vete a la mierda por favor."

Config.Welcome = Prefix .. "🎄🎊 Bienvenido 🎊🎄"
Config.Error = Prefix .. "Error. Vuelve a intentarlo más tarde.."
Config.HandshakingWith = Prefix .. "Disfruta en DIAMANTE RP."
