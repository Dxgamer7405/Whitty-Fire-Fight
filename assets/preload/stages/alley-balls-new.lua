function onCreate()

	precacheImage('ballistic/Updike Midsong Cutscene');
    precacheImage('ballistic/snow');
    precacheImage('ballistic/Ballistic New/Snow Blast');
    precacheImage('ballistic/Ballistic New/Rage Blasts');
    precacheImage('ballistic/Ballistic New/Rage Blasts Bf');

	addCharacterToList('uppercut', 'dad')

	makeAnimatedLuaSprite('animatedicon', 'icons/Whitty Ballsy Icon', getProperty('iconP2.x'), getProperty('iconP2.y'))
	addAnimationByPrefix('animatedicon', 'normal', 'Whitty B Even Icon', 24, true)
	addAnimationByPrefix('animatedicon', 'losing', 'Whitty Ba Losing Icon', 24, true)
	addAnimationByPrefix('animatedicon', 'win', 'Whitty B Winnin Icon ', 24, true)
	setObjectCamera('animatedicon', 'hud')
	


	makeAnimatedLuaSprite('animatediconbf', 'icons/bf-ice-icon', getProperty('iconP1.x'), getProperty('iconP1.y'))
	addAnimationByPrefix('animatediconbf', 'win', 'BF ice winning icon ', 24, true)
	addAnimationByPrefix('animatediconbf', 'normal', 'BF ice even icon', 24, true)
	addAnimationByPrefix('animatediconbf', 'losing', 'BF ice dyin icon', 24, true)
	setObjectCamera('animatediconbf', 'hud')
	
	addCharacterToList('BF Powerup', 'boyfriend')
	


	-- Whitback
	makeAnimatedLuaSprite('BallisticBackground', 'ballistic/Ballistic BG', -650, -200);
	addAnimationByPrefix('BallisticBackground','bg','Ballistic BG New',24,true)
	addAnimationByPrefix('BallisticBackground','bgflash','Bg Flash',24,false)
	objectPlayAnimation('BallisticBackground','bg',true)
	setLuaSpriteScrollFactor('BallisticBackground', 0.9, 0.9);

	makeAnimatedLuaSprite('BallisticBackground2', 'ballistic/Ballistic BG 3', -650, -200);
	addAnimationByPrefix('BallisticBackground2','bg','Ballistic BG 2',24,true)
	addAnimationByPrefix('BallisticBackground2','bg2','Ballistic BG 3',24,true)
	objectPlayAnimation('BallisticBackground2','bg',true)
	setLuaSpriteScrollFactor('BallisticBackground2', 0.9, 0.9);

	makeAnimatedLuaSprite('shield', 'ballistic/Shield Sprites', 520, 255);
	addAnimationByPrefix('shield','gfshield','GF Shield',24,true)
	addAnimationByPrefix('shield','shieldflash','Shield Flash',14,false)
	objectPlayAnimation('shield','gfshield',true)


	
	
	addLuaSprite('shield', true);
	-- sprites that only load if Low Quality is turned off

	addLuaSprite('BallisticBackground', false);
	addLuaSprite('BallisticBackground2', false);
	setProperty('BallisticBackground2.visible', false)
	



	
end




function onUpdate()
	
		

	setObjectOrder('shield', 37)
	setObjectOrder('girlfriendGroup', 36)
	setObjectOrder('bomb', 70)
	setObjectOrder('dadGroup', 72)
	setObjectOrder('boyfriendGroup', 71)
	setObjectOrder('animatediconbf', 75)
	setObjectOrder('healthBar', 10)
	setObjectOrder('healthBarBG',5)
	setObjectOrder('animatedicon', 74)

	if getProperty('health') > 1.6 then
		objectPlayAnimation('animatediconbf', 'win', false)
		objectPlayAnimation('animatedicon', 'losing', false)
	end
	if getProperty('health') < 1.6 and getProperty('health') > 0.6 then 
		objectPlayAnimation('animatediconbf', 'normal', false)
		objectPlayAnimation('animatedicon', 'normal', false)
	end

	if getProperty('health') < 0.6 then
		objectPlayAnimation('animatediconbf', 'losing', false)
		objectPlayAnimation('animatedicon', 'win', false)
	end
	doTweenAlpha('bfion2', 'animatediconbf', 1, 0.001, 'linear')
	setProperty('animatediconbf.x', getProperty('iconP1.x'))
	setProperty('animatediconbf.angle', getProperty('iconP1.angle'))
	setProperty('animatediconbf.y', getProperty('iconP1.y')+25)
	setProperty('animatediconbf.scale.x', getProperty('iconP1.scale.x'))
	setProperty('animatediconbf.scale.y', getProperty('iconP1.scale.y'))

	
			addLuaSprite('animatediconbf', true)

			setProperty('iconP1.visible', false)

			setProperty('iconP2.visible', false)

			setProperty('animatedicon.x', getProperty('iconP2.x'))
			setProperty('animatedicon.angle', getProperty('iconP2.angle'))
			setProperty('animatedicon.y', getProperty('iconP2.y'))
			setProperty('animatedicon.scale.x', getProperty('iconP2.scale.x'))
			setProperty('animatedicon.scale.y', getProperty('iconP2.scale.y'))
end

function onStartCountdown()
	triggerEvent('Camera Follow Pos', '700', '450')
	return Function_Continue	
end



function onGameOver()
	setProperty('shield.visible', false)
	setProperty('animatedicon.visible', false)
	setProperty('animatediconbf.visible', false)
	
	setProperty('fireBlastRight.visible', false)
	setProperty('fireBlastLeft.visible', false)
	setProperty('fireBlastDown.visible', false)
	setProperty('fireBlastUp.visible', false)

	return Function_Continue;
end

function onStepHit()
	if curStep == 1312 then
		setProperty('BallisticBackground2.visible', true)
	end
	if curStep == 1376 then
		objectPlayAnimation('BallisticBackground2','bg2',true)
	end
	if curStep == 1808 then
		setProperty('BallisticBackground2.visible', false)
	end
	if curStep == 2153 then
		objectPlayAnimation('BallisticBackground','bgflash',true)
		setProperty('BallisticBackground.x', (getProperty('BallisticBackground.x')-50))
		setProperty('BallisticBackground.y', (getProperty('BallisticBackground.y')-4))
	end
end