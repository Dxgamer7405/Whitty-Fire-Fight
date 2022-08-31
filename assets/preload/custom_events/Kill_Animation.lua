function onCreate()
	
end

-- Event notes hooks
function onEvent(name, value1, value2)
	if name == "Kill_Animation" then
		removeLuaSprite('animation', true)
	end
end