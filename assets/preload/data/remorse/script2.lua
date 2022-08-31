function onCreatePost()
    
        doTweenAlpha('HealthAlpha', 'healthBar', 0, 0.0000001, 'linear')
        doTweenY('HealthUp', 'healthBar', -50, 0.0000001, 'linear')
        doTweenY('IconP1Up', 'iconP1', -150, 0.0000001, 'linear')
        doTweenY('IconP2Up', 'iconP2', -150, 0.0000001, 'linear')
        



end

function onCreate()
    if downScroll == true then
    makeLuaText('healths', 'Health: ' .. (getProperty('health')*50) ..'%', nil, 0, getProperty('scoreTxt.y')+35)
else
        makeLuaText('healths', 'Health: ' .. (getProperty('health')*50) ..'%', nil, 0, getProperty('scoreTxt.y')-35)
    end
    
    addLuaText('healths')
    setTextAlignment('healths', 'center')
    setTextSize('healths', 25)
    setObjectCamera('healths','hud')
         screenCenter('healths', 'X')
       doTweenY('HealthDown', 'healthBar', 344.8, 1.5, 'bounceOut')
       doTweenY('IconP1Down', 'iconP1', 309.8, 1.5, 'bounceOut')
       doTweenY('IconP2Down', 'iconP2', 269.8, 1.5, 'bounceOut')
end

function onSongStart()
        screenCenter('healths', 'X')
       doTweenY('HealthDown', 'healthBar', 344.8, 1.5, 'bounceOut')
       doTweenY('IconP1Down', 'iconP1', 309.8, 1.5, 'bounceOut')
       doTweenY('IconP2Down', 'iconP2', 269.8, 1.5, 'bounceOut')
end
local textcolor = 000001
function onUpdatePost()
    setTextFont('healths', 'ErasBoldITC.ttf')
    setTextBorder('healths', 0)
    if getProperty('health') < 0.5 then
        setTextColor('healths', 'ff0000')
    end
    if getProperty('health') > 0.5 and getProperty('health') < 1.5 then
        setTextColor('healths', 'ffffff')
    end
    if getProperty('health') > 1.5 then
        setTextColor('healths', '00ff00')
    end




    
	--setProperty('iconP1.x', 1030)
	setProperty('iconP1.y', getProperty('healthBar.y') + 250)
    setProperty('iconP1.x', getProperty('healthBar.x') + 1325)

    setProperty('iconP2.y', getProperty('healthBar.y') + 250)
    setProperty('iconP2.x', 0)

    setTextString('healths', 'Health: ' .. math.floor(getProperty('health')*50) ..'%')
    
    --setTextColor('healths', textcolor)
    --(round((getProperty('health')*50), 2))
    if health == 0.00001 then
        removeLuaText('healths')
    end
end