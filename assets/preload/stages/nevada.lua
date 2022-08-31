function onCreate()

   

    makeAnimatedLuaSprite('bg', 'stages/Chase Stage Old', -150, -70)
    addAnimationByPrefix('bg', 'idle', 'Stage 1', 24, true)
    addLuaSprite('bg', false)
    objectPlayAnimation('bg', 'idle', true)
    scaleObject('bg', 1.15, 1.15)
    makeAnimatedLuaSprite('drone1', 'stages/Drone', -240, 310)
    scaleObject('drone1', 1.1, 1.1)
    addAnimationByPrefix('drone1', 'idle', 'LazerSkate Robo idle', 24, true)
    addAnimationByPrefix('drone1', 'shoot', 'LazerSkate Robo shoot', 24, true)
    addAnimationByPrefix('drone1', 'dies', 'LazerSkate Robo headshot', 24, false)
    addLuaSprite('drone1', true)
    objectPlayAnimation('drone1', 'idle', true)



    makeAnimatedLuaSprite('drone2', 'stages/Drone', 100, 310)
    scaleObject('drone2', 0.9, 0.9)
    addAnimationByPrefix('drone2', 'idle', 'LazerSkate Robo idle', 24, true)
    addAnimationByPrefix('drone2', 'shoot', 'LazerSkate Robo shoot', 24, true)
    addAnimationByPrefix('drone2', 'dies', 'LazerSkate Robo headshot', 24, false)
    addLuaSprite('drone2', false)
    objectPlayAnimation('drone2', 'idle', true)


    --setProperty('skipCountdown', true)

    addCharacterToList('UpSkate Conf', 'dad')
    addCharacterToList('UpSkate Fused', 'dad')
    addCharacterToList('UpSkate Concerned', 'dad')
end


function onCreatePost()
    doTweenX('sundaytween1', 'gf', -800, 0.001, 'linear')
    doTweenX('drone2tween1', 'drone2', -800, 0.001, 'linear')
    doTweenX('dronetween1', 'drone1', -800, 0.001, 'linear')
    triggerEvent("Camera Follow Pos", '855', '475')
end

function onStepHit()
    if curStep == 284 then
        doTweenX('drone2tween22', 'drone2', 140, 1.2, 'sineOut')
    end
    if curStep == 288 then
        triggerEvent('Change Character', '1', 'UpSkate Conf')
        doTweenX('dronetween22', 'drone1', -180, 1, 'sineOut')


    end
    if curStep == 468 then
        objectPlayAnimation('drone2', 'shoot', true)
        objectPlayAnimation('blast2', 'idle', true)
    end

    if curStep == 472 then
        objectPlayAnimation('drone2', 'shoot', true)
        objectPlayAnimation('blast2', 'idle', true)
    end

    if curStep == 475 then
        objectPlayAnimation('drone2', 'idle', true)
    end

    if curStep == 444 then
        objectPlayAnimation('drone1', 'shoot', true)
        objectPlayAnimation('blast', 'idle', true)
    end

    if curStep == 447 then
        objectPlayAnimation('drone1', 'idle', true)
    end

    if curStep == 469 then
        objectPlayAnimation('drone1', 'shoot', true)
        objectPlayAnimation('blast', 'idle', true)
    end

    if curStep == 472 then
        objectPlayAnimation('drone1', 'idle', true)
    end

    if curStep == 476 then
        objectPlayAnimation('drone1', 'shoot', true)
        objectPlayAnimation('blast', 'idle', true)
    end

    if curStep == 479 then
        objectPlayAnimation('drone1', 'idle', true)
    end

    if curStep == 594 then
        objectPlayAnimation('drone1', 'shoot', true)
        objectPlayAnimation('blast', 'idle', true)
    end

    if curStep == 596 then
        objectPlayAnimation('drone2', 'shoot', true)
        objectPlayAnimation('blast2', 'idle', true)
    end

    if curStep == 599 then
        objectPlayAnimation('drone2', 'idle', true)
    end

    if curStep == 600 then
        objectPlayAnimation('drone2', 'shoot', true)
        objectPlayAnimation('blast2', 'idle', true)
    end

    if curStep == 603 then
        objectPlayAnimation('drone2', 'idle', true)
    end

    if curStep == 672 then
        triggerEvent('Change Character', '1', 'UpSkate Fused')
    end

    if curStep == 597 then
        objectPlayAnimation('drone1', 'idle', true)
        objectPlayAnimation('blast', 'idle', true)
    end

    if curStep == 822 then
        objectPlayAnimation('drone1', 'dies', true)
        triggerEvent('Play Animation', 'shoot', 'gf')
        --Might Need Code Here
    end
    
    --[[triggerEvent('Change Character','0', 'Flying Whitty Idle')
        triggerEvent('Play Animation','idle', 'bf')
        setProperty('boyfriend.x', 1000)
        setProperty('boyfriend.y', 200)]]
    if curStep == 826 then
        triggerEvent('Play Animation', 'shoot', 'gf')
        objectPlayAnimation('drone2', 'dies', true)
    end

    if curStep == 828 then
        triggerEvent('Play Animation', 'shoot', 'gf')
        objectPlayAnimation('drone1', 'dies', true)
    end


    if curStep == 830 then
        doTweenX('drone2tween1', 'drone2', -800, 0.001, 'linear')
        doTweenX('drone2tween2', 'drone2', 140, 1, 'sineOut')
        objectPlayAnimation('drone2', 'idle', true)
    end

    if curStep == 833 then
        doTweenX('dronetween1', 'drone1', -800, 0.001, 'linear')
        doTweenX('dronetween2', 'drone1', -180, 1, 'sineOut')
        objectPlayAnimation('drone1', 'idle', true)
        
    end

    if curStep == 656 then
        doTweenX('sundaytween2', 'gf', 400, 1, 'sineOut')
    end
    if curStep == 927 then
        triggerEvent('Play Animation', 'carol', 'gf')
    end
    if curStep == 943 then
        setProperty('gf.visible', false)
        triggerEvent('Change Character', '1', 'UpSkate Conf')
    end


    if curStep == 1200 then
        triggerEvent('Change Character', '1', 'UpSkate Concerned')
    end
end

function onSongStart()

    makeAnimatedLuaSprite('credits', 'stages/Credits Acc', 775, 575)
    addAnimationByPrefix('credits', 'idle', 'Credits Accel', 24, false)
    addLuaSprite('credits', true)
    objectPlayAnimation('credits', 'idle', true)
    setObjectCamera('credits', 'other')
    scaleObject('credits', 0.75, 0.75)

    makeAnimatedLuaSprite('fades', 'stages/Fade', -150, -300)
    addAnimationByPrefix('fades', 'idle', 'Black Fade', 24, false)
    addLuaSprite('fades', true)
    objectPlayAnimation('fades', 'idle', true)

    --setObjectCamera('fade', 'hud')
end