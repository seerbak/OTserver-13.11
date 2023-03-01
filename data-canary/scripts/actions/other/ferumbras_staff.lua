local ferumbrasStaff = Action()

function ferumbrasStaff.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if math.random(100) > 20 then
		item:transform(22767)
	else
		item:transform(22766)
	end
	item:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
	item:decay()
	player:say("Magical sparks whirl around the staff and suddenly it changes its appearance.", TALKTYPE_MONSTER_SAY)
	return ActionsLib.destroyItem(player, target, toPosition)
end

ferumbrasStaff:id(22764)
ferumbrasStaff:register()
