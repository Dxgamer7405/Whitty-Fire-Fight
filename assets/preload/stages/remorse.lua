local move = yes;

local defaultNotePos = {};
local spin = false;
local arrowMoveX = 10;
local arrowMoveY = 10;
 


function onCreate()
    


    makeLuaSprite('bg', 'stages/The Test STage', -400, -400)
    addLuaSprite('bg')
    --setProperty('skipCountdown', true)

    makeLuaSprite('defatbg', 'stages/Defat Stage', -500, -300)
    addLuaSprite('defatbg')
    setProperty('defatbg.visible',false)

    makeLuaSprite('picobg', 'stages/Pico Stage', -350, -300)
    addLuaSprite('picobg')
    setProperty('picobg.visible',false)

    makeLuaSprite('tankbg', 'stages/Tank', -300, -200)
    addLuaSprite('tankbg')
    setProperty('tankbg.visible',false)

    makeLuaSprite('monsterbg', 'stages/Monster', -850, -650)
    addLuaSprite('monsterbg')
    setProperty('monsterbg.visible',false)

    makeAnimatedLuaSprite('probe', 'stages/Probe', 1000, 0)
    addAnimationByPrefix('probe', 'exist', 'The Probe Exists', 24, false)
    addCharacterToList('bf-probe', 'bf')
    addCharacterToList('pico', 'dad')
    addCharacterToList('dad', 'dad')
    addCharacterToList('monster', 'dad')
    addCharacterToList('tankman', 'dad')
    addCharacterToList('Updike Normal', 'dad')
    addCharacterToList('Updike Edgy', 'dad')
    addCharacterToList('bf edgy', 'bf')
    addCharacterToList('Inner Corruption', 'bf')
    addCharacterToList('gf2', 'gf')
    addCharacterToList('gf edgy', 'gf')
    addCharacterToList('Updike Sad', 'dad')
    addCharacterToList('Updike Clip', 'dad')

    makeAnimatedLuaSprite('abilities', 'stages/abilities', 1000, 350)
    addAnimationByPrefix('abilities', 'exist', 'Corruption Abilities', 24, true)
    addLuaSprite('abilities', true)
    doTweenAlpha('abilitiestweenout', 'abilities', 0, 0.00002, 'sineOut')

    makeAnimatedLuaSprite('light', 'stages/Light', 0, 500)
    addAnimationByPrefix('light', 'exist', 'Unmasking light', 24, true)
    objectPlayAnimation('light', 'exist')
    addLuaSprite('light', true)
    doTweenAlpha('lightout', 'light', 0, 0.00002, 'sineOut')

    makeAnimatedLuaSprite('light boom', 'stages/Light Boom', -100, 450)
    addAnimationByPrefix('light boom', 'exist', 'Unmasking Light Boom', 24, false)
    objectPlayAnimation('light boom', 'exist')
    addLuaSprite('light boom', true)
    setProperty('light boom.visible', false)



end
function onSongStart()
    setProperty('healthBar.x', -200)
    setProperty('healthBar.angle', 90)
    for i = 0,7 do 
        x = getPropertyFromGroup('strumLineNotes', i, 'x')
 
        y = getPropertyFromGroup('strumLineNotes', i, 'y')
 
        table.insert(defaultNotePos, {x,y})
    end

    noteTweenAlpha('alphatween0', 0, 0, 1, 'linear')
    noteTweenAlpha('alphatween1', 1, 0, 1, 'linear')
    noteTweenAlpha('alphatween2', 2, 0, 1, 'linear')
    noteTweenAlpha('alphatween3', 3, 0, 1, 'linear')

    noteTweenY('ytween0', 0, -500, 10, 'sineOut')
    noteTweenY('ytween1', 1, -500, 10, 'sineOut')
    noteTweenY('ytween2', 2, -500, 10, 'sineOut')
    noteTweenY('ytween3', 3, -500, 10, 'sineOut')
end    

function onUpdate()
    if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
        doTweenX('idkx4', 'camHUD', 0, 0.2, 'sineOut')
        doTweenY('idky4', 'camHUD', 0, 0.2, 'sineOut')
    end

    songPos = getPropertyFromClass('Conductor', 'songPosition');
 
    currentBeat = (songPos / 1000) * (bpm / 60)
 
    if spin == true then 
        for i = 4,7 do 
            setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1] + arrowMoveX * math.sin((currentBeat + i*0.25) * math.pi))
            setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] + arrowMoveY * math.cos((currentBeat + i*0.25) * math.pi))
        end
    end

    if spin == false then
        for i = 4,7 do 
        setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1])
        setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2])
        end
    end
end


--[[function onMoveCamera(focus)
	if focus == 'boyfriend' then
		doTweenAlpha('offtween', 'camHUD', 1, 0.2, linear)
	elseif focus == 'dad' then
		doTweenAlpha('ontween', 'camHUD', 0.1, 0.2, linear)
	end
end]]



