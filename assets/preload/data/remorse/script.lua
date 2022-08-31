function goodNoteHit(id, direction, noteType, isSustainNote)
    -- Function called when you hit a note (after note hit calculations)
	-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
	-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
	-- noteType: The note type string/tag
	-- isSustainNote: If it's a hold note, can be either true or false
    if direction == 0 and noteType == "No Animation" then
        triggerEvent('Play Animation', 'singLEFT-christ', 'BF')
    end

    if direction == 1 and noteType == "No Animation" then
        triggerEvent('Play Animation', 'singDOWN-christ', 'BF')
    end

    if direction == 2 and noteType == "No Animation" then
        triggerEvent('Play Animation', 'singUP-christ', 'BF')
    end

    if direction == 3 and noteType == "No Animation" then
        triggerEvent('Play Animation', 'singRIGHT-christ', 'BF')
    end

end