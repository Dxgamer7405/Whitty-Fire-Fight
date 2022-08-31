function onUpdate()
    if allowEndSong == true then
        setPropertyFromClass('Conductor', 'songPosition', sPosition)
		setPropertyFromClass('flixel.FlxG', 'sound.music.time', getPropertyFromClass('Conductor', 'songPosition'))
		setProperty('vocals.time', getPropertyFromClass('Conductor', 'songPosition'))
		setPropertyFromClass('flixel.FlxG', 'sound.vocals.volume', 0)
		setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 0);
		setProperty('instrumental.volume', 0)
		setProperty('vocals.volume', 0)
        setProperty('gf.visible', false)
        setProperty('boyfriend.visible', false)
        setProperty('dad.visible', false)
        setProperty('camHUD.alpha', 0)
        setProperty('camGame.alpha', 0)
    end
end