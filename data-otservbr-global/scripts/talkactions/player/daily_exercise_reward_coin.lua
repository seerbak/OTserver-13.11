local exerciseCharges = 1200
local coin = 1
local rewardStorage = 29998

local reward = TalkAction("!gift")

function reward.onSay(player, words, param)
    if player then
        if player:getStorageValue(rewardStorage) >= os.time() then
            player:sendCancelMessage("You already collected your daily reward.")
        else
            player:setStorageValue(rewardStorage, os.time() + 24 * 60 * 60)
            player:getPosition():sendMagicEffect(CONST_ME_SMOKE)
            if player:isSorcerer() then
                player:addItem(35284, exerciseCharges)
                player:addItem(3043, coin)
            elseif player:isDruid() then
                player:addItem(35283, exerciseCharges)
                player:addItem(3043, coin)
            elseif player:isPaladin() then
                player:addItem(35282, exerciseCharges)
                player:addItem(3043, coin)
            elseif player:isKnight() then
                if player:getSkillLevel(SKILL_SWORD) > player:getSkillLevel(SKILL_CLUB) and
                player:getSkillLevel(SKILL_SWORD) > player:getSkillLevel(SKILL_AXE) then
                    player:addItem(35279, exerciseCharges)
                    player:addItem(3043, coin)
                elseif player:getSkillLevel(SKILL_CLUB) > player:getSkillLevel(SKILL_SWORD) and
                    player:getSkillLevel(SKILL_CLUB) > player:getSkillLevel(SKILL_AXE) then
                    player:addItem(35281, exerciseCharges)
                    player:addItem(3043, coin)
                elseif player:getSkillLevel(SKILL_AXE) > player:getSkillLevel(SKILL_SWORD) and
                    player:getSkillLevel(SKILL_AXE) > player:getSkillLevel(SKILL_CLUB) then
                    player:addItem(35280, exerciseCharges)
                    player:addItem(3043, coin)
                end
            end
        end
    end
end

reward:register()