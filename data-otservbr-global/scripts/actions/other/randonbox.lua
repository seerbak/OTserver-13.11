local rewards = {
    { id = 34154, name = "lion shield" },
    { id = 6529, name = "Pair of Soft Boots" },
    { id = 27457, name = "wand of destruction" },
    { id = 27647, name = "Gnome Helmet" },
    { id = 27649, name = "Gnome Legs" },
    { id = 20090, name = "Umbral Master Spellbook" },
    { id = 31581, name = "Bow of Cataclysm" },
    { id = 3398, name = "dwarven legs" },
    { id = 30394, name = "Cobra Boots" },
    { id = 32617, name = "Fabulous Legs" },
    { id = 27648, name = "Gnome Armor" },
    { id = 30400, name = "Cobra Rod" },
    { id = 31577, name = "Terra Helmet" },
    { id = 34253, name = "Lion Axe" },
    { id = 20078, name = "Umbral Master Mace" },
    { id = 20066, name = "Umbral Masterblade" },
    { id = 3399, name = "Elven Mail" },
    { id = 32628, name = "Ghost Chestplate" }
}

local bagyouDesire = Action()

function bagyouDesire.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local randId = math.random(1, #rewards)
	local rewardItem = rewards[randId]

	player:addItem(rewardItem.id, 1)
	item:remove(1)

	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You received a ' .. rewardItem.name .. '.')
	return true
end

bagyouDesire:id(19397)
bagyouDesire:register()
