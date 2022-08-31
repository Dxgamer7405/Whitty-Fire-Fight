function onEvent(name, value1, value2) 
	if name == 'HUD_Back' then
		doTweenAlpha('hello', 'camHUD', 1, 1, 'linear');
	end
end		