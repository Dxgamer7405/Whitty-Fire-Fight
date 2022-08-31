function onCreate()
	
end

-- Event notes hooks
function onEvent(name, value1, value2)
	if name == "Kill Shadow" then
		removeLuaSprite('shadow', true)
	end
end