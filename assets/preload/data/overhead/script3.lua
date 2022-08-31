function onCreate()
   setPropertyFromClass('GameOverSubstate', 'characterName', 'bfwhitty2');
   addCharacterToList('bf-fire-death', 'boyfriend')
  addCharacterToList('gfright', 'girlfriend')
   addCharacterToList('gfleft', 'girlfriend')
   addCharacterToList('BF Flame', 'boyfriend');
   addCharacterToList('BF Flame Miss', 'boyfriend');
   addCharacterToList('WhittyScream', 'dad');
      addCharacterToList('whit', 'dad');
   precacheImage('overhead/Fall')
   addCharacterToList('BF Powerup', 'boyfriend');
     doTweenX('barscalex', 'timeBar.scale', 0, 0.0001, 'linear')
    doTweenX('barboxscalex', 'timeBarBG.scale', 0, 0.0001, 'linear')
    doTweenAlpha('HideHud', 'camHUD', 0, 0.001, 'linear')
    doTweenX('healthscalex', 'healthBar.scale', 0.00001, 0.0001, 'linear')
    doTweenX('healthboxscalex', 'healthBarBG.scale', 0.00001, 0.0001, 'linear')
    doTweenAlpha('iconDadFadeEventTween', 'neutral', 0, 0.001, 'linear')
    doTweenAlpha('iconBfFadeEventTween', 'iconP1', 0, 0.001, 'linear')
	doTweenAlpha('fightmove', 'fight', 0, 0.00001, 'linear')
	doTweenY('androidCX', 'androidc', -550.00001, 0.001, 'linear')
	doTweenY('androidCY', 'androidControls', -550.00001, 0.001, 'linear')
end

function noteMiss(id, direction, noteType, isSustainNote)
	-- Function called when you hit a note (after note hit calculations)
	-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
	-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
	-- noteType: The note type string/tag
	-- isSustainNote: If it's a hold note, can be either true or false
    if firemiss == true then
        triggerEvent('Change Character', '0', 'BF Flame Miss' )
        triggerEvent('Play Animation', direction , 'Bf')
        runTimer('toidle', 0.2)
    end
end

function onTimerCompleted(tag)
    if tag == "toidle" then
        if firemiss == true then
            triggerEvent('Change Character','0', 'BF Flame')
            triggerEvent('Play Animation','idle', 'Bf')
        end
    end        
end

function onUpdate()
    if firedeath == true and fie == true then
        setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-fire-death');
        fie = false
    end
end

function onSongStart()
    doTweenX('barscalex', 'timeBar.scale', 0, 0.0001, 'linear')
    doTweenX('barboxscalex', 'timeBarBG.scale', 0, 0.0001, 'linear')
    noteTweenX('15tweenCutOffAlpha22', 0, -500, 0.000000001, 'linear');
    noteTweenX('15tweenCutOffAlpha23', 1, -400, 0.000000001, 'linear');
    noteTweenX('15tweenCutOffAlpha24', 2, -300, 0.000000001, 'linear');
    noteTweenX('15tweenCutOffAlpha25', 3, -100, 0.000000001, 'linear');
    noteTweenX('15tweenCutOffAlpha26', 4, 1100, 0.000000001, 'linear');
    noteTweenX('15tweenCutOffAlpha27', 5, 1200, 0.000000001, 'linear');
    noteTweenX('15tweenCutOffAlpha28', 6, 1300, 0.000000001, 'linear');
    noteTweenX('15tweenCutOffAlpha29', 7, 1400, 0.000000001, 'linear');
    doTweenAlpha('iconDadFadeEventTween', 'neutral', 1, 1.4, 'linear')
    doTweenAlpha('iconBfFadeEventTween', 'iconP1', 1, 1.4, 'linear')
    doTweenX('healthscalex', 'healthBar.scale', 0.00001, 0.0001, 'linear')
    doTweenX('healthboxscalex', 'healthBarBG.scale', 0.00001, 0.0001, 'linear')
    doTweenY('androidCXA', 'androidc', 0.00001, 1.1, 'linear')
	doTweenY('androidCYA', 'androidControls', 0.00001, 1.1, 'linear')
