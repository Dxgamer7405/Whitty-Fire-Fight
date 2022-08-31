function onCreate()
	
end

-- Event notes hooks
function onEvent(name, value1, value2)
	if name == "Focus (3)" then
		removeLuaSprite('gem1', true)
	end
end