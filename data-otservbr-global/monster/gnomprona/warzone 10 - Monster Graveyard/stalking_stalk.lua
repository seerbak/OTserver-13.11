local mType = Game.createMonsterType("Stalking Stalk")
local monster = {}

monster.description = "stalking stalk"
monster.experience = 11569
monster.outfit = {
	lookType = 1554,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 2272
monster.Bestiary = {
	class = "Plant",
	race = BESTY_RACE_PLANT,
	toKill = 5000,
	FirstUnlock = 100,
	SecondUnlock = 1000,
	CharmsPoints = 100,
	Stars = 5,
	Occurrence = 1,
	Locations = "Monster Graveyard."
}

monster.health = 17100
monster.maxHealth = 17100
monster.race = "blood"
monster.corpse = 39307
monster.speed = 190
monster.manaCost = 0


monster.changeTarget = {
	interval = 2000,
	chance = 5
}

monster.strategiesTarget = {
	nearest = 70,
	health = 10,
	damage = 10,
	random = 10,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = false,
	illusionable = true,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false,
	
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
	{name = "crystal coin", chance = 40000, minCount = 1, maxCount = 3},
	{name = "Small Diamond", chance = 40000, minCount = 1, maxCount = 2},
	{name = "Dragon Necklace", chance = 40000},
	{name = "Stalking Seeds", chance = 40000, minCount = 1, maxCount = 2},
	{name = "Magma Coat", chance = 4525},
	{name = "Green Gem", chance = 4328},
	{name = "Bow", chance = 4852},
	{name = "Warrior's Axe", chance = 4354},
	{name = "Muck Rod", chance = 4125},
	{name = "Green Crystal Fragment", chance = 4355},
	{name = "Opal", chance = 4258, minCount = 1, maxCount = 2},
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 160, attack = 200},
	{name ="combat", interval = 2000, chance = 12, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -1100, range = 7, shootEffect = CONST_ANI_LARGEROCK, effect = CONST_ME_EXPLOSIONAREA, target = false}
}

monster.defenses = {
	defense = 65,
	armor = 76,
	{name ="speed", interval = 2000, chance = 8, speedChange = 790, effect = CONST_ME_MAGIC_RED, target = false, duration = 10000},
	{name ="combat", interval = 2000, chance = 25, type = COMBAT_HEALING, minDamage = 600, maxDamage = 1090, effect = CONST_ME_HITBYFIRE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = -25},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 25},
	{type = COMBAT_FIREDAMAGE, percent = 25},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -10},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 10}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
