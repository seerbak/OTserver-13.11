local setting = {
	[5468] = 5512,
	[5469] = 5514
}

local sugarOat = Action()

function sugarOat.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local targetId = target.itemid
	if targetId == 3605 then
		if toPosition.x ~= CONTAINER_POSITION then
			Game.createItem(12802, 1, toPosition)
		else
			player:addItem(12802, 1)
			toPosition = player:getPosition()
		end
		toPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
		item:remove(1)
		target:remove(1)
	else
		local machine = setting[targetId]
		if machine then
			target:transform(machine)
			target:decay()
			item:remove(1)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
		end
	end
	return true
end

sugarOat:id(5466)
sugarOat:register()
