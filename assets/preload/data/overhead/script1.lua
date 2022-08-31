function onCreate()
    makeAnimatedLuaSprite('fireBlastbf','overhead/Fire Bullets',740,350)
	addAnimationByPrefix('fireBlastbf','bf','Fire Bullet Bf',24, false)
    addLuaSprite('fireBlastbf', true)
    setProperty('fireBlastbf.visible', false)

    makeAnimatedLuaSprite('fireBlastwhitty','overhead/Fire Bullets',480, 400)
	addAnimationByPrefix('fireBlastwhitty','bf','Fire Bullet Whitty',24, false)
    addLuaSprite('fireBlastwhitty', true)
    setProperty('fireBlastwhitty.visible', false)
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	-- Function called when you hit a note (after note hit calculations)
	-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
	-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
	-- noteType: The note type string/tag
	-- isSustainNote: If it's a hold note, can be either true or false
    if noteType == 'Fire Note' then
        objectPlayAnimation('fireBlastbf','bf', false)
        setProperty('fireBlastbf.visible', true)
        runTimer('removefireBlastbf', 0.05)

        if direction == 0 then
            setProperty('fireBlastbf.angle', 0)
            setProperty('fireBlastbf.y', 370)
        end
    
        if direction == 1 then
            setProperty('fireBlastbf.angle', 10)
            setProperty('fireBlastbf.y', 450)
        end
    
        
        if direction == 2 then
            setProperty('fireBlastbf.angle', 20)
            setProperty('fireBlastbf.y', 420)
        end
    
        if direction == 3 then
            setProperty('fireBlastbf.angle', 0)
            setProperty('fireBlastbf.y', 370)
        end
    end
    

end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	-- Function called when you hit a note (after note hit calculations)
	-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
	-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
	-- noteType: The note type string/tag
	-- isSustainNote: If it's a hold note, can be either true or false
    if noteType == 'Fire Note' then
        objectPlayAnimation('fireBlastwhitty','bf', false)
        setProperty('fireBlastwhitty.visible', true)
        runTimer('removefireBlastwhitty', 0.05)

        if direction == 0 then
            setProperty('fireBlastwhitty.angle', -5)
            setProperty('fireBlastwhitty.y', 370)
            setProperty('fireBlastwhitty.x', 390)
        end
        if direction == 1 then
            setProperty('fireBlastwhitty.angle', -5)
            setProperty('fireBlastwhitty.x', 620)
            setProperty('fireBlastwhitty.y', 500)
        end
        
        if direction == 2 then
            setProperty('fireBlastwhitty.angle', 0)
            setProperty('fireBlastwhitty.y', 400)
            setProperty('fireBlastwhitty.x', 480)
        end
        if direction == 3 then
            setProperty('fireBlastwhitty.angle', -5)
            setProperty('fireBlastwhitty.x', 620)
            setProperty('fireBlastwhitty.y', 500)
        end  

    


    end
end

function onTimerCompleted(tag)
    if tag == 'removefireBlastbf' then
        setProperty('fireBlastbf.visible', false)
    end

    if tag == 'removefireBlastwhitty' then
        setProperty('fireBlastwhitty.visible', false)
    end
end