local exerciseCharges = 1000
local coin = 5
local rewardStorage = 29998

local reward = TalkAction("!reward")

function reward.onSay(player, words, param)
    if player then
        if player:getStorageValue(rewardStorage) >= os.time() then
            player:sendCancelMessage("You already collected your daily reward.")
        else
            player:setStorageValue(rewardStorage, os.time() + 24 * 60 * 60)
            player:getPosition():sendMagicEffect(CONST_ME_SMOKE)

local inbox = player:getSlotItem(CONST_SLOT_STORE_INBOX)

            if player:isSorcerer() then
                inbox:addItem(35284, exerciseCharges)
                player:addItem(3043, coin)
            elseif player:isDruid() then
                inbox:addItem(35283, exerciseCharges)
                player:addItem(3043, coin)
            elseif player:isPaladin() then
                inbox:addItem(35282, exerciseCharges)
                player:addItem(3043, coin)
            elseif player:isKnight() then
                if player:getSkillLevel(SKILL_SWORD) > player:getSkillLevel(SKILL_CLUB) and
                player:getSkillLevel(SKILL_SWORD) > player:getSkillLevel(SKILL_AXE) then
                   inbox:addItem(35279, exerciseCharges)
                   player:addItem(3043, coin)
                elseif player:getSkillLevel(SKILL_CLUB) > player:getSkillLevel(SKILL_SWORD) and
                    player:getSkillLevel(SKILL_CLUB) > player:getSkillLevel(SKILL_AXE) then
                    inbox:addItem(35281, exerciseCharges)
                    player:addItem(3043, coin)
                elseif player:getSkillLevel(SKILL_AXE) > player:getSkillLevel(SKILL_SWORD) and
                    player:getSkillLevel(SKILL_AXE) > player:getSkillLevel(SKILL_CLUB) then
                    inbox:addItem(35280, exerciseCharges)
                    player:addItem(3043, coin)
                end
            end
        end
    end
end

reward:register()