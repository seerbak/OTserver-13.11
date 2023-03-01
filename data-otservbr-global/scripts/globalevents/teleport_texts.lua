local effects = {
    {position = Position(32369, 32241, 7), text = 'Bienvenidos a TarapacaOT!', effect = CONST_ME_GROUNDSHAKER},
    {position = Position(32365, 32236, 7), text = 'TRAINERS', effect = CONST_ME_GROUNDSHAKER},
	{position = Position(32350, 32223, 7), text = 'TRAINERS', effect = CONST_ME_GROUNDSHAKER},
    {position = Position(32341, 32226, 7), text = 'Marapur NEW', effect = CONST_ME_GROUNDSHAKER},
    {position = Position(32341, 32221, 7), text = 'NPCS', effect = CONST_ME_GROUNDSHAKER},
    {position = Position(32353, 32223, 7), text = 'ARENA PVP', effect = CONST_ME_GROUNDSHAKER},
    {position = Position(32373, 32236, 7), text = 'EVENTS', effect = CONST_ME_GROUNDSHAKER},    
    {position = Position(1116, 1092, 7), text = 'ENTER', effect = CONST_ME_GROUNDSHAKER},
    {position = Position(33713, 31642, 14), text = 'REWARD SOULWAR QUEST', effect = CONST_ME_GROUNDSHAKER},
    {position = Position(1114, 1096, 7), text = 'EXIT', effect = CONST_ME_GROUNDSHAKER},  
}

local animatedText = GlobalEvent("AnimatedText") 
function animatedText.onThink(interval)
    for i = 1, #effects do
        local settings = effects[i]
        local spectators = Game.getSpectators(settings.position, false, true, 7, 7, 5, 5)
        if #spectators > 0 then
            if settings.text then
                for i = 1, #spectators do
                    spectators[i]:say(settings.text, TALKTYPE_MONSTER_SAY, false, spectators[i], settings.position)
                end
            end
            if settings.effect then
                settings.position:sendMagicEffect(settings.effect)
            end
        end
    end
   return true
end

animatedText:interval(4550)
animatedText:register()
