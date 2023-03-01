local mType = Game.createMonsterType("Kusuma")
local monster = {}

monster.description = "a kusuma"
monster.experience = 9380
monster.outfit = {
	lookType = 1068,
	lookHead = 90,
	lookBody = 99,
	lookLegs = 90,
	lookFeet = 3,
	lookAddons = 1,
	lookMount = 0
}

monster.raceId = 2036
monster.health = 7650
monster.maxHealth = 7650
monster.race = "blood"
monster.corpse = 28802
monster.speed = 320
monster.manaCost = 0


monster.changeTarget = {
	interval = 4000,
	chance = 10
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
	canWalkOnEnergy = false,
	canWalkOnFire = false,
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
	{name = "Gold Coin", chance = 45888, minCount = 0, maxCount = 220},
	{name = "Platinum Coin", chance = 45888, minCount = 0, maxCount = 9},
	{name = "Peacock Feather Fan", chance = 32014},
	{name = "Golden Lotus Brooch", chance = 32015},
	{name = "Ultimate Health Potion", chance = 36454, minCount = 0, maxCount = 6},
	{name = "Great Spirit Potion", chance = 36544, minCount = 0, maxCount = 2},
	{name = "Flask of Demonic Blood", chance = 35224, minCount = 0, maxCount = 4},
	{name = "Snakebite Rod", chance = 35244},
	{name = "Small Emerald", chance = 32121, minCount = 0, maxCount = 2},
	{name = "White Pearl", chance = 23253, minCount = 0, maxCount = 2},
	{id = 3007, chance = 20222},
	{name = "Gold Ingot", chance = 15000, minCount = 0, maxCount = 3},
	{name = "Green Piece of Cloth", chance = 23535},
	{name = "Soul Orb", chance = 32535},
	{name = "Blue Gem", chance = 10112},
	{name = "Demonic Essence", chance = 9556, minCount = 0, maxCount = 3},
	{name = "Muck Rod", chance = 3242},
	{name = "Necrotic Rod", chance = 3524},
	{name = "Oriental Shoes", chance = 3214},
	{name = "Terra Hood", chance = 3253},
	{name = "White Gem", chance = 3654},
	{name = "Terra Legs", chance = 504},
	{name = "Swamplair Armor", chance = 454},
	{name = "Giant Emerald", chance = 654},
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 450, maxDamage = -1000},
    {name ="combat", interval = 2000, chance = 85, type = COMBAT_DEATHDAMAGE, minDamage = -350, maxDamage = -550, radius = 6, effect = CONST_ME_MORTAREA, target = false},
	{name ="combat", interval = 2000, chance = 85, type = COMBAT_EARTHDAMAGE, minDamage = -350, maxDamage = -550, radius = 6, effect = CONST_ME_GREEN_RINGS, target = false},
	{name ="combat", interval = 2000, chance = 85, type = COMBAT_EARTHDAMAGE, minDamage = -350, maxDamage = -550, radius = 6, effect = CONST_ME_PLANTATTACK, target = false},
	{name ="combat", interval = 2000, chance = 85, type = COMBAT_EARTHDAMAGE, minDamage = -350, maxDamage = -550, radius = 6, effect = CONST_ME_STONES, target = false},
	{name ="combat", interval = 2000, chance = 50, type = COMBAT_PHYSICALDAMAGE, minDamage = -150, maxDamage = -350, length = 8, spread = 0, shootEffect = CONST_ME_BLOCKHIT, effect = CONST_ME_HITAREA, target = false},
	{name ="combat", interval = 3000, chance = 15, type = COMBAT_EARTHDAMAGE, minDamage = 150, maxDamage = -350, range = 8, shootEffect = CONST_ANI_SMALLEARTH, effect = CONST_ME_PLANTATTACK, target = true}
	}

monster.defenses = {
	defense = 68,
	armor = 72,
	{name ="combat", interval = 10000, chance = 1, type = COMBAT_HEALING, minDamage = -800, maxDamage = 1200, effect = CONST_ME_INSECTS, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = -10},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = -5},
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

mType.onAppear = function(monster, creature)
	if monster:getType():isRewardBoss() then
		monster:setReward(true)
	end
end

mType:register(monster)
