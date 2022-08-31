function onCreate()
	
end

-- Event notes hooks
function onEvent(name, value1, value2)
	if name == "White Overlay" then
		makeLuaSprite('overlayc', 'overhead/Overlays/white', -210, -100)
		setScrollFactor('overlayc', 0, 0);
		setProperty("overlayc.scale.x", 1.3);
	setProperty("overlayc.scale.y", 1.3);
	addLuaSprite('overlayc', true)
	


	end
end




