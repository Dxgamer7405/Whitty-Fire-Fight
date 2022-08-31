function onCreate()

addCharacterToList('uppercut', 'dad')

	makeAnimatedLuaSprite('animatedicon', 'icons/Whitty Ballsy Icon', getProperty('iconP2.x'), getProperty('iconP2.y'))
	addAnimationByPrefix('animatedicon', 'normal', 'Whitty B Even Icon', 24, true)
	addAnimationByPrefix('animatedicon', 'losing', 'Whitty Ba Losing Icon', 24, true)
	addAnimationByPrefix('animatedicon', 'win', 'Whitty B Winnin Icon ', 24, true)
	setObjectCamera('animatedicon', 'hud')
	
	makeAnimatedLuaSprite('bomb', 'ballistic/bomb');
	addAnimationByPrefix('bomb','bombani','Bomb Head',24,false)
	addAnimationByPrefix('bomb','bombidle','Idle',24,false)
	objectPlayAnimation('bomb','bombidle',false)
	addLuaSprite('bomb', true);


	makeAnimatedLuaSprite('animatediconbf', 'icons/bf-ice-icon', getProperty('iconP1.x'), getProperty('iconP1.y'))
	addAnimationByPrefix('animatediconbf', 'win', 'BF ice winning icon ', 24, true)
	addAnimationByPrefix('animatediconbf', 'normal', 'BF ice even icon', 24, true)
	addAnimationByPrefix('animatediconbf', 'losing', 'BF ice dyin icon', 24, true)
	setObjectCamera('animatediconbf', 'hud')
	
	addCharacterToList('BF Powerup', 'boyfriend')
	addCharacterToList('Whitty Rage', 'dad')


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
	


   	makeLuaSprite('eff','thefunnyeffect', 0, 0)
	setGraphicSize('eff',1280,720)
	setObjectCamera('eff','camHud')
	updateHitbox('eff')
	setBlendMode('eff','multiply')
	addLuaSprite('eff', false);
	
end

function onUpdatePost()

	if flashingLights then
		setProperty('eff.alpha',getProperty('health')/1.5)
	end

end

function onCreatePost()
	
	
end

function onUpdate()
	
		

	setObjectOrder('shield', 25)
	setObjectOrder('bomb', 70)
	setObjectOrder('dadGroup', 71)
	setObjectOrder('boyfriendGroup', 72)
	setObjectOrder('animatediconbf', 75)
	setObjectOrder('healthBar', 10)
	setObjectOrder('healthBarBG',5)
	setObjectOrder('animatedicon', 74)
	--[[if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
		removeLuaSprite('Fire Blast')
	end]]

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
	triggerEvent('Change Character', '0', 'bf-ice - Copy')
	triggerEvent('Change Character', '1', 'bomb-man')
end

function onStartSong()	
	
	triggerEvent('Change Character', '0', 'bf-ice')
	triggerEvent('Change Character', '1', 'bomb-man')
end

function onStepHit()
	if curStep == 2152 then
		objectPlayAnimation('BallisticBackground','bgflash',true)
		setProperty('BallisticBackground.offset.x', 50)
		setProperty('BallisticBackground.offset.y', 0)
	end

	if curStep == 2134 then
		
		triggerEvent('Change Character', '1', 'uppercut')
		triggerEvent('Play Animation', '1', 'idle')
	end
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