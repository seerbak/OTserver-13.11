local rope = Action()

function rope.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	return ActionsLib.useRope(player, item, fromPosition, target, toPosition, isHotkey)
end

rope:id(646, 3003)
rope:register()
