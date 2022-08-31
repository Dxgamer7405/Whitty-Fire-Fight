function onCreatePost()
    --dont change or touch unless you have basic lua knowledge.

    makeAnimatedLuaSprite('neutral', 'icons/icon-whitty')
    makeAnimatedLuaSprite('danger', 'icons/icon-whitty')
    addAnimationByPrefix('neutral', 'neutral' , 'Idle', 24, true)
    addAnimationByPrefix('danger', 'danger', 'Lose' , 24, true)
    setObjectCamera('neutral', 'hud')
    setObjectCamera('danger', 'hud')
    addLuaSprite('neutral', true)
    addLuaSprite('danger', true)
    setProperty('iconP2.visible', false)
    scaleObject('neutral', 1, 1)
    scaleObject('danger', 1, 1)
end

function onUpdate(elapsed)

    setProperty('neutral.x', getProperty('iconP2.x'))
    setProperty('danger.x', getProperty('iconP2.x'))
    setProperty('neutral.y', getProperty('iconP2.y') + 10)
    setProperty('danger.y', getProperty('iconP2.y') + 10)

    if (getProperty('health') > 1.5) then
        setProperty('neutral.visible', false)
        setProperty('danger.visible', true)
    else
        setProperty('neutral.visible', true)
        setProperty('danger.visible', false)
    end
end