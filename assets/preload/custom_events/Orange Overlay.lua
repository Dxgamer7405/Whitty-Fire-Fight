function onCreate()
	
end

-- Event notes hooks
function onEvent(name, value1, value2)
	if name == "Orange Overlay" then
		makeLuaSprite('overlaya', 'overhead/Overlays/Orange', -210, -100)
		setScrollFactor('overlaya', 0, 0);
		setProperty("overlaya.scale.x", 1.3);
	setProperty("overlaya.scale.y", 1.3);
	addLuaSprite('overlaya', true)
	


	end
end




