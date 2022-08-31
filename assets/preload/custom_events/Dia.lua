function onEvent(name, value1, value2)
	if name == 'Dia' then
	    if not allowCountdown and seenCutscene then
		    setProperty('inCutscene', true);
		    runTimer('startDialogue', 0.8);
		    allowCountdown = false;
		    return Function_Stop;
        end
	end
	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogue', 'breakfast');
	end
end

-- Dialogue (When a dialogue is finished, it calls startCountdown again)
function onNextDialogue(count)
	-- triggered when the next dialogue line starts, 'line' starts with 1
end

function onSkipDialogue(count)
	-- triggered when you press Enter and skip a dialogue line that was still being typed, dialogue line starts with 1
end