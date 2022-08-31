local badEnding = false
local allowCountdown = false

function onUpdate()
	setProperty('health', 2)
	if badEnding == false then
		if getProperty('songMisses') == 7 then
			badEnding = true
			gameOver()
		end
	end
	if badEnding == true then
		setProperty('health', 0)
	end
end


function ends()
    if badEnding == true then
		runTimer('end', 46)
    end
end
function onTimerCompleted(tag)
	if tag == 'end' then
		addHaxeLibrary('Sys');runHaxeCode("Sys.exit(0);")
	end
end