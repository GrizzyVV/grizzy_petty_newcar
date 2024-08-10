local CarRngList = {
    [1] = 'asea',
    [2] = 'iss2',
    [3] = 'asbo',
    --[4] = '', -- copy/paste and add more cars, also you can change the value below to one specific model if you like
}


local playerSpawned = false
AddEventHandler('playerSpawned', function()
    playerSpawned = true
end)


RegisterNetEvent('esx:playerLoaded', function(xPlayer, isNew, skin)
    while xPlayer == nil do Wait(10) end
    while playerSpawned == nil or playerSpawned == false do Wait(10) end
    if isNew == true and playerSpawned == true and xPlayer ~= nil then 
        local selectedModel = CarRngList[math.random(1, #CarRngList)]
        local coords = GetEntityCoords(PlayerPedId())
        ESX.Streaming.RequestModel(selectedModel, function() -- preps the model
            ESX.Game.SpawnVehicle(selectedModel, vec3(coords.x, coords.y+3.0, coords.z+3.0), 0.0, function(vehHandle) -- change selectedModel here to 'asea' or w/e car you want if you don't want random selection of starters
                local props = ESX.Game.GetVehicleProperties(vehHandle) -- gets the plate, mods, engine health, etc
                if DoesEntityExist(vehHandle) then 
                    local auth = 'true'
                    Wait(500)
                    ESX.Game.DeleteVehicle(vehHandle)
                    TriggerServerEvent('InsertCarToDb', props, auth)
                end
            end)
        end)
    end
end)

