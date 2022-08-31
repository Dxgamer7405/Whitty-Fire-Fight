function onCreate()
    --    -1250, -1500
    makeAnimatedLuaSprite('blast2', 'stages/blast', 340, 125)
    addAnimationByPrefix('blast2', 'idle', 'Blast', 24, false)
    addLuaSprite('blast2', true)
    objectPlayAnimation('blast2', 'idle', true)

    makeAnimatedLuaSprite('bullet', 'stages/Shot', 450, -100)
    addAnimationByPrefix('bullet', 'idle', 'Shot', 24, false)
    addLuaSprite('bullet', true)
    objectPlayAnimation('bullet', 'idle', true)

    makeAnimatedLuaSprite('blast', 'stages/blast', 130, 150)
    addAnimationByPrefix('blast', 'idle', 'Blast', 24, false)
    addLuaSprite('blast', true)
    objectPlayAnimation('blast', 'idle', true)

    addCharacterToList('Flying Whitty Idle', 'bf')
    addCharacterToList('Flying Whitty Left', 'bf')
    addCharacterToList('Flying Whitty Up', 'bf')
    addCharacterToList('Flying Whitty Down', 'bf')
    addCharacterToList('Flying Whitty Right', 'bf')
    addCharacterToList('Flying Whitty Hit', 'bf')
    addCharacterToList('Flying Whitty Shoot', 'bf')
    addCharacterToList('Flying Whitty Scream', 'bf')
    addCharacterToList('Flying Whitty Catch', 'bf')

end
function goodNoteHit(id, direction, noteType, isSustainNote)
	-- Function called when you hit a note (after note hit calculations)
	-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
	-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
	-- noteType: The note type string/tag
	-- isSustainNote: If it's a hold note, can be either true or false
    if direction == 0 and noteType == "" then
        triggerEvent('Change Character', '0', 'Flying Whitty Left' )
        triggerEvent('Play Animation','idle', 'Bf')
        runTimer('lefttoidle', 0.4)

    end
    if direction == 1 and noteType == "" then
        triggerEvent('Change Character', '0', 'Flying Whitty Down')
        triggerEvent('Play Animation','idle', 'Bf')
        runTimer('downtoidle', 0.4)
    end

    if direction == 2 and noteType == "" then
        triggerEvent('Change Character','0', 'Flying Whitty Up')
        triggerEvent('Play Animation','idle', 'Bf')
        runTimer('uptoidle', 0.4)
    end

    if direction == 3 and noteType == "" then
        triggerEvent('Change Character','0', 'Flying Whitty Right')
        triggerEvent('Play Animation','idle', 'Bf')
        runTimer('righttoidle', 0.4)
    end

    if boyfriendName == 'Flying Whitty Down' or boyfriendName == 'Flying Whitty Left' then
        setProperty('boyfriend.x', 900)
        setProperty('boyfriend.y', 200)
    end
    if boyfriendName == 'Flying Whitty Up' or boyfriendName == 'Flying Whitty Right' then
        setProperty('boyfriend.x', 900)
        setProperty('boyfriend.y', 0)
    end
end
function onUpdate()
    if boyfriendName == 'Flying Whitty Hit' then
        setProperty('boyfriend.x', 950)
        setProperty('boyfriend.y', 150)
    end

end

