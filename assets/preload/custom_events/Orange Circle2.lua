function onCreate()
	
end

-- Event notes hooks
function onEvent(name, value1, value2)
	if name == "Orange Circle2" then
		makeAnimatedLuaSprite('lvlup', 'overhead/circle/powerv2', 750, 100)
		addAnimationByPrefix('lvlup', 'heat', 'Circle', 35, true)
		addLuaSprite('lvlup', false)
		objectPlayAnimation('lvlup', 'heat', true)
	


	end
end




