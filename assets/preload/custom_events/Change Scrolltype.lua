-- Base Detect
local defaultVert = false
local defaultHori = false
local Vertical = false -- True is downscroll, false is upscroll
local Horizontal = false -- True is middlescroll, false is sidescroll
local updateLabels = false
local vinstant = false
local hinstant = false
local chartingMode
local autoSwapHorizontal
function onCreatePost()
	chartingMode = getPropertyFromClass('PlayState', 'chartingMode')
	Vertical = downscroll
	defaultVert = Vertical
	Horizontal = middlescroll
	defaultHori = Horizontal
	if chartingMode then
		updateLabels = true
		-- Label's to see Defaults
		makeLuaText('defaultslabel', "   Default's: " .. (defaultVert and "Downscroll" or "Upscroll") .. " and " .. (defaultHori and "Middlescroll" or "Sidescroll"),x, y, 340);
		setProperty('defaultslabel.pos.x', getProperty('Vert.pos.x'));
		setProperty('defaultslabel.pos.y', getProperty('Vert.pos.y'));
		setTextSize('defaultslabel', 24);
		setProperty('defaultslabel' ..'.borderColor', getColorFromHex('000000'));
		setProperty('defaultslabel' ..'.borderSize', 1.2);
		addLuaText('defaultslabel');
		-- Cool, shitty title
		makeLuaText('titlingthisshit', '    Current Scrolltypes', x, y, 370);
		setProperty('titlingthisshit.pos.x', getProperty('Vert.pos.x'));
		setProperty('titlingthisshit.pos.y', getProperty('Vert.pos.y'));
		setTextSize('titlingthisshit', 34);
		setProperty('titlingthisshit' ..'.borderColor', getColorFromHex('000000'));
		setProperty('titlingthisshit' ..'.borderSize', 1.2);
		addLuaText('titlingthisshit');
		-- Vertical Label
		makeLuaText('Vert', (Vertical and "on" or "off"), x, y, 400);
		setProperty('Vert.scale.x', getProperty('scoreTxt.scale.x'));
		setProperty('Vert.scale.y', getProperty('scoreTxt.scale.y'));
		setTextSize('Vert', 48);
		setProperty('Vert' ..'.borderColor', getColorFromHex('000000'));
		setProperty('Vert' ..'.borderSize', 1.2);
		addLuaText('Vert');
		-- Horizontal Label
		makeLuaText('Hori', (Horizontal and "on" or "off"), x, y, 450);
		setProperty('Hori.pos.x', getProperty('Vert.pos.x'))
		setProperty('Hori.pos.y', getProperty('Vert.pos.y'))
		setProperty('Hori.scale.x', getProperty('scoreTxt.scale.x'))
		setProperty('Hori.scale.y', getProperty('scoreTxt.scale.y'))
		setTextSize('Hori', 48);
		setProperty('Hori' ..'.borderColor', getColorFromHex('000000'));
		setProperty('Hori' ..'.borderSize', 1.2);
		addLuaText('Hori');
		-- Section Label
		makeLuaText('sectionCheck', tostring(sectionCheck), x, y, 500);
		setProperty('sectionCheck.pos.x', getProperty('Hori.pos.x'))
		setProperty('sectionCheck.pos.y', getProperty('Hori.pos.y'))
		setProperty('sectionCheck.scale.x', getProperty('scoreTxt.scale.x'))
		setProperty('sectionCheck.scale.y', getProperty('scoreTxt.scale.y'))
		setTextSize('sectionCheck', 48);
		setProperty('sectionCheck' ..'.borderColor', getColorFromHex('000000'));
		setProperty('sectionCheck' ..'.borderSize', 1.2);
	end
end

function onUpdate()
	--[[debugPrint('Player:'..defaultPlayerStrumX0..' ', defaultPlayerStrumX1..' ', defaultPlayerStrumX2..' ', defaultPlayerStrumX3)
	debugPrint('Opponent:'..defaultOpponentStrumX0..' ', defaultOpponentStrumX1..' ', defaultOpponentStrumX2..' ', defaultOpponentStrumX3)]]
	if (updateLabels) then
		setProperty('Vert.text', '  Downscroll: ' .. (Vertical and "On" or "Off"))
		setProperty('Hori.text', '  Middlescroll: ' .. (Horizontal and "On" or "Off"))
		setProperty('sectionCheck.text', '  Section: ' .. (gfSection and 'Dancer' or mustHitSection and "Player" or "Opponent"))
	end
	if chartingMode then -- Presepctive off of player strums!
		if keyJustPressed('left') then
			triggerEvent('Change Scrolltype', '', 'on')
		elseif keyJustPressed('down') then
			triggerEvent('Change Scrolltype', 'on', '')
		elseif keyJustPressed('up') then
			triggerEvent('Change Scrolltype', 'off', '')
		elseif keyJustPressed('right') then
			triggerEvent('Change Scrolltype', '', 'off')
		end
	end
end

