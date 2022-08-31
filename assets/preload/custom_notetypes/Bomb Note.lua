function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is a Bullet Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Bomb Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'Bomb Arrows'); --Change texture
		end
	end
	--debugPrint('Script started!')
end

