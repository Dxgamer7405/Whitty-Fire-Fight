function onCreate()
	-- background shit
	makeAnimatedLuaSprite('BallisticBackground', 'ballistic/Ballistic BG', -650, -200);
	addAnimationByPrefix('BallisticBackground','bg','Bg again',24,true)
	objectPlayAnimation('BallisticBackground','bg',true)
	setLuaSpriteScrollFactor('BallisticBackground', 0.9, 0.9);
	

	-- sprites that only load if Low Quality is turned off

	addLuaSprite('BallisticBackground', false);
	
	
end

--[[function onStepHit()
	objectPlayAnimation('BallisticBackground','bg',true)
end]]