resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'

files {
	'vehicles.meta',
	'carvariations.meta',
	'carcols.meta',
	'handling.meta',
	'index.html',
    'ui.html',
    'style.css',
	'sound/zliberty.ogg',
    'bg/*.png'
}

client_scripts {
	'client.lua',
	'vehicle_names.lua'
}

data_file 'HANDLING_FILE' 'handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'vehicles.meta'
data_file 'CARCOLS_FILE' 'carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'carvariations.meta'

loadscreen 'index.html'

ui_page 'ui.html'

