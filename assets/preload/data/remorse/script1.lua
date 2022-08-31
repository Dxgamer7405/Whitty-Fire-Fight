local allowCountdown = false
function onCreate()
    makeLuaSprite('fade','stages/Fade1', -50, 0)
    setObjectCamera('fade', 'other')
    addLuaSprite('fade', true)
end

function onSongStart()
    doTweenY('fadeup', 'fade', -2000, 1, 'linear')
end