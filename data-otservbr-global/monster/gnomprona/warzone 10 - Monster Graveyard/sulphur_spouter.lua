local mType = Game.createMonsterType("Sulphur Spouter")
local monster = {}

monster.description = "sulphur spouter"
monster.experience = 11517
monster.outfit = {
	lookType = 1547,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 2265
monster.Bestiary = {
	class = "Elemental",
	race = BESTY_RACE_ELEMENTAL,
	toKill = 5000,
	FirstUnlock = 100,
	SecondUnlock = 1000,
	CharmsPoints = 100,
	Stars = 5,
	Occurrence = 1,
	Locations = "Monster Graveyard."
}

monster.health = 19000
monster.maxHealth = 19000
monster.race = "blood"
monster.corpse = 39279
monster.speed = 180
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
	illusionable = false,
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
	{name = "Sulphur Powder", chance = 80000},
	{name = "crystal coin", chance = 40000, minCount = 1, maxCount = 2},
	{name = "Ultimate Mana Potion", chance = 40000, minCount = 1, maxCount = 2},
	{id = 281, chance = 4102},
	{name = "Yellow Gem", chance = 4102},
	{name = "Red Gem", chance = 4102},
	{name = "Knight Legs", chance = 4102},
	{name = "Slightly Rusted Legs", chance = 4102},
	{name = "Warrior's Shield", chance = 4102},
	{name = "Fire Sword", chance = 1120},
	{name = "Crystal Crossbow", chance = 996},
	{id = 23533, chance = 986},
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 160, attack = 200},
	{name ="combat", interval = 2000, chance = 12, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -1100, range = 7, shootEffect = CONST_ANI_LARGEROCK, effect = CONST_ME_EXPLOSIONAREA, target = false}
}

monster.defenses = {
	defense = 65,
	armor = 84,
	{name ="speed", interval = 2000, chance = 8, speedChange = 790, effect = CONST_ME_MAGIC_RED, target = false, duration = 10000},
	{name ="combat", interval = 2000, chance = 25, type = COMBAT_HEALING, minDamage = 600, maxDamage = 1090, effect = CONST_ME_HITBYFIRE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = -20},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
