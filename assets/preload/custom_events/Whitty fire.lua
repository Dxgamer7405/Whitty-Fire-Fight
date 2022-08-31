function onCreate()
	
end

-- Event notes hooks
function onEvent(name, value1, value2)
	if name == "Whitty fire" then
	makeAnimatedLuaSprite('gem2', 'Whitty and Echo ability Sprites', 750, 220)
	addAnimationByPrefix('gem2', 'bounce', 'Fire Blast instance 1', 24, true)
	addLuaSprite('gem2', true)
	objectPlayAnimation('gem2', 'bounce', true)

	characterPlayAnim('boyfriend', 'hit2', true);
	setProperty('boyfriend.specialAnim', true);
	end
end




