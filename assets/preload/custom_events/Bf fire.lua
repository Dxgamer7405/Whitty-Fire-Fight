function onCreate()
	
end

-- Event notes hooks
function onEvent(name, value1, value2)
	if name == "Bf fire" then
	makeAnimatedLuaSprite('gem1', 'Whitty and Echo ability Sprites', 50, 20)
	addAnimationByPrefix('gem1', 'bounce', 'Fire Blast BF instance 1', 24, true)
	addLuaSprite('gem1', true)
	objectPlayAnimation('gem1', 'bounce', true)

	characterPlayAnim('dad', 'hit', true);
	setProperty('dad.specialAnim', true);
	end
end




