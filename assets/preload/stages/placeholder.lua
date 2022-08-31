function onUpdate()
    setProperty('gf.visible', false)
    setProperty('boyfriend.visible', false)
    setProperty('dad.visible', false)
    setProperty('camHUD.alpha', 0)
end

function onCreate()
    setProperty('skipCountdown', true)
end


local allowCountdown = false
function onStartCountdown()
	if not allowCountdown and isStoryMode and not seenCutscene then --Block the first countdown
		startVideo('cut3b');
        

		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
    
end

function onSongStart()
	endSong()
end