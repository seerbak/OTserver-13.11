local mType = Game.createMonsterType("Magma Bubble")
local monster = {}

monster.description = "Magma Bubble"
monster.experience = 80000
monster.outfit = {
	lookType = 1413,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 2036
monster.health = 200000
monster.maxHealth = 200000
monster.race = "blood"
monster.corpse = 0
monster.speed = 0
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 0
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
	rewardBoss = true,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 1,
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
	chance = 0
}

monster.loot = {
    {id = 39040, chance = 1100}, -- fiery tear
	{id = 39543, chance = 1000}, -- smoldering eye
	{id = 39544, chance = 1000}, -- firefighting axe
	{id = 39545, chance = 1000}, -- portable flame
	{name = "Ultimate Spirit Potion", chance = 50000, maxCount = 6},
	{name = "Crystal Coin", chance = 50000, maxCount = 5 },
	{name = "Ultimate Mana Potion", chance = 50000, maxCount = 14},
	{name = "Supreme Health Potion", chance = 50000, maxCount = 6},
	{name = "Gold Token", chance = 50000, maxCount = 2},
	{name = "Silver Token", chance = 100000, maxCount = 2},
	{id = 30059, chance = 10000}, -- giant ruby
	{id = 30060, chance = 10000}, -- giant emerald
	{id = 30061, chance = 10000}, -- giant sapphire
	{id = 32622, chance = 10000}, -- giant amethyst
	{id = 32623, chance = 10000}, -- giant topaz
	{id = 7439, chance = 10000}, -- berserk potion
	{id = 7440, chance = 10000}, -- mastermind potion
	{id = 7443, chance = 10000}, -- bullseye potion
	{id= 39147, chance = 1900, unique = true}, -- spiritthorn armor
	{id = 39148, chance = 2000, unique = true}, -- spiritthorn helmet
	{id = 39149, chance = 2500, unique = true}, -- spiritthorn headguard
	{id = 39150, chance = 2400, unique = true}, -- alicorn quiver
	{id = 39151, chance = 2300, unique = true}, -- arcanomancer regalia
	{id = 39152, chance = 2200, unique = true}, -- arcanomancer folio
	{id = 39153, chance = 2100, unique = true}, -- arboreal crown
	{id = 39154, chance = 1800, unique = true}, -- arboreal tome
	{id = 39177, chance = 1700, unique = true}, -- spiritthorn ring
	{id = 39182, chance = 1600, unique = true}, -- alicorn ring
	{id = 39185, chance = 1500, unique = true}, -- arcanomancer sigil
	{id = 39188, chance = 1800, unique = true} -- arboreal ring

}

monster.attacks = {

	{name ="melee", interval = 2000, chance = 100, minDamage = 450, maxDamage = -3000},
	{name ="combat", interval = 3000, chance = 15, type = COMBAT_LIFEDRAIN, minDamage = -300, maxDamage = -455, range = 3, radius = 11, shootEffect = CONST_ANI_EXPLOSION, effect = CONST_ME_MAGIC_RED, target = true},
	{name ="combat", interval = 3000, chance = 15, type = COMBAT_FIREDAMAGE, minDamage = -300, maxDamage = -455, range = 3, radius = 3, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_HITBYFIRE, target = true},
	{name ="combat", interval = 2000, chance = 50, type = COMBAT_LIFEDRAIN, minDamage = -500, maxDamage = -1250, length = 8, spread = 8, shootEffect = CONST_ANI_EXPLOSION, effect = CONST_ME_MAGIC_RED, target = false},
    {name ="combat", interval = 2000, chance = 85, type = COMBAT_FIREDAMAGE, minDamage = -550, maxDamage = -750, radius = 6, effect = CONST_ME_MORTAREA, target = false}
	
	}

monster.defenses = {
	defense = 68,
	armor = 72,
	{name ="combat", interval = 10000, chance = 1, type = COMBAT_HEALING, minDamage = -800, maxDamage = 1200, effect = CONST_ME_INSECTS, target = false}
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
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = true},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType.onThink = function(monster, interval)
end

mType.onAppear = function(monster, creature)
	if monster:getType():isRewardBoss() then
		monster:setReward(true)
	end
end

mType.onDisappear = function(monster, creature)
end

mType.onMove = function(monster, creature, fromPosition, toPosition)
end

mType.onSay = function(monster, creature, type, message)
end

mType:register(monster)