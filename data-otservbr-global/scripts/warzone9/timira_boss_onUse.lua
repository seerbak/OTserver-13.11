local config = {

[27502] = { -- Timira the Many-Headed.
    bossName ="Timira the Many-Headed", -- Nome do boss que vai ser criado.
	timeToEnterAgain = 20, -- Tempo em horas para se entrar no boss novamente.
	timeToKill = 10, -- tempo em minutos que o jogador tem pra matar o boss antes de ser kikado.
	exitPos = Position(33805, 32700, 8), -- Posição que o jogador será teleportado se ficar muito tempo dentro da sala.
	centerRoom = Position(33815, 32703, 9), -- Posição do meio da sala onde o boss irá nascer.
	bossPosition = Position(33815, 32707, 9), -- Posição que o boss irá nascer.
	positionToGo = Position(33812, 32699, 9), -- Posição para onde os jogadores serão teleportados.
	storageToKill = 700002,  -- Storage para verificar se o jogador pode fazer o bosso novamente.
	quantExactlyOfPlayers = false,	-- SELECIONAR TRUE PARA ATIVAR QUANTIDADES E FALSE PARA LIBERAR 	
	playersPositions = { -- Quantidade de players e suas posições para a lavanca funcionar.
		Position(33809, 32702, 8)	
  
  }
}
}
local function clearBossRoom(bossPosition)
	local spectators = Game.getSpectators(bossPosition, false, false, 10, 10, 10, 10)
	for i = 1, #spectators do
		local spectator = spectators[i]
		if spectator:isMonster() then
			spectator:remove()
		end
	end
end
local function removePlayerRoom(exitPosition, bossPosition)
	local spectators = Game.getSpectators(bossPosition, false, false, 10, 10, 10, 10)
	for i = 1, #spectators do
		local spectator = spectators[i]
        if spectator:isPlayer() then
        	spectator:teleportTo(exitPosition)
            spectator:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
            spectator:say('Time out! You were teleported out by strange forces.', TALKTYPE_MONSTER_SAY)		
        end
	end
end
local timiraroom = Action()
function timiraroom.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if config[item.actionid] then -- Cheking if is boos room.
        -- Checks if you have players suffiently to this.
	    for i = 1, #config[item.actionid].playersPositions do
	    	local creature = Tile(config[item.actionid].playersPositions[i]):getTopCreature()
	        if not creature and config[item.actionid].quantExactlyOfPlayers then
	        	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("You need %d player to enter in %s boss room.", #config[item.actionid].playersPositions, config[item.actionid].bossName))
	        	return false
	        elseif creature and creature:getStorageValue(config[item.actionid].storageToKill) > os.time() then -- -- checking if player can fight it boss.
	        	player:say(os.date ("%d/%m/%Y - %H:%M:%S", player:getStorageValue(config[item.actionid].storageToKill, config[item.actionid].bossName)), TALKTYPE_MONSTER_SAY)
	        	return false
	        end
		end
        -- checking if have player inside of room.
	    local specs, spec = Game.getSpectators(config[item.actionid].centerRoom, false, false, 15, 15, 15, 15)
	    for i = 1, #specs do
	        spec = specs[i]
	        if spec:isPlayer() then
	            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Sorry, there are players still in the room.")
	            return false
	        end
	    end
		-- create boss
	    clearBossRoom(config[item.actionid].bossPosition)
	    Game.createMonster(config[item.actionid].bossName, config[item.actionid].bossPosition)
		Game.createMonster("Rogue Naga", {x = 33811, y = 32701, z = 9})
		Game.createMonster("Corrupt Naga", {x = 33819, y = 32700, z = 9})
	    -- teleporting players to boss room
        for i = 1, #config[item.actionid].playersPositions do
            local creature = Tile(config[item.actionid].playersPositions[i]):getTopCreature()
			local inuseroomsdelay = 600000 
            if creature and creature:isPlayer() then
                creature:teleportTo(config[item.actionid].positionToGo)
                creature:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
                addEvent(removePlayerRoom, config[item.actionid].timeToKill * 60 * 1000, config[item.actionid].exitPos, config[item.actionid].bossPosition)
                creature:setStorageValue(config[item.actionid].storageToKill, os.time() + config[item.actionid].timeToEnterAgain * 60 * 60)
				if config[item.actionid].globalStorage then
					setGlobalStorageValue(config[item.actionid].globalStorage, os.time() + inuseroomsdelay)
						addEvent(function()
							for i = 1, #specs do
							spec = specs[i]
							if not spec:isPlayer() then
								setGlobalStorageValue(config[item.actionid].globalStorage, 0)
							end
						end
					end, 150000)
				end	
			
			end
        end
	end
	return true
end
for index, value in pairs(config) do
	timiraroom:aid(index)
end
timiraroom:register()

--Exit Timira
local tplist = {
    [40112] = {name = "", positions = {{x = 33805, y = 32700, z = 8}}, subareas = {}}
}
local firstid = 40112 -- Put your first action id used here
local lastid = 40113 -- Put your last action id used here

-- Config End
local teleports = MoveEvent()
function teleports.onStepIn(player, item, position, fromPosition)
    if not player:isPlayer() then
        return false
    end
  
    local tp = tplist[item.actionid]
    local quantity = table.getn(tp.positions)
  
    player:registerEvent("Teleport_Modal_Window")
  
    local title = "Teleport"
    local message = "List of ".. tp.name .." Spawns"
      
    local window = ModalWindow(item.actionid, title, message)
    window:addButton(100, "Go")
    window:addButton(101, "Cancel")
      
    for i = 1, quantity do
        if tp.subareas[i] == nil then
            window:addChoice(i,"".. tp.name .." ".. i .."")
        else
            window:addChoice(i,"".. tp.subareas[i] .."")
        end
    end
  
    window:setDefaultEnterButton(100)
    window:setDefaultEscapeButton(101)
  
    if tp and quantity < 2 then
        player:unregisterEvent("Teleport_Modal_Window")
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, ''.. tp.name ..'.')
        player:getPosition():sendMagicEffect(38)
        player:teleportTo(tp.positions[1])
        player:getPosition():sendMagicEffect(38)
    else
        window:sendToPlayer(player)
    end
    return true
end

for j = firstid, lastid do
    teleports:aid(j)
end

teleports:type("stepin")
teleports:register()

local modalTp = CreatureEvent("Teleport_Modal_Window")
modalTp:type("modalwindow")

function modalTp.onModalWindow(player, modalWindowId, buttonId, choiceId)
    player:unregisterEvent("Teleport_Modal_Window")
    if modalWindowId >= firstid and modalWindowId <= lastid then
        if buttonId == 100 then
            player:getPosition():sendMagicEffect(38)
            player:teleportTo(tplist[modalWindowId].positions[choiceId])
            player:getPosition():sendMagicEffect(38)
            if tplist[modalWindowId].subareas[choiceId] == nil then
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Teleported to '.. tplist[modalWindowId].name ..' '.. choiceId ..'.')
            else
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Teleported to '.. tplist[modalWindowId].subareas[choiceId] ..'.')
            end
        end
    end
    return true
end

modalTp:register()
