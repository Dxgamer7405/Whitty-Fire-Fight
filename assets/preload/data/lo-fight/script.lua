local allowCountdown = false
local stops = 0;
function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and not seenCutscene then
        triggerEvent('Camera Follow Pos', '840', '400')
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end