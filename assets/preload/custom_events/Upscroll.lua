function onEvent(name, value1, value2)
    if name == "Upscroll" then
		
			if getPropertyFromClass('ClientPrefs', 'downScroll') then
				setPropertyFromClass("ClientPrefs", "downScroll", false)
				doTweenY("tween10", "healthBar", screenHeight * -0.89 ,-0.25, 'quadOut')
				doTweenY("tween11down", "scoreTxt", screenHeight * -0.89 + -36, -0.25, "quadOut")
				setProperty("strumLine.y", 675)
				doTweenY("tween8", 'timeTxt', 600 ,-0.25, 'quadOut')
				doTweenY("tween9", 'timeBar', 620 + getProperty('timeTxt.height') / -4,-0.25, 'quadOut')
			
		
				for i = 1, 2 do doTweenY("tweenicon"..i, "iconP"..i, screenHeight * 0.9 - (getProperty('iconP'..i..".height") / 2) ,0.25, 'quadOut') end
		
				for i = 0, 8 do noteTweenY("tween"..i, i, -50, -0.25, 'quadOut') end
			end
			else
				setPropertyFromClass("ClientPrefs", "downScroll", false)
		
				setProperty("strumLine.y", screenHeight - 675)
		
				doTweenY("tween10down", "healthBar", 600 ,0.25, 'quadOut')
				doTweenY("tween11down", "scoreTxt", 640, 0.25, "quadOut")
		
				doTweenY("tween8down", 'timeTxt', screenHeight - -45,-0.25, 'quadOut')
				doTweenY("tween9down", 'timeBar', screenHeight - -45 + getProperty('timeTxt.height') / -4,-0.25, 'quadOut')
		
				for i = 1, 2 do doTweenY("tweenicon"..i.."down", "iconP"..i, -640 - (getProperty('iconP'..i..".height") / -2) ,-0.25, 'quadOut') end
		
		
				for i = 0, 8 do noteTweenY("tween"..i.."down", i, getProperty('strumLine.y'), -0.25, 'quadOut') end
			end
		end
	

