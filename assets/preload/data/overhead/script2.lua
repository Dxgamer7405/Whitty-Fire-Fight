function onCreate()
    makeAnimatedLuaSprite('echo','overhead/Words/Echo', defaultBoyfriendX+200, defaultBoyfriendY+700)
	addAnimationByPrefix('echo','enable','Echo Ability',24, false)
    addLuaSprite('echo', true)
    setProperty('echo.visible', false)
    objectPlayAnimation('echo', 'enable')

    makeAnimatedLuaSprite('fighttext','overhead/Words/Text', defaultBoyfriendX+225, defaultBoyfriendY+175)
	addAnimationByPrefix('fighttext','fight','Text',24, false)
    addLuaSprite('fighttext', true)
    setProperty('fighttext.visible', false)
    objectPlayAnimation('fighttext', 'fight')
end


function onStepHit()
    if curStep == 185 then
        setProperty('echo.visible', true)
        objectPlayAnimation('echo', 'enable')
    end

    if curStep == 160 then
        setProperty('fighttext.visible', true)
        objectPlayAnimation('fighttext', 'fight')
    end
    if curStep == 476 then
        objectPlayAnimation('echo', 'enable')
    end
end