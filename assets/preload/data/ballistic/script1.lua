local fireblasts = true
local iceblasts = true
function onCreate()

    precacheImage('ballistic/Updike Midsong Cutscene');
    precacheImage('ballistic/snow');
    
    makeAnimatedLuaSprite('fireBlastMulty','ballistic/Multi Color Blasts',600,300)
	addAnimationByPrefix('fireBlastMulty','left','Orange Blast',24, false)
	addAnimationByPrefix('fireBlastMulty','right','Green Blast',24, false)
	addAnimationByPrefix('fireBlastMulty','down','Pink Blast',24, false)
	addAnimationByPrefix('fireBlastMulty','up','Blue Blast',24, false)
    addLuaSprite('fireBlastMulty', true)
    setProperty('fireBlastMulty.visible', false)

    makeAnimatedLuaSprite('iceBlast1','ballistic/Ice Blast',600,300)
	addAnimationByPrefix('iceBlast1','sing','Ice Blast Down',24, false)
    addLuaSprite('iceBlast1', true)
    objectPlayAnimation('iceBlast1','sing')
    setProperty('iceBlast1.visible', false)

end


function onUpdate()
    setProperty('iceBlast1.x', (getProperty('dad.x')+100))
    setProperty('iceBlast1.y', (getProperty('dad.y')+100))

    setProperty('iceBlast2.x', (getProperty('dad.x')+100))
    setProperty('iceBlast2.y', (getProperty('dad.y')+100))

    setProperty('iceBlast3.x', (getProperty('dad.x')+100))
    setProperty('iceBlast3.y', (getProperty('dad.y')+100))

    setProperty('iceBlast4.x', (getProperty('dad.x')+100))
    setProperty('iceBlast4.y', (getProperty('dad.y')+100))

    setObjectOrder('fireBlastMulty', 82)
    setObjectOrder('iceBlast', 83)
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	-- Function called when you hit a note (after note hit calculations)
	-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
	-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
	-- noteType: The note type string/tag
	-- isSustainNote: If it's a hold note, can be either true or false
    if getProperty('boyfriend.animation.curAnim.name') == 'hit1' then
    if direction == 0 then
        objectPlayAnimation('fireBlastMulty', 'left', false)
        setProperty('fireBlastMulty.visible', true)
        runTimer('removeLeft', 0.4)
    elseif direction == 1 then
        objectPlayAnimation('fireBlastMulty', 'down', false)
        setProperty('fireBlastMulty.visible', true)
        runTimer('removeDown', 0.4)
    elseif direction == 2 then
        objectPlayAnimation('fireBlastMulty', 'up', false)
        setProperty('fireBlastMulty.visible', true)
        runTimer('removeUp', 0.4)
    elseif direction == 3 then
        objectPlayAnimation('fireBlastMulty', 'right', false)
        setProperty('fireBlastMulty.visible', true)
        runTimer('removeRight', 0.4)
    end
end
end

function onTimerCompleted(tag)
    if tag == 'removeRight' then
        setProperty('fireBlastMulty.visible', false)
    end
    if tag == 'removeUp' then
        setProperty('fireBlastMulty.visible', false)
    end
    if tag == 'removeDown' then
        setProperty('fireBlastMulty.visible', false)
    end
    if tag == 'removeLeft' then
        setProperty('fireBlastMulty.visible', false)
    end
    if tag == 'removeIceBlast1' then
        setProperty('iceBlast1.visible', false)
        setProperty('iceBullet.visible', false)
    end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
    if iceblasts == true then
    if direction == 0 then
        objectPlayAnimation('iceBlast1','sing')
        setProperty('iceBlast1.visible', true)
        runTimer('removeIceBlast1', 0.2)
    elseif direction == 1 then
        objectPlayAnimation('iceBlast1','sing')
        setProperty('iceBlast1.visible', true)
        runTimer('removeIceBlast1', 0.2)
    elseif direction == 2 then
        objectPlayAnimation('iceBlast1','sing')
        setProperty('iceBlast1.visible', true)
        runTimer('removeIceBlast1', 0.2)
    elseif direction == 3 then
        objectPlayAnimation('iceBlast1','sing')
        setProperty('iceBlast1.visible', true)
        runTimer('removeIceBlast1', 0.2)
    end
end
    
end


function onStepHit()
    if curStep == 672 then
        iceblasts = false
    end
    if curStep == 1056 then
        iceblasts = true
    end
    if curStep == 1184 then
        iceblasts = false
    end
    if curStep == 1568 then
        iceblasts = true
    end
end