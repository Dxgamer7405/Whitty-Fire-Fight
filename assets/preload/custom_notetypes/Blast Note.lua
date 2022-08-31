function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Blast Note' then --Check if the note on the chart is a Bullet Note
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'nevada/notes/Blast Note'); --Change texture
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let BF's notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); --Miss has penalties
			end
		end
	end
end



function noteMiss(id, direction, noteType, isSustainNote)
	if noteType == 'Blast Note' and difficulty == 1 then
		setProperty('health', -1);
		
	elseif noteType == 'Blast Note' and difficulty == 0 then
		setProperty('health', getProperty('health')-0.8);
		runTimer('bleed', 0.2, 20);
		
		characterPlayAnim('boyfriend', 'hurt', true);
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	-- A loop from a timer you called has been completed, value "tag" is it's tag
	-- loops = how many loops it will have done when it ends completely
	-- loopsLeft = how many are remaining
	if tag == 'bleed' then
		setProperty('health', getProperty('health')-0.001);
	end
	if tag == 'shootanim' then
		setProperty('dad.curCharacter', curDad);
	end
end