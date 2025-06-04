local showIds = Config and Config.showIds or false

RegisterCommand(Config.commands, function(source)
    showIds = not showIds
    TriggerClientEvent("idDisplay:updateAll", -1, showIds)
end, false)

RegisterNetEvent("idDisplay:toggle")
AddEventHandler("idDisplay:toggle", function()
    showIds = not showIds
    TriggerClientEvent("idDisplay:updateAll", -1, showIds)
end)
