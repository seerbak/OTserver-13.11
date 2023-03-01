local internalNpcName = "Imbuement Assistant"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 141,
	lookHead = 41,
	lookBody = 72,
	lookLegs = 39,
	lookFeet = 96,
	lookAddons = 3,
	lookMount = 688
}

npcConfig.flags = {
	floorchange = false
}

npcConfig.voices = {
	interval = 15000,
	chance = 50,
	{text = 'Hello adventurer, looking for Imbuement items? Just ask me!'}
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

-- Basic

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = "Currently I have been working selling items for imbuement."})

npcHandler:setMessage(MESSAGE_GREET, "Welcome to Imbuement's shop!")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye and come again.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Good bye and come again.")

npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

npcConfig.shop = {
	{ itemName = "battle stone", clientId = 11447, buy = 7000 },
	{ itemName = "blazing bone", clientId = 16131, buy = 7000 },
	{ itemName = "bloody pincers", clientId = 9633, buy = 7000 },
	{ itemName = "brimstone fangs", clientId = 11702, buy = 7000 },
	{ itemName = "brimstone shell", clientId = 11703, buy = 7000},
	{ itemName = "broken shamanic staff", clientId = 11452, buy = 7000 },
	{ itemName = "compass", clientId = 10302, buy = 7000 },
	{ itemName = "crawler head plating", clientId = 14079, buy = 7000 },
	{ itemName = "crystallized anger", clientId = 23507, buy = 7000 },
	{ itemName = "cultish mask", clientId = 9638, buy = 7000 },
	{ itemName = "cultish robe", clientId = 9639, buy = 7000 },
	{ itemName = "cyclops toe", clientId = 9657, buy = 7000 },
	{ itemName = "damselfly wing", clientId = 17458, buy = 7000 },
	{ itemName = "deepling warts", clientId = 14012, buy = 7000 },
	{ itemName = "demon horn", clientId = 5954, buy = 7000 },
	{ itemName = "demonic skeletal hand", clientId = 9647, buy = 7000 },
	{ itemName = "draken sulphur", clientId = 11658, buy = 7000 },
	{ itemName = "elven hoof", clientId = 18994, buy = 7000 },
	{ itemName = "elven scouting glass", clientId = 11464, buy = 7000 },
	{ itemName = "elvish talisman", clientId = 9635, buy = 7000 },
	{ itemName = "energy vein", clientId = 23508, buy = 7000 },
	{ itemName = "fairy wings", clientId = 25694, buy = 7000 },
	{ itemName = "fiery heart", clientId = 9636, buy = 7000 },
	{ itemName = "flask of embalming fluid", clientId = 11466, buy = 7000 },
	{ itemName = "frazzle skin", clientId = 20199, buy = 7000 },
	{ itemName = "frosty heart", clientId = 9661, buy = 7000 },
	{ itemName = "gloom wolf fur", clientId = 22007, buy = 7000 },
	{ itemName = "goosebump leather", clientId = 20205, buy = 7000 },
	{ itemName = "green dragon leather", clientId = 5877, buy = 7000 },
	{ itemName = "green dragon scale", clientId = 5920, buy = 7000 },
	{ itemName = "hellspawn tail", clientId = 10304, buy = 7000 },
	{ itemName = "lion's mane", clientId = 9691, buy = 7000 },
	{ itemName = "little bowl of myrrh", clientId = 25702, buy = 7000 },
	{ itemName = "metal spike", clientId = 10298, buy = 7000 },
	{ itemName = "mooh'tah shell", clientId = 21202, buy = 7000 },
	{ itemName = "moohtant horn", clientId = 21200, buy = 7000 },
	{ itemName = "mystical hourglass", clientId = 9660, buy = 7000 },
	{ itemName = "ogre nose ring", clientId = 22189, buy = 7000 },
	{ itemName = "orc tooth", clientId = 10196, buy = 7000 },
	{ itemName = "peacock feather fan", clientId = 21975, buy = 7000 },
	{ itemName = "petrified scream", clientId = 10420, buy = 7000 },
	{ itemName = "piece of dead brain", clientId = 9663, buy = 7000 },
	{ itemName = "piece of scarab shell", clientId = 9641, buy = 7000 },
	{ itemName = "piece of swampling wood", clientId = 17823, buy = 7000 },
	{ itemName = "pile of grave earth", clientId = 11484, buy = 7000 },
	{ itemName = "poisonous slime", clientId = 9640, buy = 7000 },
	{ itemName = "polar bear paw", clientId = 9650, buy = 7000 },
	{ itemName = "protective charm", clientId = 11444, buy = 7000 },
	{ itemName = "quill", clientId = 28567, buy = 7000 },
	{ itemName = "rope belt", clientId = 11492, buy = 7000 },
	{ itemName = "rorc feather", clientId = 18993, buy = 7000 },
	{ itemName = "sabretooth", clientId = 10311, buy = 7000 },
	{ itemName = "seacrest hair", clientId = 21801, buy = 7000 },
	{ itemName = "silencer claws", clientId = 20200, buy = 7000 },
	{ itemName = "slime heart", clientId = 21194, buy = 7000 },
	{ itemName = "snake skin", clientId = 9694, buy = 7000 },
	{ itemName = "some grimeleech wings", clientId = 22730, buy = 7000 },
	{ itemName = "strand of medusa hair", clientId = 10309, buy = 7000 },
	{ itemName = "swamp grass", clientId = 9686, buy = 7000 },
	{ itemName = "thick fur", clientId = 10307, buy = 7000 },
	{ itemName = "vampire teeth", clientId = 9685, buy = 7000 },
	{ itemName = "vexclaw talon", clientId = 22728, buy = 7000 },
	{ itemName = "war crystal", clientId = 9654, buy = 7000 },
	{ itemName = "warmaster's wristguards", clientId = 10405, buy = 7000 },
	{ itemName = "waspoid wing", clientId = 14081, buy = 7000 },
	{ itemName = "wereboar hooves", clientId = 22053, buy = 7000 },
	{ itemName = "winter wolf fur", clientId = 10295, buy = 7000 },
	{ itemName = "wyrm scale", clientId = 9665, buy = 7000 },
	{ itemName = "wyvern talisman", clientId = 9644, buy = 7000 }
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
