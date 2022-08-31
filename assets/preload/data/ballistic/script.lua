--local keysArray = getPropertyFromClass('ClientPrefs', 'keyBinds')
percentage = 0
loadingspeed = 0.05
counteddown = false
keybind1 = "Not Set"
selectkey1 = false
soundon = false
confon = false
paused = false
allowcontinue = false
dodged = false
movehold1 = false
headtweeningright = false
headtweeningleft = false
shrapexists = false
function onCreate()
	
	--Making and adding the loading image
	--makeLuaSprite('LoadingImg','loading-'.. songName,0,0)
	--setObjectCamera('LoadingImg', 'other')
	--addLuaSprite('LoadingImg', true)
	makeLuaSprite('LoadingBg','menuBG',0,0)
	setObjectCamera('LoadingBg', 'other')
	addLuaSprite('LoadingBg', false)
	screenCenter('LoadingBg', 'XY')
    doTweenAlpha('Loadingout1', 'LoadingBg', 0, 0.2, 'linear')
			doTweenAlpha('Loadingout2', 'LoadingImg', 0, 0.2, 'linear')
			doTweenAlpha('Loadingout3', 'loadingtxt', 0, 0.2, 'linear')
			soundFadeOut('music1', 0.2, 0)

	--Making the sprit and adding animations lol
	makeAnimatedLuaSprite('Bomb1', 'ballistic/DodgeBomb', 0 ,0);
	addAnimationByPrefix('Bomb1', 'Idle','DodgeBombCharge', 24, true);
	addAnimationByPrefix('Bomb1', 'Fire','DodgeBombFire', 24, true);
	--addLuaSprite('Bomb1', false);
	setProperty('Bomb1.flipX', true)
	setProperty('Bomb1.alpha', 0)

	objectPlayAnimation('c', 'Idle', true);
	
	makeAnimatedLuaSprite('Bomb2', 'ballistic/DodgeBomb', 0 ,0);
	addAnimationByPrefix('Bomb2', 'Idle','DodgeBombCharge', 24, true);
	addAnimationByPrefix('Bomb2', 'Fire','DodgeBombFire', 24, true);
	--addLuaSprite('Bomb2', false);
	objectPlayAnimation('Bomb2', 'Idle', true);
	setProperty('Bomb2.alpha', 0)

	makeAnimatedLuaSprite('Bomb3', 'ballistic/DodgeBomb', 0 ,0);
	addAnimationByPrefix('Bomb3', 'Idle','DodgeBombCharge', 24, true);
	addAnimationByPrefix('Bomb3', 'Fire','DodgeBombFire', 24, true);
	--addLuaSprite('Bomb3', false);
	objectPlayAnimation('Bomb3', 'Idle', true);
	setProperty('Bomb3.alpha', 0)

	makeLuaText('hold1', 'Press Screen/Space', nil, getProperty('Bomb1.x'), getProperty('Bomb1.y'))
	addLuaText('hold1', true)
	setTextSize('hold1', 50)
	setProperty('hold1.visible', false)
	
	makeAnimatedLuaSprite('iceshield1', 'ballistic/Ballistic New/Ice Shiled 1', 1200, 300)
	addAnimationByPrefix('iceshield1','idle','Ice Shield 1 Idle',24,false)
	addAnimationByPrefix('iceshield1','exit','Ice Shield 1 Exit',24,false)
	setProperty('iceshield1.visible', false)
    addLuaSprite('iceshield1', false)
	objectPlayAnimation('iceshield1','idle',true)


	makeAnimatedLuaSprite('iceshield2', 'ballistic/Ballistic New/Ice Shiled 2', 1050, 650)
	addAnimationByPrefix('iceshield2','idle','Ice Shield 2 Idle',24,false)
	addAnimationByPrefix('iceshield2','exit','Ice Shield 2 Exit',24,false)
    addLuaSprite('iceshield2', true)
	objectPlayAnimation('iceshield2','idle',true)
	setProperty('iceshield2.visible', false)

	makeAnimatedLuaSprite('iceshield3', 'ballistic/Ballistic New/Ice Shiled 3', 1050, 250)
	addAnimationByPrefix('iceshield3','idle','Ice Shield 3 Idle',24,false)
	addAnimationByPrefix('iceshield3','exit','Ice Shield 3 Exit',24,false)
    addLuaSprite('iceshield3', true)
	objectPlayAnimation('iceshield3','idle',true)
	setProperty('iceshield3.visible', false)

	makeLuaSprite('shrapnelhead1', 'ballistic/Ballistic New/BBW', 250, 50)
	addLuaSprite('shrapnelhead1', true)
	scaleObject('shrapnelhead1', 1.6, 1.6)
	setProperty('shrapnelhead1.visible', false)