function onStepHit()
    if curStep == 170 then
        triggerEvent('Change Character','0', 'Flying Whitty Hit')
        triggerEvent('Play Animation','idle', 'Bf')
        runTimer('hittoidle', 0.9)
        triggerEvent('Play Animation', 'shoot', 'Dad')
        objectPlayAnimation('bullet', 'idle', true)
        
    end



    if curStep == 200 then
        triggerEvent('Change Character','0', 'Flying Whitty Hit')
        triggerEvent('Play Animation','idle', 'Bf')
        runTimer('hittoidle', 0.9)
        triggerEvent('Play Animation', 'shoot', 'Dad')
        objectPlayAnimation('bullet', 'idle', true)
    end

    if curStep == 202 then
        triggerEvent('Change Character','0', 'Flying Whitty Hit')
        triggerEvent('Play Animation','idle', 'Bf')
        runTimer('hittoidle', 0.9)
        triggerEvent('Play Animation', 'shoot', 'Dad')
        objectPlayAnimation('bullet', 'idle', true)
    end



    if curStep == 444 then
        triggerEvent('Change Character','0', 'Flying Whitty Hit')
        triggerEvent('Play Animation','idle', 'Bf')
        runTimer('hittoidle', 0.9)
    end



    if curStep == 468 then
        triggerEvent('Change Character','0', 'Flying Whitty Hit')
        triggerEvent('Play Animation','idle', 'Bf')
        runTimer('hittoidle', 0.9)
    end
    if curStep == 469 then
        triggerEvent('Change Character','0', 'Flying Whitty Hit')
        triggerEvent('Play Animation','idle', 'Bf')
        runTimer('hittoidle', 0.9)
    end
    if curStep == 472 then
        triggerEvent('Change Character','0', 'Flying Whitty Hit')
        triggerEvent('Play Animation','idle', 'Bf')
        runTimer('hittoidle', 0.9)
    end

    if curStep == 476 then
        triggerEvent('Change Character','0', 'Flying Whitty Hit')
        triggerEvent('Play Animation','idle', 'Bf')
        runTimer('hittoidle', 0.9)
    end
    
    
    if curStep == 594 then
        triggerEvent('Change Character','0', 'Flying Whitty Hit')
        triggerEvent('Play Animation','idle', 'Bf')
        runTimer('hittoidle', 0.9)
    end

    if curStep == 596 then
        triggerEvent('Change Character','0', 'Flying Whitty Hit')
        triggerEvent('Play Animation','idle', 'Bf')
        runTimer('hittoidle', 0.9)
    end

    if curStep == 600 then
        triggerEvent('Change Character','0', 'Flying Whitty Hit')
        triggerEvent('Play Animation','idle', 'Bf')
        runTimer('hittoidle', 0.9) 
    end
end






function onTimerCompleted(tag)
    if tag == "screamtoidle" then
        if boyfriendName == 'Flying Whitty Scream' then
            triggerEvent('Change Character','0', 'Flying Whitty Idle')
            triggerEvent('Play Animation','idle', 'Bf')
            setProperty('boyfriend.x', 1000)
            setProperty('boyfriend.y', 200)
            
        end
    end

    if tag == "uptoidle" then
        if boyfriendName == 'Flying Whitty Up' then
            triggerEvent('Change Character','0', 'Flying Whitty Idle')
            triggerEvent('Play Animation','idle', 'Bf')
            setProperty('boyfriend.x', 1000)
            setProperty('boyfriend.y', 200)
        end
    end

    if tag == "downtoidle" then
        if boyfriendName == 'Flying Whitty Down' then
            triggerEvent('Change Character','0', 'Flying Whitty Idle')
            triggerEvent('Play Animation','idle', 'Bf')
            setProperty('boyfriend.x', 1000)
            setProperty('boyfriend.y', 200)
        end
    end
    if tag == "lefttoidle" then
        if boyfriendName == 'Flying Whitty Left' then
            triggerEvent('Change Character','0', 'Flying Whitty Idle')
            triggerEvent('Play Animation','idle', 'Bf')
            setProperty('boyfriend.x', 1000)
            setProperty('boyfriend.y', 200)
        end
    end

    if tag == "righttoidle" then
        if boyfriendName == 'Flying Whitty Right' then
            triggerEvent('Change Character','0', 'Flying Whitty Idle')
            triggerEvent('Play Animation','idle', 'Bf')
            setProperty('boyfriend.x', 1000)
            setProperty('boyfriend.y', 200)
        end
    end

    if tag == "hittoidle" then
        if boyfriendName == 'Flying Whitty Hit' then
            triggerEvent('Change Character','0', 'Flying Whitty Idle')
            triggerEvent('Play Animation','idle', 'Bf')
            setProperty('boyfriend.x', 1000)
            setProperty('boyfriend.y', 200)
        end
    end

    if tag == "shoottoidle" then
        if boyfriendName == 'Flying Whitty Shoot' then
            triggerEvent('Change Character','0', 'Flying Whitty Idle')
            triggerEvent('Play Animation','idle', 'Bf')
            setProperty('boyfriend.x', 1000)
            setProperty('boyfriend.y', 200)
        end
    end
end