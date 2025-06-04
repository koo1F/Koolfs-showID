if Config == nil then
    Config = {}
end

local function loadConfig()
    local configFile = LoadResourceFile(GetCurrentResourceName(), "config.lua")
    if configFile then
        local chunk, err = load(configFile)
        if chunk then
            chunk()
        else
            print("Error loading config.lua: " .. err)
        end
    else
        print("config.lua not found")
    end
end

loadConfig()

local showIds = Config.showIds

RegisterNetEvent("idDisplay:updateAll", function(toggle)
    showIds = toggle
end)


RegisterCommand("ids", function()
    TriggerServerEvent("idDisplay:toggle")
end, false)

RegisterKeyMapping("ids", "Toggle Player IDs Display", "keyboard", Config.toggleKey)

-- Main thread
CreateThread(function()
    while true do
        if showIds then
            local myPed = PlayerPedId()
            local myCoords = GetEntityCoords(myPed)

            for _, player in ipairs(GetActivePlayers()) do
                local ped = GetPlayerPed(player)
                if DoesEntityExist(ped) and not IsEntityDead(ped) then
                    local coords = GetEntityCoords(ped)
                    local distance = #(myCoords - coords)

                    if distance <= Config.displayDistance or player == PlayerId() then
                        local serverId = GetPlayerServerId(player)
                        local playerName = GetPlayerName(player)
                        local talking = NetworkIsPlayerTalking(player)

                        local text = ("%d | %s"):format(serverId, playerName)
                        local color = talking and Config.talkingColor or Config.normalColor

                        local zOffset = (player == PlayerId()) and 1.2 or 1.0
                        DrawText3D(coords.x, coords.y, coords.z + zOffset, text, color)
                    end
                end
            end

            Wait(0)
        else
            Wait(500)
        end
    end
end)

function DrawText3D(x, y, z, text, rgb)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    if onScreen then
        local px, py, pz = table.unpack(GetGameplayCamCoords())
        local dist = #(vector3(px, py, pz) - vector3(x, y, z))
        local scale = (1 / dist) * 1.5

        SetTextScale(1 * scale, 1 * scale)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(rgb[1], rgb[2], rgb[3], 215)
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end
