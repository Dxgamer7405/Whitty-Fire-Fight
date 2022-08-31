function onCreate()
	
end

-- Event notes hooks
function onEvent(name, value1, value2)
	if name == "Kill White Overlay" then
		removeLuaSprite('overlayc', true)
	end
end