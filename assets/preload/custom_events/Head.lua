function onCreate()
	
end

-- Event notes hooks
function onEvent(name, value1, value2)
	if name == "Head" then
		makeLuaSprite('head', 'overhead/head', -150, 250)
		setScrollFactor('head', 0, 0);
	addLuaSprite('head', true)
	


	end
end




