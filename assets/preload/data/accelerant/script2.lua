function onCreate()
    makeAnimatedLuaSprite('scream', 'stages/sunday Scream', (getProperty('gf.x')+20), (getProperty('gf.y')-50))
    addAnimationByPrefix('scream', 'idle', 'Scream', 24, false)
    addLuaSprite('scream', true)
    objectPlayAnimation('scream', 'idle', true)
    setProperty('scream.visible', false)
end

function onStepHit()
    if curStep == 736 then
        objectPlayAnimation('scream', 'idle', true)
        setProperty('scream.visible', true)
    end
end