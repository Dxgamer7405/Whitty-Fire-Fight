
-- Event notes hooks
function onEvent(name, value1, value2)
	if name == "Heated Up Bf" then
	makeAnimatedLuaSprite('heated', 'overhead/Words/Heated Up', 1000, 220)
	addAnimationByPrefix('heated', 'heat', 'Heated Up', 28, false)
	addLuaSprite('heated', true)
	objectPlayAnimation('heated', 'heat', true)
	setProperty("heated.scale.x", 2);
	setProperty("heated.scale.y", 2);
	end

end




