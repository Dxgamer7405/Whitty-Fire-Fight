function onCreate()
	
end

-- Event notes hooks
function onEvent(name, value1, value2)
	if name == "Kill Orange Overlay" then
		doTweenAlpha('overlayaremove', 'overlaya', 0, 0.3, 'linear')
		
	end
end