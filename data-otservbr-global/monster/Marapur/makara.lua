local mType = Game.createMonsterType("Makara")
local monster = {}

monster.description = "a makara"
monster.experience = 6150
monster.outfit = {
	lookType = 1565,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 2262
monster.Bestiary = {
	class = "Amphibic",
	race = BESTY_RACE_AMPHIBIC,
	toKill = 2500,
	FirstUnlock = 100,
	SecondUnlock = 1000,
	CharmsPoints = 50,
	Stars = 4,
	Occurrence = 1,
	Locations = "Temple of the Moon Goddess."
}

monster.health = 4770
monster.maxHealth = 4770
monster.race = "blood"
monster.corpse = 39366
monster.speed = 175
monster.manaCost = 0

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
	runHealth = 10,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = true,
	canWalkOnPoison = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "waddle waddle", yell = false}
}

monster.loot = {
	{name = "Platinum Coin", chance = 45888, minCount = 1, maxCount = 2},
	{name = "Meat", chance = 45888, minCount = 1, maxCount = 2},
	{name = "Makara Fin", chance = 12144},
	{name = "Makara Tongue", chance = 12424},
	{name = "Small Diamond", chance = 6546, minCount = 1, maxCount = 2},
	{name = "Blue Gem", chance = 5254},
	{name = "Cyan Crystal Fragment", chance = 6554},
	{name = "Green Crystal Fragment", chance = 5456},
	{name = "Green Crystal Shard", chance = 5454},
	{name = "Rainbow Quartz", chance = 5421},
	{name = "Yellow Gem", chance = 6478},
	{name = "Sea Horse Figurine", chance = 454},
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -361},
	{name ="combat", interval = 1000, chance = 10, type = COMBAT_ICEDAMAGE, minDamage = -320, maxDamage = -320, range = 7, shootEffect = CONST_ANI_SMALLICE, effect = CONST_ME_ICEATTACK, target = true},
	{name ="combat", interval = 2000, chance = 50, type = COMBAT_ICEDAMAGE, minDamage = -282, maxDamage = -315, range = 7, shootEffect = CONST_ANI_SMALLICE, effect = CONST_ME_WATERSPLASH, target = true},
	{name ="combat", interval = 6000, chance = 50, type = COMBAT_EARTHDAMAGE, minDamage = -282, maxDamage = -315, range = 7, shootEffect = CONST_ME_STONES, effect = CONST_ANI_EARTH, target = false},
	{name ="makarawatersplash", interval = 6000, chance = 38, minDamage = -800, maxDamage = -1300},
	
}

monster.defenses = {
	defense = 74,
	armor = 74
	
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = -10},
	{type = COMBAT_ENERGYDAMAGE, percent = -15},
	{type = COMBAT_EARTHDAMAGE, percent = -15},
	{type = COMBAT_FIREDAMAGE, percent = 5},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 25},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = -5}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)