end

function onUpdate()

    if shrapexists == false then
		setProperty('shrapnelhead1.x', 400)
		setProperty('shrapnelhead1.visible', false)
	end
	if shrapexists == true then
		setProperty('shrapnelhead1.visible', true)
	end

	setTextAlignment('hold1', 'center')
	if getProperty('health') == 0.00001 then
		removeLuaText('hold1')
	end

	if percentage == 100 then

		doTweenAlpha('Loadingout1', 'LoadingBg', 0, 0.2, 'linear')
		doTweenAlpha('Loadingout2', 'LoadingImg', 0, 0.2, 'linear')
		doTweenAlpha('Loadingout3', 'loadingtxt', 0, 0.2, 'linear')
		
		--if songName == 'Ballistic' then
			allowStart=true
			startCountdown()
		--end
	end

   if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.up')  or ((getMouseX('camHUD') > 358 and getMouseX('camHUD') < 690) and (getMouseY('camHUD') > 138 and getMouseY('camHUD') < 560)) then
          selectkey1 = true;
          dodge = true
   end
    if movehold1 == true then
		setProperty('hold1.x', getProperty('Bomb1.x')-740)
	    setProperty('hold1.y', getProperty('Bomb1.y')+200)
	end





	if getProperty('Bomb1.animation.curAnim.name') == 'Fire' and dodge == false and not botPlay and paused == false then 
		setProperty('health', getProperty('health')-0.01);
	end
	
	if getProperty('Bomb2.animation.curAnim.name') == 'Fire' and dodge == false and not botPlay and paused == false then 
		setProperty('health', getProperty('health')-0.01);
	end
	
	if getProperty('Bomb3.animation.curAnim.name') == 'Fire' and dodge == false and not botPlay and paused == false then 
		setProperty('health', getProperty('health')-0.01);
	end

	if getProperty('health') == 0.0001 then
		setProperty('firefront.visible', false)
		setProperty('firebehind.visible', false)
	end


end

function onStepHit()
	if stepHitFuncs[curStep] then
		stepHitFuncs[curStep]()
	end
end

