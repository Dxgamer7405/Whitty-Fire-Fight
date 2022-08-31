function onCreate()
	
end

-- Event notes hooks
function onEvent(name, value1, value2)
	if name == 'Normal Arrows' then
		for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is a Bullet Note
			if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'No Animation' then
				setPropertyFromGroup('unspawnNotes', i, 'texture', 'NOTE_assets'); --Change texture
				setPropertyFromGroup('unspawnNotes', i, 'texture', 'NOTE_assets'); --Change texture
				setPropertyFromGroup('playerStrums', i, 'texture', 'NOTE_assets');
			end
		end
	end
end




