
-- Event notes hooks
function onEvent(name, value1, value2)
	if name == "Heated Up" then
	--makeAnimatedLuaSprite('heated', 'overhead/Words/Heated Up', 400, 20)
	--addAnimationByPrefix('heated', 'heat', 'Heated Up', 28, true)
	addLuaSprite('heated', true)
	objectPlayAnimation('heated', 'heat', false)
	--setProperty("heated.scale.x", 2);
	--setProperty("heated.scale.y", 2);
	end

end




