local mType = Game.createMonsterType("Foam Stalker")
local monster = {}

monster.description = "a foam stalker"
monster.experience = 3120
monster.outfit = {
	lookType = 1562,
}

monster.raceId = 2259
monster.Bestiary = {
	class = "Elemental",
	race = BESTY_RACE_ELEMENTAL,
	toKill = 2500,
	FirstUnlock = 100,
	SecondUnlock = 1000,
	CharmsPoints = 50,
	Stars = 4,
	Occurrence = 0,
	Locations = "Great Pearl Fan Reef"
}

monster.health = 4500
monster.maxHealth = 4500
monster.race = "blood"
monster.corpse = 39344
monster.speed = 180
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 0
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = false,
	illusionable = true,
	canPushItems = false,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 2,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = false,
	canWalkOnPoison = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "splash", yell = false},
	{text = "gurgle", yell = false},
	{text = "dribble", yell = false}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = -30},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 80},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 20},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -100, maxDamage = -300},
	{name ="foamsplash", interval = 5000, chance = 50, minDamage = -100, maxDamage = -300},
	{name ="combat", interval = 2500, chance = 35, type = COMBAT_ICEDAMAGE, minDamage = -100, maxDamage = -300, length = 6, spread = 0, effect = CONST_ME_LOSEENERGY},
	{name ="combat", interval = 2000, chance = 45, type = COMBAT_ICEDAMAGE, minDamage = -100, maxDamage = -300, range = 4, radius = 1, target = true, effect = CONST_ME_ICEATTACK, shootEffect = CONST_ANI_ICE},
	{name ="combat", interval = 1000, chance = 15, type = COMBAT_ICEDAMAGE, minDamage = -100, maxDamage = -300, radius = 4, target = false, effect = CONST_ME_ICEAREA}
}

monster.defenses = {
	defense = 64,
	armor = 64,
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_HEALING, minDamage = 80, maxDamage = 113}
}

monster.loot = {
	{name = "Platinum Coin", chance = 60000, minCount = 1, maxCount = 20},
	{name = "Strong Mana Potion", chance = 36011},
	{name = "Glacier Shoes", chance = 36011},
	{name = "White Pearl", chance = 36011},
	{name = "Black Pearl", chance = 36011},
	{name = "Remains of a Fish", chance = 36011},
	{id = 3130, chance = 36011},
	{name = "Halberd", chance = 36011},
	{name = "Spike Sword", chance = 36011},
	{id = 3289, chance = 36011},
	{name = "Combat Knife", chance = 36011},
	{name = "Orichalcum Pearl", chance = 36011},
	{name = "Coral Branch", chance = 36011},
	{name = "Flotsam", chance = 36011},
	{id = 281, chance = 10214},
	{name = "Terra Boots", chance = 11422},
	{id = 282, chance = 10014},
	{name = "Small Diamond", chance = 10324},
	{name = "Small Emerald", chance = 9545, minCount = 1, maxCount = 2},
	{name = "Knight Legs", chance = 12014},
	{name = "Soul Orb", chance = 10478},
	{name = "Violet Gem", chance = 3210},
	{name = "Mercenary Sword", chance = 2001},
}

mType:register(monster)























