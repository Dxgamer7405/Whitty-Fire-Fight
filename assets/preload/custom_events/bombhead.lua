function onEvent(n,v,b)

	if n == 'bombhead' then
    
	objectPlayAnimation('bomb','bombani',true)
	
	end
end

function onStepHit()
	if curStep == 1055 then
		setProperty('bomb.visible', false)
	end
end