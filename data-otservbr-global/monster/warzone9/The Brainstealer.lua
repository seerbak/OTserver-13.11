local mType = Game.createMonsterType("The Brainstealer")
local monster = {}

monster.description = "a The Brainstealer"
monster.experience = 45500
monster.outfit = {
	lookType = 1412,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 75000
monster.maxHealth = 75000
monster.race = "blood"
monster.corpse = 36843
monster.speed = 300
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
	rewardBoss = true,
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
	canWalkOnPoison = true,
	
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
	{name = "Berserk Potion", chance = 65888, minCount = 1, maxCount = 6},
	{name = "Bullseye Potion", chance = 45888, minCount = 1, maxCount = 14},
	{name = "Crystal Coin", chance = 45888, minCount = 1, maxCount = 5},
	{name = "Moonstone", chance = 45888, minCount = 1, maxCount = 5},
	{name = "Ultimate Mana Potion", chance = 45888, minCount = 1, maxCount = 13},
	{name = "Ultimate Spirit Potion", chance = 45888, minCount = 1, maxCount = 5},
	{name = "Violet Gem", chance = 11011},
	{name = "White Gem", chance = 11211},
	{name = "Supreme Health Potion", chance = 11451},
	{name = "Platinum Coin", chance = 10554},
	{name = "Brainstealer's Tissue", chance = 3011},
	{name = "Brainstealer's Brain", chance = 3014},
    {name = "Brainstealer's Brainwave", chance = 930},
    {name = "Eldritch Crystal", chance = 980},
    {name = "Eldritch Breeches", chance = 200},
	{name = "Eldritch Cowl", chance = 200},
	{name = "Eldritch Hood", chance = 200},
	{name = "Eldritch Bow", chance = 200},
	{name = "Eldritch Quiver", chance = 200},
	{name = "Eldritch Claymore", chance = 200},
	{name = "Eldritch Greataxe", chance = 200},
	{name = "Eldritch Warmace", chance = 200},
	{name = "Eldritch Shield", chance = 200},
	{id = 39233, chance = 200},
    {name = "Eldritch Cuirass", chance = 200},
	{name = "Eldritch Folio", chance = 200},
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 450, maxDamage = -1000},
    {name ="combat", interval = 2000, chance = 85, type = COMBAT_FIREDAMAGE, minDamage = -350, maxDamage = -550, radius = 6, effect = CONST_ME_HITBYFIRE, target = false},
	{name ="combat", interval = 3000, chance = 85, type = COMBAT_FIREDAMAGE, minDamage = -350, maxDamage = -550, radius = 9, effect = CONST_ME_HITBYFIRE, target = false},
	{name ="combat", interval = 4000, chance = 85, type = COMBAT_FIREDAMAGE, minDamage = -350, maxDamage = -550, radius = 11, effect = CONST_ME_HITBYFIRE, target = false},
	{name ="combat", interval = 2000, chance = 50, type = COMBAT_PHYSICALDAMAGE, minDamage = -500, maxDamage = -1000, length = 8, spread = 8, shootEffect = CONST_ME_EXPLOSION, effect = CONST_ME_EXPLOSIONAREA, target = false},
	{name ="combat", interval = 2000, chance = 50, type = COMBAT_LIFEDRAIN, minDamage = -150, maxDamage = -350, length = 8, spread = 0, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYHIT, target = false},
	{name ="combat", interval = 2000, chance = 50, type = COMBAT_DEATHDAMAGE, minDamage = -150, maxDamage = -350, length = 8, spread = 0, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA, target = false},
	{name ="combat", interval = 3000, chance = 15, type = COMBAT_ENERGYDAMAGE, minDamage = 150, maxDamage = -350, range = 8, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_PURPLEENERGY, target = true}
	}

monster.defenses = {
	defense = 68,
	armor = 72,
	{name ="combat", interval = 10000, chance = 1, type = COMBAT_HEALING, minDamage = -800, maxDamage = 1200, effect = CONST_ME_INSECTS, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 10},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 10},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 10}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType.onAppear = function(monster, creature)
	if monster:getType():isRewardBoss() then
		monster:setReward(true)
	end
end

mType:register(monster)
