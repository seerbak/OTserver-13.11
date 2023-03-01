local mType = Game.createMonsterType("Rogue Naga")
local monster = {}

monster.description = "a rogue naga"
monster.experience = 4510
monster.outfit = {
	lookType = 1543,
	lookHead = 132,
	lookBody = 14,
	lookLegs = 95,
	lookFeet = 109,
	lookAddons = 3,
	lookMount = 0
}

monster.health = 6200
monster.maxHealth = 6200
monster.race = "blood"
monster.corpse = 39221
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
	{name = "platinum coin", chance = 100000, maxCount = 12},
	{name = "rogue naga scales", chance = 7730},
	{name = "green crystal shard", chance = 7980, maxCount = 2},
}

monster.attacks = {

	{name ="melee", interval = 2000, chance = 100, minDamage = -100, maxDamage = -340},
	{name ="combat", interval = 4000, chance = 10, type = COMBAT_DEATHDAMAGE, minDamage = -350, maxDamage = -550, radius = 11, effect = CONST_ME_MORTAREA, target = false},
	{name ="combat", interval = 4000, chance = 10, type = COMBAT_ENERGYDAMAGE, minDamage = -350, maxDamage = -550, radius = 11, effect = CONST_ME_ELECTRICALSPARK, target = false},
	{name ="combat", interval = 4000, chance = 10, type = COMBAT_ENERGYDAMAGE, minDamage = -350, maxDamage = -600, radius = 5, effect = CONST_ME_ENERGYHIT, target = false}
	}
	
	monster.defenses = {
		defense = 78,
		armor = 78
	}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 10},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 30},
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