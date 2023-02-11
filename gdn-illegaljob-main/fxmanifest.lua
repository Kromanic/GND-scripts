fx_version 'cerulean'
game 'gta5'

description 'gdn-illegaljob made by Kromanic'
version '1.0.0'


shared_scripts {
	'config.lua',
}

client_scripts {
    'client/main.lua',
    'client/menu.lua',
    'client/crafting.lua',
    'client/buffs.lua',
}

server_scripts {
    'server/main.lua',
    'server/crafting.lua',
    'server/buffs_sv.lua',
}

dependencies {
	'ps-buffs'
}

lua54 'yes'