function goodNoteHit(id, direction, noteType, isSustainNote)
    if move == yes then
	-- Function called when you hit a note (after note hit calculations)
	-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
	-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
	-- noteType: The note type string/tag
	-- isSustainNote: If it's a hold note, can be either true or false
    if direction == 0 then
        doTweenX('idkx3', 'camHUD', -10, 0.2, 'sineOut')
        doTweenY('idk3', 'camHUD', 0, 0.2, 'sineOut')
        doTweenX('iconXtween4', 'iconP1', 20, 0.2, 'sineOut')
        doTweenY('iconYtween4', 'iconP1', (getProperty('healthBar.y')-75), 0.2, 'sineOut')
        doTweenX('icon2Xtween4', 'iconP2', 20, 0.2, 'sineOut')
        doTweenY('icon2Ytween4', 'iconP2', (getProperty('healthBar.y')-75), 0.2, 'sineOut')
        
      --  doTweenY(tag:String, vars:String, value:Dynamic, duration:Float, ease:String)
        runTimer('idle', 0.2, 1)
    end
    if direction == 1 then
       -- doTweenY(tag:String, vars:String, value:Dynamic, duration:Float, ease:String)
        runTimer('idle', 0.2, 1)
        doTweenY('iconYtween2', 'iconP1', getProperty('healthBar.y')-65, 0.2, 'sineOut')
        doTweenX('iconXtween2', 'iconP1', 0, 0.2, 'sineOut')
        doTweenY('icon2Ytween2', 'iconP2', getProperty('healthBar.y')-65, 0.2, 'sineOut')
        doTweenX('icon2Xtween2', 'iconP2', 0, 0.2, 'sineOut')
        doTweenY('idk2', 'camHUD', 10, 0.2, 'sineOut')
        doTweenX('idkx2', 'camHUD', 0, 0.2, 'sineOut')
    end

    if direction == 2 then
        doTweenY('iconYtween1', 'iconP1', (getProperty('healthBar.y')-85), 0.2, 'sineOut')
        doTweenX('iconXtween1', 'iconP1', 0, 0.2, 'sineOut')
        doTweenY('icon2Ytween1', 'iconP2', (getProperty('healthBar.y')-85), 0.2, 'sineOut')
        doTweenX('icon2Xtween1', 'iconP2', 0, 0.2, 'sineOut')
        doTweenY('idk0', 'camHUD', -10, 0.2, 'sineOut')
        doTweenX('idkx0', 'camHUD', 0, 0.2, 'sineOut')
        runTimer('idle', 0.2, 1)
    end

    if direction == 3 then
        doTweenX('iconXtween3', 'iconP1', -20, 0.2, 'sineOut')
        doTweenY('iconYtween3', 'iconP1', (getProperty('healthBar.y')-75), 0.2, 'sineOut')
        doTweenX('icon2Xtween3', 'iconP2', -20, 0.2, 'sineOut')
        doTweenY('icon2Ytween3', 'iconP2', (getProperty('healthBar.y')-75), 0.2, 'sineOut')
        doTweenX('idkx1', 'camHUD', 10, 0.2, 'sineOut')
        doTweenY('idk1', 'camHUD', 0, 0.2, 'sineOut')
        --doTweenY(tag:String, vars:String, value:Dynamic, duration:Float, ease:String)
        runTimer('idle', 0.2, 1)
    end
end
end
function onTimerCompleted(tag, loops, loopsLeft)
        if tag == "idle" then
            doTweenX('iconXtween5', 'iconP1', 0, 0.2, 'sineOut')
            doTweenY('iconYtween5', 'iconP1', (getProperty('healthBar.y')-75), 0.2, 'sineOut')
            doTweenX('icon2Xtween5', 'iconP2', 0, 0.2, 'sineOut')
            doTweenY('icon2Ytween5', 'iconP2', (getProperty('healthBar.y')-75), 0.2, 'sineOut')
        end
        if tag == "rerotate" then
            doTweenAngle('angletween4', 'camHUD', 0, 0.4, 'sineInOut')
        end 
        if tag == "flip" then
        end

end


function onBeatHit()
    if curBeat > 96 and curBeat < 128 then
        if curBeat %4 == 1 then
            doTweenZoom('camzoom0', 'camHUD', 1.2, 0.2, 'sineOut')
            doTweenAngle('angletween3', 'camHUD', -5, 0.2, 'sineOut')
            runTimer('rerotate', 0.2, 1)
            
        end

        if curBeat %4 == 2 then
            
        end

        if curBeat %4 == 3 then
            doTweenAngle('angletween1', 'camHUD', 5, 0.2, 'sineOut')
            doTweenZoom('camzoom0', 'camHUD', 1.2, 0.2, 'sineOut')
            runTimer('rerotate', 0.2, 1)
        end
        
    end
    if curBeat == 128 then
        doTweenAngle('angletween5', 'camHUD', 360, 2, 'sineOut')
        runTimer('flip', 0.5, 1)
    end
