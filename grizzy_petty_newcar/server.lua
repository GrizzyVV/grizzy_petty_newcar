RegisterNetEvent('esx:playerLoaded', function(player, xPlayer, isNew)
    while xPlayer == nil do Wait(10) end 
    if isNew == true then 
        TriggerClientEvent('CreateCarData', xPlayer.source, xPlayer)
    end
end)
RegisterNetEvent('InsertCarToDb', function(xPlayer, vehData, auth)
    local xPlayer
    if xPlayer == nil then 
        local src = source
        xPlayer = ESX.GetPlayerFromId(src)
    end
    if auth == nil then 
        autn = 'nil'
    end
    if auth ~= 'true' then 
        -- go to your es_extended/config_logs.lua and enter the name of this resource ['grizzy_petty_newcar'] as the key for a log and add the webhook of your choice
        ESX.DiscordLogFields(GetCurrentResourceName(), GetCurrentResourceName()..": This player is triggering this event with a menu, ban them.", "red", {
            {name = "Server Id", value = xPlayer.source, inline = false},
            {name = "Identifier", value = xPlayer.identifier, inline = false},
            {name = "Auth Passed", value = auth, inline = false},
        })
    end
    if auth == 'true' then 
        MySQL.insert('INSERT INTO `owned_vehicles` (plate, vehicle, owner) VALUES (?, ?, ?)', {
            vehData.plate, json.encode(vehData), xPlayer.identifier
        }, function()
            -- go to your es_extended/config_logs.lua and enter the name of this resource ['grizzy_petty_newcar'] as the key for a log and add the webhook of your choice
            ESX.DiscordLogFields(GetCurrentResourceName(), GetCurrentResourceName()..": A new player has been given a vehicle.", "green", {
                {name = "Server Id", value = xPlayer.source, inline = false},
                {name = "Identifier", value = xPlayer.identifier, inline = false},
                {name = "Plate", value = vehData.plate, inline = false},
            })
        end)
    end
end)