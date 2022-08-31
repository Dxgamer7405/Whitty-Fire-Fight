function onCreate()
	
end

-- Event notes hooks
function onEvent(name, value1, value2)
	if name == "Kill Fight" then
		
		removeLuaSprite('fight', true)
	end
end