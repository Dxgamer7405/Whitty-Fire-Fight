function onCreate()
	
end

-- Event notes hooks
function onEvent(name, value1, value2)
	if name == "Kill fire" then
		removeLuaSprite('gem2', true)
	end
end