end
function onStepHit()
	if curStep == 1 then
    doTweenX('barscalex', 'timeBar.scale', 0, 0.0001, 'linear')
    doTweenX('barboxscalex', 'timeBarBG.scale', 0, 0.0001, 'linear')
    noteTweenX('15tweenCutOffAlpha22', 0, -500, 0.000000001, 'linear');
    noteTweenX('15tweenCutOffAlpha23', 1, -400, 0.000000001, 'linear');
    noteTweenX('15tweenCutOffAlpha24', 2, -300, 0.000000001, 'linear');
    noteTweenX('15tweenCutOffAlpha25', 3, -100, 0.000000001, 'linear');
    noteTweenX('15tweenCutOffAlpha26', 4, 1100, 0.000000001, 'linear');
    noteTweenX('15tweenCutOffAlpha27', 5, 1200, 0.000000001, 'linear');
    noteTweenX('15tweenCutOffAlpha28', 6, 1300, 0.000000001, 'linear');
    noteTweenX('15tweenCutOffAlpha29', 7, 1400, 0.000000001, 'linear');
    doTweenAlpha('iconDadFadeEventTween', 'neutral', 1, 1.4, 'linear')
    doTweenAlpha('iconBfFadeEventTween', 'iconP1', 1, 1.4, 'linear')
    doTweenX('healthscalex', 'healthBar.scale', 0.00001, 0.0001, 'linear')
    doTweenX('healthboxscalex', 'healthBarBG.scale', 0.00001, 0.0001, 'linear')
    doTweenY('androidCXA', 'androidc', 0.00001, 1.1, 'linear')
	doTweenY('androidCYA', 'androidControls', 0.00001, 1.1, 'linear')

		triggerEvent('Camera Follow Pos', '840', '400')
	end
