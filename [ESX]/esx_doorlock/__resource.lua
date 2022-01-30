resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'


client_script "@errorlog/client/cl_errorlog.lua"


server_scripts {
	'config.lua',
	'server/main.lua'
}

client_scripts {
	'config.lua',
	'client/main.lua'
}
