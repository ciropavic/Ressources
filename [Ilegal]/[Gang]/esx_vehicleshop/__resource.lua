resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'Vehicle Shop'


server_scripts {		
	'@es_extended/locale.lua',
	'@mysql-async/lib/MySQL.lua',	
	'locales/en.lua',
	'config.lua',
	'server/server.lua'
}

client_scripts {		
	'@es_extended/locale.lua',
	'config.lua',
	'locales/en.lua',
	'client/utils.lua',
	'client/client.lua'
}

ui_page 'html/index.html'

files {
	'html/index.html',
	'html/carousel.css',
	'html/design.css',
	'html/colorpicker/*.css',
	'html/script.js',
	'html/images/*.png',
	'html/fonts/*.ttf',
	'html/colorpicker/*.js',
	'html/carousel.js',
	'imgs/*.png',
	'imgs/brand/*.png'

}

	