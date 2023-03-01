local internalNpcName = "Items Inicio/ hi-item"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 160,
	lookHead = 0,
	lookBody = 112,
	lookLegs = 93,
	lookFeet = 95
}

npcConfig.flags = {
	floorchange = false
}

 local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

local talkState = {}
npcType.onAppear = function(npc, creature)
	 npcHandler:onAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
	 npcHandler:onDisappear(npc, creature)
end

npcType.onSay = function(npc, creature, type, message)
	 npcHandler:onSay(npc, creature, type, message)
end

npcType.onThink = function(npc, interval)
	 npcHandler:onThink(npc, interval)
end

local normalItems = {
	 {3066, 3074, 3571, 8095, 7991, 3358, 3272, 3410, 3350, 3277, 3552},
	 {3066, 3074, 3571, 8095, 7991, 3358, 3272, 3410, 3350, 3277, 3552}
}

local semiRareItems = {
	 {3066, 3074, 3571, 8095, 7991, 3358, 3272, 3410, 3350, 3277, 3552},
	 {3066, 3074, 3571, 8095, 7991, 3385, 3272, 3410, 3350, 3277, 3552}
}

local rareItems = {
	 {3066, 3074, 3571, 8095, 7991, 3358, 3272, 3410, 3350, 3277, 3552},
	 {3066, 3074, 3571, 8095, 7991, 3358, 3272, 3410, 3350, 3277, 3552}
}

local veryRareItems = {
	 {3066, 3074, 3571, 8095, 7991, 3358, 3272, 3410, 3350, 3277, 3552},
	 {3066, 3074, 3571, 8095, 7991, 3358, 3272, 3410, 3350, 3277, 3552}
}

local function getReward()
	 local rewardTable = {}
	 local random = math.random(100)
	 if (random <= 90) then
		  rewardTable = normalItems
	 elseif (random <= 70) then
		  rewardTable = semiRareItems
	 elseif (random <= 30) then
		  rewardTable = rareItems
	 elseif (random <= 10) then
		  rewardTable = veryRareItems
	 end

	 local rewardItem = rewardTable[math.random(#rewardTable)]
	 return rewardItem
end

local function creatureSayCallback(npc, creature, type, message)
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or creature
	
	if MsgContains(message, 'item') then
		local player = Player(creature)
		if (player:getStorageValue(840293) == 1) then
			npcHandler:say("No puedes volver a obtener.", npc, creature)
			return false
		end
		
		local reward = getReward()
		local cont = Container(Player(creature):addItem(2854):getUniqueId())
		local count = 1
		
		for i = 1, #reward do
			if (reward[i] == 2992 or
			reward[i] == 3599) then
				count = 10
			end
			
			cont:addItem(reward[i], count)
		end
		
		player:setStorageValue(840293, 1)
		npcHandler:say("A la batalla!", npc, creature)
	end
	
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

-- npcType registering the npcConfig table
npcType:register(npcConfig)
