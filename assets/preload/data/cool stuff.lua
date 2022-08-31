movesss = true
function onCreatePost()
    precacheImage('ballistic/Updike Midsong Cutscene');
    precacheImage('ballistic/snow');
    precacheImage('ballistic/Ballistic New/Snow Blast');
    precacheImage('ballistic/Ballistic New/Rage Blasts');
    precacheImage('ballistic/Ballistic New/Rage Blasts Bf');
    addCharacterToList('bf-ice-2', 'boyfriend');
    addCharacterToList('bf-ice-3', 'boyfriend');
    addCharacterToList('Whitty Rage', 'dad');
    addCharacterToList('Whitty Rage Powerup', 'dad');
    addCharacterToList('Whitty Bouta Die', 'dad');
    addCharacterToList('Whitty Becomes A Drunken Idiot and Gets Fucked', 'dad');
end

function onCreate()
    precacheImage('ballistic/Updike Midsong Cutscene');
    precacheImage('ballistic/snow');
    precacheImage('ballistic/Ballistic New/Snow Blast');
    precacheImage('ballistic/Ballistic New/Rage Blasts');
    precacheImage('ballistic/Ballistic New/Rage Blasts Bf');
    --[[makeAnimatedLuaSprite('inke', 'ballistic/Ink Explode', -150,-200);
	addAnimationByPrefix('inke', 'explode', 'Ink Explode', 24, false);
    addAnimationByPrefix('inke', 'idle', 'Ink Idle', 24, false);
    objectPlayAnimation('inke', 'explode')
    scaleObject('inke', 0.55, 0.55);
    addLuaSprite('inke');
	setObjectCamera('inke', 'other');]]
    makeLuaSprite('iceplatform', 'ballistic/Ice Platform')
    addLuaSprite('iceplatform')
    setProperty('iceplatform.visible', false)

    makeAnimatedLuaSprite('snow', 'ballistic/snow', 0,-1200);
	addAnimationByPrefix('snow', 'fall', 'Snow Falling', 24, true);
    scaleObject('snow', 0.55, 0.55);
    addLuaSprite('snow');
	setObjectCamera('snow', 'other');
    

--[[    makeAnimatedLuaSprite('snowblast', 'ballistic/Ballistic New/Snow Blast', -350,-100);
	addAnimationByPrefix('snowblast', 'explode', 'Snow Blast', 24, false);
    scaleObject('snowblast', 0.55, 0.55);
    addLuaSprite('snowblast');
	setObjectCamera('snowblast', 'other');]]
    

    makeAnimatedLuaSprite('ccut', 'ballistic/Updike Midsong Cutscene', -300,-176);
	addAnimationByPrefix('ccut', 'go', 'MId Song Cut 2', 24, false);
    addAnimationByPrefix('ccut', 'idle', 'Idle', 24, false);
    objectPlayAnimation('ccut', 'go')
    scaleObject('ccut', 1.31, 1.31);
    addLuaSprite('ccut');
	setObjectCamera('ccut', 'other');
    

    makeAnimatedLuaSprite('firebehind', 'ballistic/Ballistic New/Fire Back', -650,200);
    addAnimationByPrefix('firebehind', 'idle', 'Fire Idle', 24,true);
	addAnimationByPrefix('firebehind', 'burn', 'Fire0', 24,true);
    objectPlayAnimation('firebehind', 'burn')
    addLuaSprite('firebehind');
    

    makeAnimatedLuaSprite('firefront', 'ballistic/Ballistic New/Fire Front', -500,700);
    addAnimationByPrefix('firefront', 'idle', 'Fire Idle', 24,true);
	addAnimationByPrefix('firefront', 'burn', 'Flame Wall Glow', 24,true);
    objectPlayAnimation('firefront', 'burn')
    
    addLuaSprite('firefront', true);
    

    makeAnimatedLuaSprite('rageblasts', 'ballistic/Ballistic New/Rage Blasts', -2800,-1700);
	addAnimationByPrefix('rageblasts', 'explode', 'Rage Blast', 24,true);
    scaleObject('rageblasts', 2, 2)
    addAnimationByPrefix('rageblasts', 'idle', 'Idle', 24,true);
    objectPlayAnimation('rageblasts', 'explode');
    addLuaSprite('rageblasts', true);
    
    

    makeAnimatedLuaSprite('rageblastsbf', 'ballistic/Ballistic New/Rage Blasts Bf', -1800,-1700);
	addAnimationByPrefix('rageblastsbf', 'explode', 'Bf Rage Blast', 24,true);
    scaleObject('rageblastsbf', 2, 2)
    addAnimationByPrefix('rageblastsbf', 'idle', 'Idle', 24,true);
    objectPlayAnimation('rageblastsbf', 'explode');
    addLuaSprite('rageblastsbf', true);
    
    makeAnimatedLuaSprite('iceshield0', 'ballistic/Ballistic New/Ice Shield 0', 950, 320);
	addAnimationByPrefix('iceshield0','idle','Begin Shield Idle',24,false)
	addAnimationByPrefix('iceshield0','exit','Begin Shield Exit',24,false)
    addLuaSprite('iceshield0', true)
	objectPlayAnimation('iceshield0','idle',true)

    makeAnimatedLuaSprite('icewall', 'ballistic/Ballistic New/Ice Wall', 550, 150);
	addAnimationByPrefix('icewall','idle','Ice Wall Thing',24,false)
    addLuaSprite('icewall', true)
    setProperty('icewall.visible', false)
	objectPlayAnimation('icewall','idle',true)

    makeLuaSprite('icePodium', 'ballistic/Ballistic New/Ice Podium', 1120, 530)
    scaleObject('icePodium', 0.7, 0.7)
    addLuaSprite('icePodium', false)

    setProperty('icePodium.visible', false)
    setProperty('rageblastsbf.visible', false)
    setProperty('rageblasts.visible', false)
    setProperty('firefront.visible', false)
    setProperty('firebehind.visible', false)
    setProperty('inke.visible', false)
    setProperty('ccut.visible', false)
    setProperty('snow.visible', false)
    setProperty('snowblast.visible', false)
    --setProperty('skipCountdown', true);
