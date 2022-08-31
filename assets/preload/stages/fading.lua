function onCreate()





    makeLuaSprite('sky', 'stages/Fading/Sky', 0, 0)
    addLuaSprite('sky', false)

    makeLuaSprite('City', 'stages/Fading/Fading Stage', 0, 0)
    addLuaSprite('City', false)

    makeLuaSprite('Overlay', 'stages/Fading/Fading White Overlay', 0, 0)
    addLuaSprite('Overlay', false)

    makeLuaSprite('Wind', 'stages/Fading/Wind', 10, 0)
    addLuaSprite('Wind', true)
    doTweenY('windtweenY1', 'Wind', -3000, 1, 'linear')
    setProperty('Wind.alpha', 0.14)
    scaleObject('Wind', 0.5, 0.5)

    makeAnimatedLuaSprite('credits', 'stages/Fading/Credits', 775, 575)
    addAnimationByPrefix('credits', 'idle', 'Fading Credits', 24, false)
    addLuaSprite('credits', true)

    setObjectCamera('credits', 'other')
    scaleObject('credits', 0.7, 0.7)
    setProperty('credits.visible', false)


    makeAnimatedLuaSprite('blackstuff', 'stages/Fading/Exit', 0, -1000)
    addAnimationByPrefix('blackstuff', 'idle', 'Exit Black Stuff', 24, false)
    setProperty('blackstuff.visible', false)
    addLuaSprite('blackstuff', true)

    setProperty('skipCountdown', true)


end

function onCreatePost()
    setProperty('gf.visible', false)
    

end



function onSongStart()

    triggerEvent('Camera Follow Pos', 1075, 700)
    doTweenY('bgtween', 'City', -1050, 40, 'linear')
    doTweenY('bgtween2', 'City.scale', 1.5, 40, 'linear')
    doTweenX('bgtween3', 'City.scale', 1.5, 40, 'linear')


end
function onStepHit()
    if curStep == 1 then
        
        doTweenY('uptweendownY', 'dad', 650, 3, 'quartOut')

        setProperty('camFollowPos.x', 1075)
        setProperty('camFollowPos.y', 700)

        
        noteTweenX('notetween4', 4, ((defaultOpponentStrumX0)), 2, 'elasticOut')
        noteTweenX('notetween5', 5, ((defaultOpponentStrumX1)), 2, 'elasticOut')
        noteTweenX('notetween6', 6, ((defaultOpponentStrumX2)), 2, 'elasticOut')
        noteTweenX('notetween7', 7, ((defaultOpponentStrumX3)), 2, 'elasticOut')

        noteTweenAlpha('alphatween0', 0, 0, 0.002, 'linear')
        noteTweenAlpha('alphatween1', 1, 0, 0.002, 'linear')
        noteTweenAlpha('alphatween2', 2, 0, 0.002, 'linear')
        noteTweenAlpha('alphatween3', 3, 0, 0.002, 'linear')
        
    end

    if curStep == 5 then
    setProperty('credits.visible', true)
    objectPlayAnimation('credits', 'idle', true)
    end

    if curStep == 16 then
        doTweenY('whittytweendownY', 'boyfriend', 100, 3, 'quartOut')

    end


    if curStep == 240 then
        doTweenY('whittytweenY', 'boyfriend', (50+403), 2.5, 'quartIn')
        doTweenX('whittytweenX', 'boyfriend', ((defaultBoyfriendX)-449), 2.5, 'quartIn')
        doTweenY('uptweenY', 'dad', (650+657), 2.5, 'quartIn')
    end

    if curStep == 247 then
        
    end

    if curStep == 255 then
        objectPlayAnimation('blackstuff', 'idle')
        setProperty('blackstuff.visible', true)
    end
end

function onTweenCompleted(tag)
    if tag == 'alphatween0' then
    noteTweenY('notetween02', 0, -1000, 0.001, 'linear')
    noteTweenY('notetween12', 1, -1000, 0.001, 'linear')
    noteTweenY('notetween22', 2, -1000, 0.001, 'linear')
    noteTweenY('notetween32', 3, -1000, 0.001, 'linear')
    end

    if tag == "windtweenY1" then
        doTweenY('windtweenY2', 'Wind', 0, 0.0001, 'linear')
    end

    if tag == "windtweenY2" then
        doTweenY('windtweenY1', 'Wind', -3000, 1, 'linear')
    end
end