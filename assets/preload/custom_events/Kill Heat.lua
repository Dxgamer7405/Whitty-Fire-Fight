function onCreate()
	
end

-- Event notes hooks
function onEvent(name, value1, value2)
	if name == "Kill Heat" then
		removeLuaSprite('heated', true)
	end
end