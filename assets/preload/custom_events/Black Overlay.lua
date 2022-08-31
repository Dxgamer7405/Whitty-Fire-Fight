function onCreate()
	
	

end

function onStartCountdown()
	makeLuaSprite('overlayb', 'overhead/Overlays/Black', -210, -100)
		
	setObjectCamera('overlayb', 'hud')
	addLuaSprite('overlayb', true)
	scaleObject('overlayb',0.85,0.85)
	doTweenAlpha('overlaybs', 'overlayb', 0, 0.000001, 'linear')
end

-- Event notes hooks
function onEvent(name, value1, value2)
	if name == "Black Overlay" then
		doTweenAlpha('overlaybin', 'overlayb', 1, 0.25, 'smoothStepIn')
	end
end




