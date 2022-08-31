push = true
function goodNoteHit()
    if push == true then
        if getProperty('dad.x') > defaultOpponentX then
            setProperty('dad.x', getProperty('dad.x')-186.25)
        end
    end
end
function onCreate()
    addCharacterToList('bf-ice-hit', 'boyfriend')
end
function opponentNoteHit(id, direction, noteType, isSustainNote)
    if dadName == 'Whitty Becomes A Drunken Idiot and Gets Fucked' then
        setProperty('dad.x', 500)

        if direction == 3 or direction == 1 then
            triggerEvent('Change Character', '0', 'bf-ice-hit')
            triggerEvent('Play Animation', 'hits1', 'bf')
            runTimer('downtoidle', 0.3)
        end

        if direction == 2 or direction == 0 then
            triggerEvent('Change Character', '0', 'bf-ice-hit')
            triggerEvent('Play Animation', 'hits2', 'bf')
            runTimer('downtoidle', 0.3)
        end
    end
end

function onTimerCompleted(tag)
    if tag == 'downtoidle' then
        triggerEvent('Change Character', '0', 'bf-ice')
    end
end

function onBeatHit()
    if curBeat == 424 then
        push = false
    end
    if curBeat == 432 then
        push = true
    end
    if curBeat == 440 then
        push = false
    end
    if curBeat == 448 then
        push = true
    end
end