stepHitFuncs = {
	
	[159] = function() -- adds first bomb boi
		movehold1 = true
		setProperty('hold1.visible', true)
		setTextString('hold1', 'Press Screen/Space')
		addLuaSprite('Bomb1', false);
		doTweenX('Bomb1TweenInX', 'Bomb1', 1510, 2.5, 'expoOut');
		doTweenY('Bomb1TweenInY', 'Bomb1', -110, 2.5, 'expoOut');
		doTweenAlpha('Bomb1AlphaTween', 'Bomb1', 1, 1, 'linear');
	end,


	[200] = function() -- starts hold text countdown
		runTimer('three1', 0.00001)
	end,

	[224] = function() -- shoots the first bomb boi
		addLuaSprite('iceshield1', false)
		setProperty('iceshield1.visible', true)
		objectPlayAnimation('iceshield1','idle',true)
		objectPlayAnimation('Bomb1', 'Fire', true)
		setProperty('Bomb1.x', getProperty('Bomb1.x')-200)
	end,

	[256] = function() -- stop shooting and add the second bomb boi
		setTextString('hold1', 'Press Screen/Space')
		runTimer('removeShield1', 0.5)
		objectPlayAnimation('iceshield1','exit',true)
		objectPlayAnimation('Bomb1', 'Idle', true)
		setProperty('Bomb1.x', getProperty('Bomb1.x')+200)
		addLuaSprite('Bomb2', false);
		doTweenX('Bomb2TweenInX', 'Bomb2', 600, 2.5, 'expoOut');
		doTweenY('Bomb2TweenInY', 'Bomb2', 680, 2.5, 'expoOut');
		doTweenAlpha('Bomb2AlphaTween', 'Bomb2', 1, 1, 'linear');
		doTweenAngle('Bomb2TweenInA', 'Bomb2', -65, 1, 'expoOut');
	end,

	[263] = function() -- start hold countdown
		runTimer('three1', 0.00001)
	end,


	[287] = function() -- Shoot the first and second bomb bois
		objectPlayAnimation('iceshield2','idle',true)
		setProperty('iceshield2.visible', true)
		addLuaSprite('iceshield1', false)
		setProperty('iceshield1.visible', true)
		objectPlayAnimation('iceshield1','idle',true)
		objectPlayAnimation('Bomb1', 'Fire', true)
		setProperty('Bomb1.x', getProperty('Bomb1.x')-200)
		objectPlayAnimation('Bomb2', 'Fire', true)
	end,

	[319] = function() -- stop shooting for the first and second bomb bois then add the third one
		setTextString('hold1', 'Press Screen/Space')
		objectPlayAnimation('iceshield2','exit',true)
		objectPlayAnimation('iceshield1','exit',true)
		runTimer('removeShield1', 0.5)
		objectPlayAnimation('Bomb1', 'Idle', true)
		setProperty('Bomb1.x', getProperty('Bomb1.x')+200)
		objectPlayAnimation('Bomb2', 'Idle', true)
		addLuaSprite('Bomb3', false)
		doTweenX('Bomb3TweenInX', 'Bomb3', 650, 2.5, 'expoOut');
		doTweenY('Bomb3TweenInY', 'Bomb3', -10, 2.5, 'expoOut');
		doTweenAlpha('Bomb3AlphaTween', 'Bomb3', 1, 1, 'linear');
		doTweenAngle('Bomb3TweenInA', 'Bomb3', -20, 1, 'expoOut');
	end,

	[327] = function()
		runTimer('three1', 0.00001)
	end,

	[351] = function() -- shoot all the bomb bois
		objectPlayAnimation('iceshield3','idle',true)
		setProperty('iceshield3.visible', true)
		objectPlayAnimation('iceshield2','idle',true)
		setProperty('iceshield2.visible', true)
		addLuaSprite('iceshield1', false)
		setProperty('iceshield1.visible', true)
		objectPlayAnimation('iceshield1','idle',true)
		objectPlayAnimation('Bomb1', 'Fire', true)
		setProperty('Bomb1.x', getProperty('Bomb1.x')-200)
		objectPlayAnimation('Bomb2', 'Fire', true)
		objectPlayAnimation('Bomb3', 'Fire', true)
	end,
	
	[383] = function() -- stop shooting all the bomb bois
		setTextString('hold1', 'Press Screen/Space')
		runTimer('removeShield1', 0.5)
		objectPlayAnimation('iceshield3','exit',true)
		objectPlayAnimation('iceshield2','exit',true)
		objectPlayAnimation('iceshield1','exit',true)
		objectPlayAnimation('Bomb1', 'Idle', true)
		setProperty('Bomb1.x', getProperty('Bomb1.x')+200)
		objectPlayAnimation('Bomb2', 'Idle', true)
		objectPlayAnimation('Bomb3', 'Idle', true)
	end,
	
	[477] = function() -- shoot all the bomb bois
         makeAnimatedLuaSprite('Cene', 'ballistic/Updike Midsong Cutscene', 0, 0)
         setObjectCamera('Cene', 'camHUD')
         addLuaSprite('Cene', true)
         addAnimationByPrefix('Cene', 'idle', 'MId Song Cut 2', 24, false)
		setProperty('Bomb1.x', getProperty('Bomb1.x')-200)
	end,

	[511] = function() -- stop shooting all the bomb bois
		objectPlayAnimation('Bomb1', 'Idle', true)
        removeLuaSprite('Cene', true)
		setProperty('Bomb1.x', getProperty('Bomb1.x')+200)
		objectPlayAnimation('Bomb2', 'Idle', true)
		objectPlayAnimation('Bomb3', 'Idle', true)
	end,

	[519] = function()
		runTimer('three1', 0.00001)
	end,

	[543] = function() -- shoot all the bomb bois
		objectPlayAnimation('iceshield3','idle',true)
		setProperty('iceshield3.visible', true)
		objectPlayAnimation('iceshield2','idle',true)
		setProperty('iceshield2.visible', true)
		setProperty('iceshield1.visible', true)
		objectPlayAnimation('iceshield1','idle',true)
		objectPlayAnimation('Bomb1', 'Fire', true)
		setProperty('Bomb1.x', getProperty('Bomb1.x')-200)
		objectPlayAnimation('Bomb2', 'Fire', true)
		objectPlayAnimation('Bomb3', 'Fire', true)
	end,

	[575] = function() -- stop shooting all the bomb bois
		setTextString('hold1', 'Press Screen/Space')
		runTimer('removeShield1', 0.5)
		objectPlayAnimation('iceshield3','exit',true)
		objectPlayAnimation('iceshield2','exit',true)
		objectPlayAnimation('iceshield1','exit',true)
		objectPlayAnimation('Bomb1', 'Idle', true)
		setProperty('Bomb1.x', getProperty('Bomb1.x')+200)
		objectPlayAnimation('Bomb2', 'Idle', true)
		objectPlayAnimation('Bomb3', 'Idle', true)
	end,

	[584] = function()
		runTimer('three1', 0.00001)
	end,

	[608] = function() -- shoot all the bomb bois
		objectPlayAnimation('iceshield3','idle',true)
		setProperty('iceshield3.visible', true)
		objectPlayAnimation('iceshield2','idle',true)
		setProperty('iceshield2.visible', true)
		setProperty('iceshield1.visible', true)
		objectPlayAnimation('iceshield1','idle',true)
		objectPlayAnimation('Bomb1', 'Fire', true)
		setProperty('Bomb1.x', getProperty('Bomb1.x')-200)
		objectPlayAnimation('Bomb2', 'Fire', true)
		objectPlayAnimation('Bomb3', 'Fire', true)
	end,

	[640] = function() -- stop shooting all the bomb bois
		setTextString('hold1', 'Press Screen/Space')
		runTimer('removeShield1', 0.5)
		objectPlayAnimation('iceshield3','exit',true)
		objectPlayAnimation('iceshield2','exit',true)
		objectPlayAnimation('iceshield1','exit',true)
		objectPlayAnimation('Bomb1', 'Idle', true)
		setProperty('Bomb1.x', getProperty('Bomb1.x')+200)
		objectPlayAnimation('Bomb2', 'Idle', true)
		objectPlayAnimation('Bomb3', 'Idle', true)
		
		doTweenX('Bomb3TweenOutX', 'Bomb3', 400, 2.6, 'expoOut');
		doTweenY('Bomb3TweenOutY', 'Bomb3', 200, 2.6, 'expoOut');
		doTweenX('Bomb2TweenOutX', 'Bomb2', 400, 2.6, 'expoOut');
		doTweenY('Bomb2TweenOutY', 'Bomb2', 200, 2.6, 'expoOut');
		doTweenX('Bomb1TweenOutX', 'Bomb1', 400, 2.6, 'expoOut');
		doTweenY('Bomb1TweenOutY', 'Bomb1', 200, 2.6, 'expoOut');
	end,

	[656] = function() -- kill the bomb bois :( and add Shrapnel Head
		removeLuaText('hold1')
		removeLuaSprite('Bomb1', false)
		removeLuaSprite('Bomb2', false)
		removeLuaSprite('Bomb3', false)
		setProperty('Bomb1.alpha', 0)
		setProperty('Bomb2.alpha', 0)
		setProperty('Bomb3.alpha', 0)
		shrapexists = true
	end,

	[1048] = function()
		shrapexists = false
	end,

}
function onUpdatePost()
	setTextFont('hold1', "ErasBoldITC.ttf")
	setTextBorder('hold1', 0)
	setTextString('mousex', 'Mouse X: ' .. (getMouseX()), true)
	setTextString('mousey', 'Mouse Y: ' .. (getMouseY()), true)
	setTextString('loadingtxt', 'Hold  Keybinds: ' .. (keybind1), true)
	setObjectOrder("Bomb1", (getObjectOrder('iceshield1')-1))
	setObjectOrder("iceshield2", (getObjectOrder('boyfriendGroup')+1))
	setObjectOrder("iceshield3", (getObjectOrder('boyfriendGroup')-1))
	setObjectOrder("Bomb2", (getObjectOrder('iceshield2')+1))
	setObjectOrder("Bomb3", (getObjectOrder('iceshield3')-1))
	setObjectOrder('shrapnelhead1', 100)
	

end

function onStartSong()
	counteddown = true
end

function onTimerCompleted(tag)
	if tag == "three1" then
		runTimer('two1', 0.6)
		setTextString('hold1', '3')
		dodge = false
	end
	if tag == "two1" then
		setTextString('hold1', '2')
		runTimer('one1', 0.6)
	end
	if tag == "one1" then
		setTextString('hold1', '1')
		runTimer('now1', 0.6)
	end
	if tag == "now1" then
		setTextString('hold1', 'NOW!!')
	end
	if tag == "sound" then
		soundon = true
		playSound('select', 1)
	end
	if tag == "sound2" then
		confon = true
	end
	if tag == "removeShield1" then
		setProperty('iceshield1.visible', false)
		setProperty('iceshield2.visible', false)
		setProperty('iceshield3.visible', false)
	end
	if tag == "tweeninright" then
		headtweeningright = false
	end
	if tag == "tweeninleft" then
		headtweeningleft = false
	end
end
function onTweenCompleted(tag)
	if tag == 'enterout' then
		doTweenAlpha('enterin', 'enter', 0.8, 1, 'sineInOut')
	end
	if tag == 'enterin' then
		doTweenAlpha('enterout', 'enter', 0, 1, 'sineInOut')
	end
	if tag == "Bomb1TweenInX" then
		movehold1 = false
	end
	if tag == "Bomb3TweenOutX" then
		doTweenX('shrapin', 'shrapnelhead1', 250, 1, "expoOut")
		shrapexists = true
	end
end

function goodNoteHit()
	if getProperty('shrapnelhead1.x') == 250 then
        doTweenX('shrapnelheadleft','shrapnelhead1', 900, 0.5, "expoOut")
		doTweenAngle('shrapnelheadrightrotate', 'shrapnelhead1', -40, 0.5, "expoOut")
		doTweenY('shrapnelheaddown','shrapnelhead1', 320, 0.5, "expoOut")
	end
end

function opponentNoteHit()
	if getProperty('shrapnelhead1.x') == 900 then
        doTweenX('shrapnelheadright','shrapnelhead1', 250, 0.5, "expoOut")
		doTweenY('shrapnelheadup','shrapnelhead1', 200, 0.5, "expoOut")
		doTweenAngle('shrapnelheadleftrotate', 'shrapnelhead1', 140, 0.5, "expoOut")
	end
end