if curStep == 1487 then
        
		doTweenX('barscalex', 'timeBar.scale', 0, 0.0001, 'linear')
	    doTweenX('barboxscalex', 'timeBarBG.scale', 0, 1, 'linear')
    	noteTweenX('15tweenCutOffAlpha22', 0, -500, 1, 'linear');
    	noteTweenX('15tweenCutOffAlpha23', 1, -400, 1, 'linear');
    	noteTweenX('15tweenCutOffAlpha24', 2, -300, 1, 'linear');
    	noteTweenX('15tweenCutOffAlpha25', 3, -100, 1, 'linear');
    	noteTweenX('15tweenCutOffAlpha26', 4, 1500, 1, 'linear');
    	noteTweenX('15tweenCutOffAlpha27', 5, 1600, 1, 'linear');
    	noteTweenX('15tweenCutOffAlpha28', 6, 1700, 1, 'linear');
    	noteTweenX('15tweenCutOffAlpha29', 7, 1800, 1, 'linear');
    	doTweenAlpha('iconDadFadeEventTween', 'neutral', 0, 1.4, 'linear')
        doTweenAlpha('iconDad2FadeEventTween', 'danger', 0, 1.4, 'linear')
    	doTweenAlpha('iconBfFadeEventTween', 'iconP1', 0, 1.4, 'linear')
        doTweenAlpha('iconBf2FadeEventTween', 'animatediconbf', 0, 1.4, 'linear')
        doTweenAlpha('iconDaddFadeEventTween', 'iconP2', 0, 1.4, 'linear')
    	doTweenX('healthscalex', 'healthBar.scale', 0, 1.6, 'linear')
    	doTweenX('healthboxscalex', 'healthBarBG.scale', 0, 1.6, 'linear')
		doTweenAlpha('txt1', 'timeTxt', 0, 1.5, 'linear')
        doTweenX('barscalex', 'timeBar.scale', 0.0000001, 1.5, 'elasticOut')
        doTweenX('barboxscalex', 'timeBarBG.scale', 0.0000001, 1.5, 'elasticOut')
        doTweenY('androidCXC', 'androidc', -550.00001, 1.0001, 'linear')
	    doTweenY('androidCYC', 'androidControls', -550.00001, 1.0001, 'linear')
	end
    if curStep == 4 then
        doTweenX('healthboxscalex', 'healthBarBG.scale', 1, 1.6, 'elasticOut')
        doTweenX('healthscalex', 'healthBar.scale', 1, 1.6, 'elasticOut')
    end
    if curStep == 10 then
      doTweenX('barscalex', 'timeBar.scale', 1.5, 1.5, 'elasticOut')
      doTweenX('barboxscalex', 'timeBarBG.scale', 1.5, 1.5, 'elasticOut')
    end
    if curStep == 1 then
       doTweenAlpha('HideHud', 'camHUD', 1, 0.1, 'linear')
       noteTweenX('15tweenCutOffAlpha9', 0, 92, 1, 'elasticOut');
       noteTweenX('15tweenCutOffAlpha10', 1, 202, 1, 'elasticOut');
       noteTweenX('15tweenCutOffAlpha11', 2, 312, 1, 'elasticOut');
       noteTweenX('15tweenCutOffAlpha12', 3, 422, 1, 'elasticOut');

        noteTweenX('15tweenCutOffAlpha13', 4, 742, 1, 'elasticOut');
        noteTweenX('15tweenCutOffAlpha14', 5, 852, 1, 'elasticOut');
        noteTweenX('15tweenCutOffAlpha15', 6, 962, 1, 'elasticOut');
        noteTweenX('15tweenCutOffAlpha16', 7, 1072, 1, 'elasticOut');
    end
    if curStep == 60 then
        started = true
    end
    if curStep == 180 then
        triggerEvent('Change Character', 'BF', 'BF Powerup')
        characterPlayAnim('bf', 'idle', true)
   end
   if curStep == 188 then
        triggerEvent('Change Character', 'BF', 'BF Flame');
        triggerEvent('Change Character', '2', 'GFNew');
        firemiss = true
        firedeath = true
        started = false
        fie = true
   end
   if curStep == 776 or curStep == 782 or curStep ==1288 or curStep == 1294 then
       triggerEvent('Change Character', '1', 'WhittyScream');
       triggerEvent('Screen Shake', 0.4 ,0.04)
   end
   if curStep == 780 or curStep == 786 or curStep == 1292 or curStep == 1298 then
       triggerEvent('Change Character', '1', 'WhittyAgro');
   end
   if curStep == 448 then
       triggerEvent('Change Character', '1', 'whit');
       quickLuaSprite('dialogue1', 'overhead/Why', 100, 400)
       quickLuaSprite('dialogueHead', 'overhead/head', 150, 210)
   end
   if curStep == 450 then
      quickLuaSprite('dialogue2', 'overhead/The', 100, 400)
      removeLuaSprite('dialogue1', true);
   end
   if curStep == 452 then
      quickLuaSprite('dialogue3', 'overhead/Hell', 100, 400)
      removeLuaSprite('dialogue2', true);
   end
      if curStep == 457 then
      quickLuaSprite('dialogue4', 'overhead/Wont', 100, 400)
      removeLuaSprite('dialogue3', true);
   end
      if curStep == 461 then
      quickLuaSprite('dialogue5', 'overhead/You', 100, 400)
      removeLuaSprite('dialogue4', true);
   end
   if curStep == 464 then
      quickLuaSprite('dialogue6', 'overhead/Leave', 100, 400)
       removeLuaSprite('dialogue5', true)
   end
   if curStep == 467 then
      quickLuaSprite('dialogue7', 'overhead/Me', 100, 400)
       removeLuaSprite('dialogue6', true)
   end
   if curStep == 470 then
      quickLuaSprite('dialogue8', 'overhead/a-', 100, 400)
       removeLuaSprite('dialogue7', true)
   end
   if curStep == 473 then
      quickLuaSprite('dialogue9', 'overhead/Alone', 100, 400)
       removeLuaSprite('dialogue8', true)
   end
   if curStep == 476 then
      removeLuaSprite('dialogue9', true);
      removeLuaSprite('dialogueHead', true);
   end
   if curStep == 477 then
       triggerEvent('Change Character', '1', 'WhittyAgro');
       quickAnimatedLuaSprite('dialogueBye', 'overhead/Fall', 200, 500, 'Text Fall', 24, false);
   end
   if curStep == 482 then
      removeLuaSprite('dialogueBye', true);
   end
   if curStep == 480 or curStep == 483 or curStep == 486 then
      triggerEvent('Play Animation', 'Shock', 'Dad');
   end
end

function quickLuaSprite(tag, image, x, y)
    makeLuaSprite(tag, image, x, y);
	addLuaSprite(tag, true);
	setObjectCamera(tag, 'camHUD');
	scaleObject(tag, 0.7, 0.7)
end

function quickAnimatedLuaSprite(tag, image, x, y, Anim, fps, Loop)
    makeAnimatedLuaSprite(tag, image, x, y);
    addAnimationByPrefix(tag, 'idle', Anim, fps, Loop)
    objectPlayAnimation(tag, 'idle');
	addLuaSprite(tag, true);
	setObjectCamera(tag, 'camHUD');
	scaleObject(tag, 0.9, 0.9)
end

function onMoveCamera(focus)
if started == true then
	if focus == 'dad' then
       triggerEvent('Change Character', '2', 'gfleft');
    elseif focus == 'boyfriend' then
        triggerEvent('Change Character', '2', 'gfright');
    elseif focus == 'gf' then
        cameraSetTarget('boyfriend')
          end
     end
end