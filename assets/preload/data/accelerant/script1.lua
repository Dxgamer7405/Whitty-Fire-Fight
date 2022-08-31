function onStepHit()
    if curStep == 1328 then
        triggerEvent('Change Character', '0', 'Flying Whitty Scream' )
        triggerEvent('Play Animation','idle', 'bf')
        runTimer('screamtoidle', 1)
        setProperty('boyfriend.x', -1450)
        setProperty('boyfriend.y', -1500)
    end

    if curStep > 1329 and curStep < 1344 then
        characterPlayAnim('dad', 'shook', true)
    end
end