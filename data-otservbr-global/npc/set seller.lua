local internalNpcName = "Set Seller"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 1199,
	lookHead = 76,
	lookBody = 0,
	lookLegs = 45,
	lookFeet = 3,
	lookAddons = 0
}

npcConfig.flags = {
	floorchange = false
}

npcConfig.voices = {
	interval = 15000,
	chance = 50,
	{text = 'Hola ! Vendo Algo de set interesante !!'}
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

npcType.onThink = function(npc, interval)
	npcHandler:onThink(npc, interval)
end

npcType.onAppear = function(npc, creature)
	npcHandler:onAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
	npcHandler:onDisappear(npc, creature)
end

npcType.onMove = function(npc, creature, fromPosition, toPosition)
	npcHandler:onMove(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onSay(npc, creature, type, message)
end

npcType.onCloseChannel = function(npc, creature)
	npcHandler:onCloseChannel(npc, creature)
end

local function creatureSayCallback(npc, creature, type, message)
	local player = Player(creature)
	local playerId = player:getId()

	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end

	if MsgContains(message, "addon") or MsgContains(message, "outfit") or MsgContains(message, "hat") then
		local addonProgress = player:getStorageValue(Storage.OutfitQuest.Citizen.AddonHat)
		if addonProgress < 1 then
			npcHandler:say("Pretty, isn't it? My friend Amber taught me how to make it, but I could help you with one if you like. What do you say?", npc, creature)
			npcHandler:setTopic(playerId, 1)
		elseif addonProgress == 1 then
			npcHandler:say("Oh, you're back already? Did you bring a legion helmet, 100 chicken feathers and 50 honeycombs?", npc, creature)
			npcHandler:setTopic(playerId, 2)
		elseif addonProgress == 2 then
			npcHandler:say('Pretty hat, isn\'t it?', npc, creature)
		end
		return true
	end

	if npcHandler:getTopic(playerId) == 1 then
		if MsgContains(message, 'yes') then
			player:setStorageValue(Storage.OutfitQuest.Ref, math.max(0, player:getStorageValue(Storage.OutfitQuest.Ref)) + 1)
			player:setStorageValue(Storage.OutfitQuest.Citizen.AddonHat, 1)
			player:setStorageValue(Storage.OutfitQuest.Citizen.MissionHat, 1)
			npcHandler:say('Okay, here we go, listen closely! I need a few things... a basic hat of course, maybe a legion helmet would do. Then about 100 chicken feathers... and 50 honeycombs as glue. That\'s it, come back to me once you gathered it!', npc, creature)
		else
			npcHandler:say('Aw, I guess you don\'t like feather hats. No big deal.', npc, creature)
		end
		npcHandler:setTopic(playerId, 0)

	elseif npcHandler:getTopic(playerId) == 2 then
		if MsgContains(message, 'yes') then
			if player:getItemCount(3374) < 1 then
				npcHandler:say('Sorry, but I can\'t see a legion helmet.', npc, creature)
			elseif player:getItemCount(5890) < 100 then
				npcHandler:say('Sorry, but you don\'t enough chicken feathers.', npc, creature)
			elseif player:getItemCount(5902) < 50 then
				npcHandler:say('Sorry, but you don\'t have enough honeycombs.', npc, creature)
			else
				npcHandler:say('Great job! That must have taken a lot of work. Okay, you put it like this... then glue like this... here!', npc, creature)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)

				player:removeItem(3374, 1)
				player:removeItem(5902, 50)
				player:removeItem(5890, 100)

				player:addOutfitAddon(136, 2)
				player:addOutfitAddon(128, 2)

				player:setStorageValue(Storage.OutfitQuest.Ref, math.min(0, player:getStorageValue(Storage.OutfitQuest.Ref) - 1))
				player:setStorageValue(Storage.OutfitQuest.Citizen.MissionHat, 0)
				player:setStorageValue(Storage.OutfitQuest.Citizen.AddonHat, 2)
			end
		else
			npcHandler:say('Maybe another time.', npc, creature)
		end
		npcHandler:setTopic(playerId, 0)
	end

	return true
end

keywordHandler:addKeyword({'00'}, StdModule.say, {npcHandler = npcHandler, text = 'I am a jeweler. Maybe you want to have a look at my wonderful offers.'})
keywordHandler:addKeyword({'0000'}, StdModule.say, {npcHandler = npcHandler, text = 'I am Hanna.'})

npcHandler:setMessage(MESSAGE_GREET, 'Bienvenido !, |PLAYERNAME|. Que necesitas? Aqui puedes vender tu loot solo di {trade} !.')
npcHandler:setMessage(MESSAGE_FAREWELL, 'Adios.')
npcHandler:setMessage(MESSAGE_WALKAWAY, 'Adios.')

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

npcConfig.shop = {
	{ itemName = "calopteryx cape", clientId = 14086, buy = 350000 },
	{ itemName = "draken boots", clientId = 4033, buy = 350000 },
	{ itemName = "dream blossom staff", clientId = 25700, buy = 350000 },
	{ itemName = "dwarven legs", clientId = 3398, buy = 350000 },
	{ itemName = "elite draken helmet", clientId = 11689, buy = 350000 },
	{ itemName = "emerald sword", clientId = 8102, buy = 350000 },
	{ itemName = "gill coat", clientId = 16105, buy = 350000 },
	{ itemName = "gill gugel", clientId = 16104, buy = 350000 },
	{ itemName = "gill legs", clientId = 16106, buy = 350000 },
	{ itemName = "grasshopper legs", clientId = 14087, buy = 350000 },
	{ itemName = "hellforged axe", clientId = 8096, buy = 350000 },
	{ itemName = "master archer's armor", clientId = 8060, buy = 350000 },
	{ itemName = "necromancer shield", clientId = 6432, buy = 350000 },
	{ itemName = "nightmare shield", clientId = 6390, buy = 350000 },
	{ itemName = "obsidian truncheon", clientId = 8100, buy = 350000 },
	{ itemName = "rift bow", clientId = 22866, buy = 350000 },
	{ itemName = "royal crossbow", clientId = 8023, buy = 350000 },
	{ itemName = "royal draken mail", clientId = 11686, buy = 350000 },
	{ itemName = "spellbook of dark mysteries", clientId = 8090, buy = 350000 },
	{ itemName = "spellbook of vigilance", clientId = 16107, buy = 350000 },
	{ itemName = "yalahari leg piece", clientId = 8863, buy = 350000 },
	{ itemName = "yalahari mask", clientId = 8864, buy = 350000 },
	{ itemName = "zaoan helmet", clientId = 10385, buy = 350000 }
}
-- On buy npc shop message
npcType.onBuyItem = function(npc, player, itemId, subType, amount, ignore, inBackpacks, totalCost)
	npc:sellItem(player, itemId, amount, subType, 0, ignore, inBackpacks)
end
-- On sell npc shop message
npcType.onSellItem = function(npc, player, itemId, subtype, amount, ignore, name, totalCost)
	player:sendTextMessage(MESSAGE_INFO_DESCR, string.format("Sold %ix %s for %i gold.", amount, name, totalCost))
end
-- On check npc shop message (look item)
npcType.onCheckItem = function(npc, player, clientId, subType)
end

npcType:register(npcConfig)