end

function onStepHit()
    if curStep == 353 then
        objectPlayAnimation('probe', 'exist', true)
        addLuaSprite('probe', true)
    end
    if curStep == 383 then
        triggerEvent('Camera Follow Pos', '850', '400')
        triggerEvent('Change Character', '0', 'bf-probe')
        triggerEvent('Change Character', '2', 'gf2')
        triggerEvent('Play Animation', 'hurt', 'bf')
        triggerEvent('Change Character', '1', 'dad')
        setProperty('defatbg.visible',true)
        cameraFlash('other','FFFFFF',1)
        setProperty('dad.y', '0')
        setProperty('dad.x', '150')
    end

    if curStep == 416 then

        setProperty('defatbg.visible',false)
        removeLuaSprite('defatbg', true);
        setProperty('picobg.visible', true)
        triggerEvent('Change Character', '1', 'pico')
        cameraFlash('other','FFFFFF',1)

        setProperty('dad.y', '300')
        setProperty('dad.x', '100')

    end


    if curStep == 448 then
        triggerEvent('Alt Idle Animation', 'BF', '-christ-norm')
        setProperty('picobg.visible',false)
        removeLuaSprite('picobg', true);
        setProperty('monsterbg.visible', true)
        triggerEvent('Change Character', '1', 'monster')
        cameraFlash('other','FFFFFF',1)
        setProperty('dad.y', '150')
        
    end

    if curStep == 455 then
        triggerEvent('Alt Idle Animation', 'BF', '-christ')
    end

    if curStep == 480 then
        triggerEvent('Play Animation', 'idle', 'BF')
        triggerEvent('Alt Idle Animation', 'BF', '')
        setProperty('tankbg.visible',true)
         removeLuaSprite('monsterbg', true);
        setProperty('monsterbg.visible', false)
        triggerEvent('Change Character', '1', 'tankmanblur')
        cameraFlash('other','FFFFFF',1)
        setProperty('dad.y', '350')
        

    end

    if curStep == 512 then
        removeLuaSprite('tankbg', true);
        setProperty('tankbg.visible',false)
        triggerEvent('Change Character', '0', 'bf')
        triggerEvent('Change Character', '2', 'gf')
        triggerEvent('Change Character', '1', 'Updike Clip')
        cameraFlash('other','FFFFFF',1)
        triggerEvent('Camera Follow Pos', '', '')
        setProperty('dad.y', '100')
    end

    if curStep == 896 then
        Shadow = true
        spin = true
        triggerEvent('Camera Follow Pos', '850', '450')
        doTweenAlpha('abilitiestweenin', 'abilities', 1, 5, 'sineOut')
        
        triggerEvent('Change Character', '0', 'bf edgy')
        triggerEvent('Change Character', '1', 'Updike Edgy')
        triggerEvent('Change Character', '2', 'gf edgy')
        cameraFlash('other','FFFFFF',1)
        setProperty('bg.x', '-3172')
        setProperty('trailright.visible', true)
        setProperty('trailleft.visible', true)
        setProperty('trailup.visible', true)
        setProperty('traildown.visible', true)
        traildad = true
        
    end

    if curStep == 992 then
        doTweenAlpha('lightin', 'light', 1, 0.0001, 'sineOut')
    end
    if curStep == 1024 then
        arrowMoveX = 20
        arrowMoveY = 20
        
        triggerEvent('Change Character', '0', 'Inner Corruption')
    end

    if curStep == 1088 then
        arrowMoveX = 10
        arrowMoveY = 10
        triggerEvent('Change Character', '1', 'Updike Sad')
        setProperty('echo.visible', true)
        objectPlayAnimation('echo', 'exist', true)
        traildad = false
        
    end

    if curStep == 1152 then
        spin = false
        setProperty('abilities.visible', false)
        setProperty('light.visible', false)
        triggerEvent('Change Character', '0', 'bf')
        triggerEvent('Change Character', '1', 'Updike Normal')
        triggerEvent('Change Character', '2', 'gf')
        triggerEvent('Camera Follow Pos', '', '')
        cameraFlash('other','FFFFFF',1)
        setProperty('bg.x', '-400')
        Shadow = false
    end

    --[[if curStep == 475 then
        doTweenZoom('camzoom3', 'camGame', 2, 2, 'cubicOut')
        doTweenAngle('angletween4', 'camGame', -45, 2, 'cubicOut')
        triggerEvent('Camera Follow Pos', 1400, 650)

    end]]
end

