function goodNoteHit(id, direction, noteType, isSustainNote)
    if noteType == "Scream" then
        triggerEvent('Play Animation', 'Scream', 'bf')
        setProperty('whitty down.visible', false)
        setProperty('whitty right.visible', false)
        setProperty('whitty left.visible', false)
        setProperty('whitty up.visible', false)
        setProperty('whitty hit.visible', false)
        setProperty('whitty shoot.visible', false)
        setProperty('whitty scream.visible', true)
        objectPlayAnimation('whitty scream', "idle", true)
    end
end