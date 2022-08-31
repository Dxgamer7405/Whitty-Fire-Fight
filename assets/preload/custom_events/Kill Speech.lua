function onCreate()
	
end

-- Event notes hooks
function onEvent(name, value1, value2)
	if name == "Kill Speech" then
		removeLuaSprite('text', true)
		removeLuaSprite('head', true)
		removeLuaSprite('overlayc', true)

		objectPlayAnimation('fall', 'text', false)
		setObjectCamera('fall', 'camHUD');
		addLuaSprite('fall', true)
	end
end