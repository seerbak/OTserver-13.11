local mType = Game.createMonsterType("Corrupt Naga")
local monster = {}

monster.description = "a corrupt naga"
monster.experience = 4380
monster.outfit = {
	lookType = 1538,
	lookHead = 105,
	lookBody = 57,
	lookLegs = 113,
	lookFeet = 113,
	lookAddons = 3,
	lookMount = 0
}

monster.health = 5990
monster.maxHealth = 5990
monster.race = "blood"
monster.corpse = 39217
monster.speed = 180
monster.manaCost = 0
monster.maxSummons = 0


monster.changeTarget = {
	interval = 4000,
	chance = 10
}

monster.strategiesTarget = {
	nearest = 100,
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
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "", yell = false},
}

monster.loot = {
	{name = "platinum coin", chance = 100000, maxCount = 8},
	{name = "corrupt naga scales", chance = 7730},
	{name = "violet crystal shard", chance = 7980, maxCount = 2},
}

monster.attacks = {

	{name ="melee", interval = 2000, chance = 100, minDamage = -100, maxDamage = -340},
	{name ="combat", interval = 3000, chance = 15, type = COMBAT_FIREDAMAGE, minDamage = -150, maxDamage = -300, range = 5, radius = 5, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREATTACK, target = true},
	{name ="combat", interval = 4000, chance = 10, type = COMBAT_FIREDAMAGE, minDamage = -350, maxDamage = -550, radius = 5, effect = CONST_ME_HITBYFIRE, target = false}
	}
	
	monster.defenses = {
		defense = 78,
		armor = 78
	}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 10},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 25},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)