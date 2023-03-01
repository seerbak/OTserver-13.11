local config = {
    storage = 200001,
    checkDuplicateIps = false
}

local onlinePointsEvent = GlobalEvent("GainPointPerHour")

function onlinePointsEvent.onThink(interval)
    local players = Game.getPlayers()
    if #players == 0 then
        return true
    end

    local checkIp = {}
    for _, player in pairs(players) do
        local ip = player:getIp()
        if ip ~= 0 and (not config.checkDuplicateIps or not checkIp[ip]) then
            checkIp[ip] = true
             if   player:setStorageValue(config.storage, 0) then
                local coins = 20 -- quantidad de Coins que dara
                db.query("UPDATE `accounts` SET `tournament_coins` = `tournament_coins` + '" .. coins .. "' WHERE `id` = '" .. player:getAccountId() .. "';")
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You received "..coins.." Tournament Coin")
                return true
              end
            end
        end
    end

onlinePointsEvent:interval(3600000)
onlinePointsEvent:register()