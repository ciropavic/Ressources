resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'Menu'

version '1.0.0'


client_script "@errorlog/client/cl_errorlog.lua"


client_scripts {
	'@es_extended/client/wrapper.lua',
	'client/main.lua'
}

ui_page {
	'html/ui.html'
}

files {
	'html/ui.html',
	'html/css/app.css',
	'html/js/mustache.min.js',
	'html/js/app.js',
}

dependencies {
	'es_extended'
}