end
function onGameOver()
    setProperty('rageblastsbf.visible', false)
    setProperty('rageblasts.visible', false)
    setProperty('firefront.visible', false)
    setProperty('firebehind.visible', false)
    setProperty('inke.visible', false)
    setProperty('ccut.visible', false)
    setProperty('snow.visible', false)
    setProperty('snowblast.visible', false)
    return Function_Continue;
end

function onStartCountdown()
	return Function_Continue
end


function onStepHit()
    if curStep == 42 then
        objectPlayAnimation('iceshield0','exit',true)
        setProperty('iceshield0.x', 780)
        setProperty('iceshield0.y', 290)
        runTimer('killshield0', 0.5)
    end
    if curStep == 157 then
        runTimer('killinke', 0.3)
        setProperty('firefront.visible', true)
        setProperty('firebehind.visible', true)
        cameraFlash('other', 'fbed0c', 0.5,true)
    end
    


    if curStep == 416 then
        objectPlayAnimation('ccut', 'go')
        setProperty('ccut.visible', true)
    end

    if curStep == 480 then
        setProperty('ccut.visible', false)
    end
    if curStep == 1055 then
        setProperty('firefront.visible', false)
        setProperty('firebehind.visible', false)
        cameraFlash('other', 'FFFFFF', 0.5, true)
        setProperty('snow.visible', true)
        setProperty('iceplatform.visible', true)
        objectPlayAnimation('snowblast', 'explode')
    end
    if curStep == 1310 then
        triggerEvent('Change Character', '1', 'Whitty Rage Powerup')
    end

    if curStep == 1313 then
        setProperty('rageblasts.visible', true)
    end
    if curStep == 1311 then
        setProperty('icewall.visible', true)
        objectPlayAnimation('icewall','idle',true)
    end
    if curStep == 1312 then
        movesss = false
        setProperty('shield.visible', false)
        setProperty('snow.visible', false)

        triggerEvent('Change Character', '1', 'Whitty Rage')
    end
    if curStep == 1376 then
        setProperty('icewall.visible', false)
    end
    if curStep == 1440 then --add podium here
        
        setProperty('rageblasts.visible', false)
        setProperty('rageblastsbf.visible', true)
       
    end
    if curStep == 1472 then
        setProperty('rageblasts.visible', true)
    end
    if curStep == 1504 then
        setProperty('rageblasts.visible', false)
    end
    if curStep == 1536 then
        setProperty('rageblasts.visible', true)
    end
    if curStep == 1568 then
        doTweenY('boyfriendup', 'boyfriend', (getProperty('boyfriend.y')-200), 0.000001, 'linear')
        setProperty('icePodium.visible', true)
        setProperty('rageblasts.visible', false)
        setProperty('rageblastsbf.visible', false)
        triggerEvent('Change Character', '1', 'Whitty Becomes A Drunken Idiot and Gets Fucked')
    end
    if curStep == 1820 then
        setProperty('shield.visible', true)
    end
    if curStep == 2080 then
        triggerEvent('Change Character', '1', 'Whitty Bouta Die')
    end

    if curStep == 2081 then
        triggerEvent('Play Animation', 'idle', 'Dad')
    end
end
function onBeatHit()
    if curBeat == 424 then
        doTweenY('boyfrienddown', 'boyfriend', defaultBoyfriendY, 0.5, 'linear')
        setProperty('icePodium.visible', false)
    end
end

function onUpdate()
    if movesss == true then
        setProperty('iceplatform.x', (getProperty('boyfriend.x')-70))
        setProperty('iceplatform.y', (getProperty('boyfriend.y')+300))
    end
    setObjectOrder('firebehind', 38)
    setObjectOrder('firefront', 80)
    setObjectOrder('rageblasts', 81)
    setObjectOrder('rageblastsbf', 82)
    setObjectOrder('iceshield0', 82)
    setObjectOrder('icewall', 82)
    setObjectOrder('inke', 83)
end

function onTimerCompleted(tag)
    if tag == 'killshield0' then
        setProperty('iceshield0.visible', false)
    end
    if tag == 'killinke' then
        doTweenAlpha('inketween', 'inke', 0, 0.6, 'linear')
    end
end