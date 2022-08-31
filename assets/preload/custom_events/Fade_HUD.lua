function onEvent(name, value1, value2) 
	if name == 'Fade_HUD' then
		doTweenAlpha('cya', 'camHUD', 0, 1, 'linear');
	end
end		