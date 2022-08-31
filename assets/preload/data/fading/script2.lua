local healthInf = true

function onCreate()
    if downScroll == true then
    makeLuaText('healths', 'Health: ' .. (getProperty('songMisses')) ..'/7', nil, 0, getProperty('scoreTxt.y')+35)
else
        makeLuaText('healths', 'Health: ' .. (getProperty('songMisses')) ..'/7', nil, 0, getProperty('scoreTxt.y')-35)
    end
    
    addLuaText('healths')
    setTextAlignment('healths', 'center')
    setTextSize('healths', 25)
    setObjectCamera('healths','hud')
end


local textcolor = 000001
function onUpdatePost()
    textcolor = textcolor+011111
    
	--setProperty('iconP1.x', 1030)
	setProperty('iconP1.y', getProperty('healthBar.y') + 250)
    setProperty('iconP1.x', getProperty('healthBar.x') + 1325)

    setProperty('iconP2.y', getProperty('healthBar.y') + 250)
    setProperty('iconP2.x', 0)
    screenCenter('healths', 'x')
    setTextString('healths', 'Misses: ' .. math.floor(getProperty('songMisses')) ..'/7')
    
    --setTextColor('healths', textcolor)
    --(round((getProperty('health')*50), 2))
    if health == 0.00001 then
        removeLuaText('healths')
    end
end


function onSongStart()
    doTweenAlpha('healthsfadeout', 'healths', 0.075, 1, 'linear')
end

function onCreatePost()
    setProperty('healthBar.visible', false)
    setProperty('healthBarBG.visible', false)
    setProperty('scoreTxt.visible', false)
    setProperty('iconP1.visible', false)
    setProperty('iconP2.visible', false)
end






-- addHaxeLibrary('Sys');runHaxeCode("Sys.exit(0);")