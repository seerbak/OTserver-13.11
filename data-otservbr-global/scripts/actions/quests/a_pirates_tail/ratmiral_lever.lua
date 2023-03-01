local config = {
	bossName = "Ratmiral Blackwhiskers",
	requiredLevel = 250,
	timeToFightAgain = 20, -- In hour
	timeToDefeatBoss = 20, -- In minutes
	playerPositions = {
		{pos = Position(33893, 31388, 15), teleport = Position(33904, 31356, 14), effect = CONST_ME_TELEPORT},
		{pos = Position(33894, 31388, 15), teleport = Position(33904, 31356, 14), effect = CONST_ME_TELEPORT},
		{pos = Position(33895, 31388, 15), teleport = Position(33904, 31356, 14), effect = CONST_ME_TELEPORT},
		{pos = Position(33896, 31388, 15), teleport = Position(33904, 31356, 14), effect = CONST_ME_TELEPORT},
		{pos = Position(33897, 31388, 15), teleport = Position(33904, 31356, 14), effect = CONST_ME_TELEPORT}
	},
	bossPosition = Position(33904, 31351, 14),
	specPos = {
		from = Position(33888, 31344, 14),
		to = Position(33920, 31376, 15)
	},
	exit = Position(33891, 31197, 7),
	storage = Storage.Quest.U12_60.APiratesTail.RatmiralTimer
}

local ratmiralLever = Action()
function ratmiralLever.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if config.playerPositions[1].pos ~= player:getPosition() then
		return false
	end
	local spec = Spectators()
	spec:setMultiFloor(true)
	spec:setOnlyPlayer(false)
	spec:setRemoveDestination(config.exit)
	spec:setCheckPosition(config.specPos)
	spec:check()
	if spec:getPlayers() > 0 then
		player:say("There's someone fighting with " .. config.bossName .. ".", TALKTYPE_MONSTER_SAY)
		return true
	end
	local lever = Lever()
	lever:setPositions(config.playerPositions)
	lever:setCondition(function(creature)
		if not creature or not creature:isPlayer() then
			return true
		end
		if creature:getLevel() < config.requiredLevel then
			creature:sendTextMessage(MESSAGE_EVENT_ADVANCE, "All the players need to be level " .. config.requiredLevel .. " or higher.")
			return false
		end
		if creature:getStorageValue(config.storage) > os.time() then
			local info = lever:getInfoPositions()
			for _, v in pairs(info) do
				local newPlayer = v.creature
				if newPlayer then
					newPlayer:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You or a member in your team have to wait " .. config.timeToFightAgain .. " hours to face ".. config.bossName .. " again!")
					if newPlayer:getStorageValue(config.storage) > os.time() then
						newPlayer:getPosition():sendMagicEffect(CONST_ME_POFF)
					end
				end
			end
			return false
		end
		return true
	end)
	lever:checkPositions()
	if lever:checkConditions() then
		spec:removeMonsters()
		local monster = Game.createMonster(config.bossName, config.bossPosition, true, true)
		if not monster then
			return true
		end
		lever:teleportPlayers()
		lever:setStorageAllPlayers(config.storage, os.time() + config.timeToFightAgain * 3600)
		addEvent(function()
			local old_players = lever:getInfoPositions()
			spec:clearCreaturesCache()
			spec:setOnlyPlayer(true)
			spec:check()
			local player_remove = {}
			for i, v in pairs(spec:getCreatureDetect()) do
				for _, v_old in pairs(old_players) do
					if v_old.creature == nil or v_old.creature:isMonster() then
						break
					end
					if v:getName() == v_old.creature:getName() then
						table.insert(player_remove, v_old.creature)
						break
					end
				end
			end
			spec:removePlayers(player_remove)
		end, config.timeToDefeatBoss * 60 * 1000)
	end
end

ratmiralLever:position({x = 33892, y = 31388, z = 15})
ratmiralLever:register()