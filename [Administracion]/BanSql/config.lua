Config                   = {}

--GENERAL
Config.Lang              = 'en'    --Set lang (fr-en)
Config.Permission        = "admin" --Permission need to use FiveM-BanSql commands (mod-admin-superadmin)
Config.ForceSteam        = true    --Set to false if you not use steam auth
Config.MultiServerSync   = false   --This will check if a ban is add in the sql all 30 second, use it only if you have more then 1 server (true-false)


--WEBHOOK
Config.EnableDiscordLink = false --Turn this true if you want link the log to a discord (true-false)
Config.webhookban        = "https://discordapp.com/api/webhooks/741682060745506929/AwypIKxiGkUayIKpuk1TbILBSkzSDs1QlgAVehAAcgOjpw224DLlROuFvmZ0Zw73mxU0"
Config.webhookunban      = "https://discordapp.com/api/webhooks/741682060745506929/AwypIKxiGkUayIKpuk1TbILBSkzSDs1QlgAVehAAcgOjpw224DLlROuFvmZ0Zw73mxU0"


--LANGUAGE
Config.TextFr = {
	start         = "La BanList y el historial se han cargado correctamente",
	starterror    = "ERROR: No se ha vuelto a cargar la BanList o el historial.",
	banlistloaded = "La BanList se ha cargado correctamente.",
	historyloaded = "BanListHistory se ha cargado correctamente.",
	loaderror     = "ERROR: No se cargó la BanList.",
	cmdban        = "/sqlban (ID) (Duración en días) (Razón)",
	cmdbanoff     = "/sqlbanoffline (Permid) (Duración en días) (Razón)",
	cmdhistory    = "/sqlbanhistory (nombre de Steam) ou / sqlbanhistory 1,2,2,4......",
	noreason      = "Razón desconocida",
	during        = " durante : ",
	noresult      = "No hay tantos resultados !",
	isban         = " fue prohibido",
	isunban       = " fue desbaneado",
	invalidsteam  =  "Deberías abrir Steam",
	invalidid     = "ID de jugador incorrecta",
	invalidname   = "El nombre no es valido",
	invalidtime   = "Duración incorrecta de la prohibición",
	alreadyban    = " ya estaba prohibido para : ",
	yourban       = "Fuiste prohibido por : ",
	yourpermban   = "Fuiste prohibido permanentemente por : ",
	youban        = "Tú prohibiste : ",
	forr          = " dias. Para : ",
	permban       = " permanentemente para : ",
	timeleft      = ". Queda : ",
	toomanyresult = "Demasiados resultados, asegúrese de ser más específico.",
	day           = " Dias ",
	hour          = " Horas ",
	minute        = " Minutos ",
	by            = "por",
	ban           = "Prohibir a un jugador que está en línea",
	banoff        = "Prohibir a un jugador que está desconectado",
	bansearch     = "Encuentra la identificación permanente de un jugador que está desconectado",
	dayhelp       = "Número de días",
	reason        = "Razón de la prohibición",
	permid        = "Encuentre la identificación permanente con el comando (sqlsearch)",
	history       = "Mostrar todas las prohibiciones de un jugador",
	reload        = "Vuelve a cargar BanList y BanListHistory",
	unban         = "Retirar un ban de la lista",
	steamname     = "(Nombre de Steam)",
}


Config.TextEn = {
	start         = "BanList y BanListHistory se cargaron correctamente.",
	starterror    = "ERROR: BanList y BanListHistory no se pudieron cargar. Vuelva a intentarlo.",
	banlistloaded = "BanList cargada con éxito.",
	historyloaded = "BanListHistory cargado correctamente.",
	loaderror     = "ERROR: La BanList no se pudo cargar.",
	cmdban        = "/sqlban (ID) (Duración en días) (Motivo de prohibición)",
	cmdbanoff     = "/sqlbanoffline (Permid) (Duración en días) (Nombre de Steam)",
	cmdhistory    = "/sqlbanhistory (nombre de Steam) o / sqlbanhistory 1,2,2,4......",
	forcontinu    = " dias. Para continuar, ejecute / sqlreason [motivo]",
	noreason      = "Sin motivo proporcionado.",
	during        = " durante: ",
	noresult      = "No se han encontrado resultados.",
	isban         = " fue prohibido",
	isunban       = " fue desbaneado",
	invalidsteam  = "Se requiere Steam para unirse a este servidor.",
	invalidid     = "No se encontró el ID del jugador",
	invalidname   = "El nombre especificado no es válido",
	invalidtime   = "Duración de la prohibición no válida",
	alreadyban    = " ya estaba prohibido para : ",
	yourban       = "Has sido baneado por: ",
	yourpermban   = "Has sido expulsado permanentemente por: ",
	youban        = "Estás prohibido en este servidor por: ",
	forr          = " dias. por: ",
	permban       = " permanentemente para: ",
	timeleft      = ". Tiempo restante: ",
	toomanyresult = "Demasiados resultados, sea más específico para acortar los resultados.",
	day           = " dias ",
	hour          = " horas ",
	minute        = " minutos ",
	by            = "por",
	ban           = "Ban a jugador",
	banoff        = "Prohibir a un jugador fuera de línea",
	dayhelp       = "Duracion (dias) de ban",
	reason        = "Razón de la prohibición",
	history       = "Muestra todas las prohibiciones anteriores para un determinado jugador.",
	reload        = "Actualiza la lista y el historial de prohibiciones.",
	unban         = "Desbanear a Jugador.",
	steamname     = "Nombre de Steam"
}
