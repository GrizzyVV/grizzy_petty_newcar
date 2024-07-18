fx_version 'cerulean'
game 'gta5'
lua54 'yes'
description 'This is a script I wrote as a cop out for someone charging $5 for the same thing...'
author 'gr.zzy'
version '0.1'
shared_scripts {
    '@es_extended/imports.lua',
    '@ox_lib/init.lua',
}
client_scripts {
    'client.lua',
}
server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server.lua',
}
dependencies {
    'ox_lib',
    'es_extended'
}