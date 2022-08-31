function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is a Bullet Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Fire Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'Fire Arrows'); --Change texture
		end
	end
	--debugPrint('Script started!')
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
    if noteType == 'Fire Note' then
        triggerEvent('Play Animation', 'Hit', '0');
        setProperty('health', getProperty('health') + 0.05)
    end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
    if noteType == 'Fire Note' then
        triggerEvent('Play Animation', 'Hit', '1');
        if getProperty('health') > 0.1 then
        setProperty('health', getProperty('health') - 0.08)
        end
    end
end