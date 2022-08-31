function onCreate()
	
end

-- Event notes hooks
function onEvent(name, value1, value2)
	if name == "Why" then
		makeLuaSprite('overlayc', 'overhead/Overlays/white', -210, -100)
		setScrollFactor('overlayc', 0, 0);
		addLuaSprite('overlayc', true)
		setProperty("overlayc.scale.x", 1.3);
		setProperty("overlayc.scale.y", 1.3);
		makeLuaSprite('head', 'overhead/head', -150, 210)
		setScrollFactor('head', 0, 0);
		addLuaSprite('head', true)
		makeLuaSprite('text', 'overhead/Why', -150, 400)
		setScrollFactor('text', 0, 0);
		addLuaSprite('text', true)
		setObjectCamera('text', 'camHUD');
		setProperty("text.scale.x", 0.65);
		setProperty("text.scale.y", 0.65);
		setObjectCamera('head', 'camHUD');
		setProperty("head.scale.x", 0.65);
		setProperty("head.scale.y", 0.65);
		setObjectCamera('overlayc', 'camHUD')


	end
end




