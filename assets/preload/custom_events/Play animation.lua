function onCreate()
	runTimer("thing")
end	


-- Event notes hooks
function onEvent(name, value1, value2)
	if name == "Play anim" then
	makeAnimatedLuaSprite('animation', 'sonicJUMPSCARE', 550, 220)
	addAnimationByPrefix('animation', 'bounce', 'sonicSPOOK', 24, true)
	addLuaSprite('animation', true)
	objectPlayAnimation('animation', 'bounce', true)

	playSound('jumpscare', 1);
	
	
	end
end


function onTimerCompleted(tag, loops, loopsleft)
	removeLuaSprite('animation', true)
end






