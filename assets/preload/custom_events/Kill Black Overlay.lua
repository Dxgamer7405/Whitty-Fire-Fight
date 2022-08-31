function onCreate()
	
end

-- Event notes hooks
function onEvent(name, value1, value2)
	if name == "Kill Black Overlay" then
		doTweenAlpha('overlaybremove', 'overlayb', 0, 0.3, 'linear')
	end
end