local allowCountdown = false

blockStart = true;
bfAnimatedIcon = false
addHealth = true

function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.1 then
        setProperty('health', health- 0.0195);
    end
end

local xx = 520;
local yy = 450;
local xx2 = 820;
local yy2 = 450;
local ofs = 60;
local followchars = true;
local del = 0;
local del2 = 0;



local Strums = 'opponentStrums'
function onCreate()
    setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-fire-death');
         --Character json file for the death animation
        addCharacterToList('bf-fire-death', 'boyfriend')
    --precacheImage('overhead/circle/power');
    makeAnimatedLuaSprite('lvlup', 'Circle', 700, 80)
    addAnimationByPrefix('lvlup', 'heat', 'Circle', 24, false)


    makeAnimatedLuaSprite('fall', 'overhead/Dia2/Fall', 45, 400)
    addAnimationByPrefix('fall', 'text', 'Text Fall', 24, false)
    setProperty("fall.scale.x", 0.85)
    setProperty("fall.scale.y", 0.85);

    makeAnimatedLuaSprite('heated', 'overhead/Words/Heated', 400, 20)
	addAnimationByPrefix('heated', 'heat', 'Heat', 24, false)

        
        makeAnimatedLuaSprite('animatediconbf', 'icons/bf-fire-icon', getProperty('iconP1.x'), getProperty('iconP1.y'))
        addAnimationByPrefix('animatediconbf', 'normal', 'BF Flame winnin icon', 24, true)
        addAnimationByPrefix('animatediconbf', 'losing', 'BF Flame even icon ', 24, true)
        setObjectCamera('animatediconbf', 'hud')
        setObjectOrder('animatediconbf', getProperty('iconP1') + 1)
        addCharacterToList('BF Powerup', 'boyfriend')

    

end
function onSongStart()
end

function onStepHit()
    if curStep == 1 then
        triggerEvent('Camera Follow Pos', '840', '400')
    end

    if curStep == 63 then
        triggerEvent('Change Character', '2', 'gfleft')
    end

    if curStep == 64 then
        triggerEvent('Play Animation', 'hurt', 'bf')
    end

    if curStep == 80 then
        triggerEvent('Play Animation', 'hurt', 'bf')
    end

    if curStep == 84 then
        triggerEvent('Play Animation', 'hurt', 'bf')
    end

    if curStep == 112 then
        triggerEvent('Play Animation', 'hurt', 'bf')
    end

    if curStep == 116 then
        triggerEvent('Play Animation', 'hurt', 'bf')
    end

    if curStep == 124 then
        triggerEvent('Play Animation', 'hurt', 'bf')
    end

    if curStep == 128 then
        addHealth = false
        triggerEvent('Change Character', '2', 'gfright')
    end

    if curStep == 143 then
        triggerEvent('Fight')
    end

    if curStep == 124 then
        triggerEvent('Play Animation', 'Heated Up', 'dad')
    end

    if curStep == 600 then
        
        triggerEvent('Change Character', '0', 'BF Powerup')
        characterPlayAnim('bf', 'idle', true)
    end

    if curStep == 608 then
        addHealth = true
        triggerEvent('Change Character', '0', 'BF Flame')
        characterPlayAnim('bf', 'idle', true)
    end

    --if curStep == 4 then
       
    --end
    --if curStep == 10 then
        

    --end

        if curStep == 189 then
            addHealth = true
            bfAnimatedIcon = true
        end
        if curStep == 543 then
            bfAnimatedIcon = false
        end
        if curStep == 607 then
            bfAnimatedIcon = true
        end
        

        
        
    --end
	if curStep == 1487 then
        
	end
end

function onStartCountdown()

    doTweenAlpha('bfion', 'animatediconbf', 0, 0.001, 'linear')

end
function onUpdate()
	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end


    if getPropertyFromClass('flixel.FlxG', 'keys.justReleased.A') then
        bfAnimatedIcon = false
    end
    if getPropertyFromClass('flixel.FlxG', 'keys.justReleased.S') then
        bfAnimatedIcon = true
    end


        if bfAnimatedIcon == true then 
        if getProperty('health') > 1.6 then
            objectPlayAnimation('animatediconbf', 'losing', false)
        else
            objectPlayAnimation('animatediconbf', 'normal', false)
        end
        doTweenAlpha('bfion2', 'animatediconbf', 1, 0.001, 'linear')
        setProperty('animatediconbf.x', getProperty('iconP1.x'))
        setProperty('animatediconbf.angle', getProperty('iconP1.angle'))
        setProperty('animatediconbf.y', getProperty('iconP1.y')+20)
        setProperty('animatediconbf.scale.x', getProperty('iconP1.scale.x'))
        setProperty('animatediconbf.scale.y', getProperty('iconP1.scale.y'))

        
                addLuaSprite('animatediconbf', true)
    
                setProperty('iconP1.visible', false)
                setProperty('animatediconbf.visible', true)

        
        
        end

        if bfAnimatedIcon == false then
            setProperty('animatediconbf.visible', false)
            setProperty('iconP1.visible', true)
        end

        if addHealth == false then
            setProperty('health', 0.1);
        end


end



function onBeatHit()
    
	if curBeat == 46 then
        
		triggerEvent('Change Character', '0', 'BF Powerup')
	end
	if curBeat == 48 then
		triggerEvent('Change Character', '0', 'BF Flame')
	end

    if curBeat == 150 then
        
		triggerEvent('Change Character', '0', 'BF Powerup')
        characterPlayAnim('bf', 'idle', true)
	end
	if curBeat == 152 then
		triggerEvent('Change Character', '0', 'BF Flame')
	end

    if curBeat == 367 then
		triggerEvent('Change Character', '0', 'BF Flame')
	end
end

function onGameOver()
    removeLuaSprite('animatediconbf')
end

function goodNoteHit()
 
end