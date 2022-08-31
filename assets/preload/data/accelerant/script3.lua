function onCreate()
    makeAnimatedLuaSprite('gun', 'stages/Gun Throw', 625, 500)
    addAnimationByPrefix('gun', 'throw', 'Gun Throw', 24, false)
    addLuaSprite('gun', true)
    objectPlayAnimation('gun', 'throw', true)
    setProperty('gun.visible', false)
end

function onStepHit()
    if curStep == 832 then
        triggerEvent('Play Animation','throw', 'Gf')
--sunday throw
    end
    if curStep == 840 then
--throw    
    objectPlayAnimation('gun', 'throw', true)
    setProperty('gun.visible', true)
    end
    if curStep == 848 then
        triggerEvent('Change Character','0', 'Flying Whitty Catch')
        triggerEvent('Play Animation','idle', 'Bf')
        runTimer('catchtoidle', 0.6)
        setProperty('boyfriend.x', 1000)
        setProperty('boyfriend.y', 200)
        setProperty('gun.visible', false)
    end
end


function onTimerCompleted(tag)
    if tag == "catchtoidle" then
        if boyfriendName == 'Flying Whitty Catch' then
            triggerEvent('Change Character','0', 'Flying Whitty Idle')
            triggerEvent('Play Animation','idle', 'Bf')
            setProperty('boyfriend.x', 1000)
            setProperty('boyfriend.y', 200)
        end
    end
end