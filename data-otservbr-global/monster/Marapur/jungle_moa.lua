local mType = Game.createMonsterType("Jungle Moa")
local monster = {}

monster.description = "jungle moa"
monster.experience = 1200
monster.outfit = {
	lookType = 1534,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 2257
monster.Bestiary = {
	class = "Bird",
	race = BESTY_RACE_BIRD,
	toKill = 1000,
	FirstUnlock = 100,
	SecondUnlock = 500,
	CharmsPoints = 25,
	Stars = 3,
	Occurrence = 1,
	Locations = "Marapur."
}

monster.health = 1300
monster.maxHealth = 1300
monster.race = "blood"
monster.corpse = 39208
monster.speed = 105
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
	{name = "Gold Coin", chance = 65888, minCount = 1, maxCount = 227},
	{name = "Jungle Moa Feather", chance = 65888, minCount = 1, maxCount = 2},
	{name = "Meat", chance = 65000},
	{name = "Strong Mana Potion", chance = 65888, minCount = 1, maxCount = 2},
	{name = "Cyan Crystal Fragment", chance = 20111},
	{name = "Jungle Moa Claw", chance = 20111},
	{name = "Jungle Moa Egg", chance = 20111},
	{name = "Doublet", chance = 10221},
	{name = "Spellbook of Enlightenment", chance = 9011},
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 160, attack = 200},
	{name ="combat", interval = 2000, chance = 12, type = COMBAT_PHYSICALDAMAGE, minDamage = 50, maxDamage = -300, range = 7, shootEffect = CONST_ANI_LARGEROCK, effect = CONST_ME_EXPLOSIONAREA, target = false}
}

monster.defenses = {
	defense = 30,
	armor = 30,
	{name ="speed", interval = 2000, chance = 8, speedChange = 790, effect = CONST_ME_MAGIC_RED, target = false, duration = 10000},
	{name ="combat", interval = 2000, chance = 25, type = COMBAT_HEALING, minDamage = 600, maxDamage = 1090, effect = CONST_ME_HITBYFIRE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 10},
	{type = COMBAT_ENERGYDAMAGE, percent = 10},
	{type = COMBAT_EARTHDAMAGE, percent = -5},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 10},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = -10}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
