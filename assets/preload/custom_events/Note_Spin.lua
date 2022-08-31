-- Event notes hooks
function onEvent(name, value1, value2)
	if name == 'Note_Spin' then
		duration = tonumber(value1);
		value = tonumber(value2);
		noteTweenAngle('notey0', 0, value, duration, 'quintOut');
		noteTweenAngle('notey1', 1, value, duration, 'quintOut');
		noteTweenAngle('notey2', 2, value, duration, 'quintOut');
		noteTweenAngle('notey3', 3, value, duration, 'quintOut');
		noteTweenAngle('notey4', 4, value, duration, 'quintOut');
		noteTweenAngle('notey5', 5, value, duration, 'quintOut');
		noteTweenAngle('notey6', 6, value, duration, 'quintOut');
		noteTweenAngle('notey7', 7, value, duration, 'quintOut');
		--debugPrint('Event triggered: ', name, duration, targetAlpha);
	end
end