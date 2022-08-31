function onCreate()
	
end

-- Event notes hooks
function onEvent(name, value1, value2)
	if name == "Me" then
		makeLuaSprite('text', 'overhead/Me', -150, 400)
		setScrollFactor('text', 0, 0);
		setObjectCamera('text', 'camHUD');
		setProperty("text.scale.x", 0.65);
		setProperty("text.scale.y", 0.65);
	addLuaSprite('text', true)
	


	end
end