function onUpdatePost(elapsed)
	-- Shit here by methewhenmethe#7219 this is to fix the wired visual issues with noteTweenDirection!
	noteCount = getProperty('notes.length');

	for i = 0, noteCount - 1 do

		noteData = getPropertyFromGroup('notes', i, 'noteData')
		strumShit = 'h'
		if noteData > 3 then
			strumShit = 'playerStrums'
			noteData = noteData - 4
		else
			strumShit = 'opponentStrums'
		end
		if getPropertyFromGroup('notes', i, 'isSustainNote') then
			setPropertyFromGroup('notes', i, 'angle', getPropertyFromGroup(strumShit, noteData, 'direction') - 90)
		else
			setPropertyFromGroup('notes', i, 'angle', 0)
		end
	end
	-- End of the fix

	if autoSwapHorizontal == true then
		if mustHitSection == false then
			triggerEvent('Change Scrolltype', '', 'off')
		elseif mustHitSection == true then
			triggerEvent('Change Scrolltype', '', 'on')
		end
	else
		-- Leave Blank
	end
end

local defTween = 'backIn'
local defDuration = 0.5
local curTween = defTween
local curDuration = defDuration
function onEvent(name, value1, value2)
	if name == 'Change Scrolltype' then
		-- Vertical Scrolltypes
		if value1 == 'off' or value1 == 'on' then -- Switch to Upscroll
			Vertical = (value1 == "on")
		elseif value1 == 'swap' then -- Swap between Up and Downscroll
			Vertical = not Vertical
		elseif value1 == 'default' then -- Switch Back to Default Scrolltype
			Vertical = defaultVert
		elseif value1 == 'insta' then
			--curTween = 'linear'
			curDuration = 0.0001
			Vertical = not Vertical
		end
		
		-- Horizontal Scrolltypes
		if value2 == 'off' or value2 == 'on' then -- Switch to Upscroll
			Horizontal = (value2 == "on")
		elseif value2 == 'swap' then -- Swap between Up and Downscroll
			Horizontal = not Horizontal
		elseif value2 == 'default' then -- Switch Back to Default Scrolltype
			Horizontal = defaultHori
		elseif value2 == 'insta' then
			--curTween = 'linear'
			curDuration = 0.0001
			Horizontal = not Horizontal
		end

		-- Weird Shit but it's cool - Doesn't work properly sadly
		if value2 == 'unfunny' then
			autoSwapHorizontal = true
			if chartingMode then
				addLuaText('sectionCheck');
			end
		elseif value2 == 'funny' then
			autoSwapHorizontal = false
			if chartingMode then
				removeLuaText('sectionCheck', false);
			end
		end


		-- Up and Downscroll
		for i = 0, 7 do
			if downscroll then
				noteTweenDirection('scrollDir' .. i, i, (Vertical and 90 or -90), curDuration, curTween)
			else
				noteTweenDirection('scrollDir' .. i, i, (Vertical and -90 or 90), curDuration, curTween)
			end
			setProperty('healthBar.y', (Vertical and 75 or 650))
			setProperty('timeBar.y', (Vertical and 688 or 31))
			setProperty('iconP1.y', getProperty('healthBar.y') - 75)
			setProperty('iconP2.y', getProperty('healthBar.y') - 75)
			setProperty('scoreTxt.y', getProperty('healthBar.y') + 25)
			setProperty('timeTxt.y', getProperty('timeBar.y') - 12)
			if Vertical == false then
				noteTweenY('moveNoteY' .. i, i, 50, curDuration, curTween)
				setProperty('botplayTxt.y', 606)
			else
				noteTweenY('moveNoteY' .. i, i, 570, curDuration, curTween)
				setProperty('botplayTxt.y', 82)
			end

		end


		-- Side and Middlescroll
		local leftSide = {92, 204, 316, 428}
		local rightSide = {732, 844, 956, 1068}
		local middleWay = {412, 524, 636, 748}
		local splitWay = {82, 194, 971, 1083}
		if Horizontal then
			for i = 4, 7 do
				noteTweenX('moveNoteX'..i, i, middleWay[i-3], curDuration, curTween);
			end
			for i = 0, 3 do
				noteTweenX('moveNoteX'..i, i, splitWay[i+1], curDuration, curTween);
				noteTweenAlpha('alphaNote' .. i, i, 0.5, curDuration, curTween)
			end
		else
			for i = 4, 7 do
				noteTweenX('moveNoteX'..i, i, rightSide[i-3], curDuration, curTween);
			end
			for i = 0, 3 do
				noteTweenX('moveNoteX'..i, i, leftSide[i+1], curDuration, curTween);
				noteTweenAlpha('alphaNote' .. i, i, 1, curDuration, curTween)
			end
		end
		curTween = defTween
		curDuration = defDuration
	end
end

function onEndSong()
	for i = 0,7 do
		cancelTween('scrollDir' .. i)
		cancelTween('moveNoteY' .. i)
		cancelTween('moveNoteX' .. i)
		cancelTween('alphaNote' .. i)
	end
	return Function_Continue
end

function onGameOver()
	for i = 0,7 do
		cancelTween('scrollDir' .. i)
		cancelTween('moveNoteY' .. i)
		cancelTween('moveNoteX' .. i)
		cancelTween('alphaNote' .. i)
	end
	return Function_Continue
end


-- Made by ImaginationSuperHero52806#2485 and JasonTheOne111#1000
-- Cleaned up and fixed by Superpowers#3887
-- Heatlthbar movement by The Shade Lord#9206