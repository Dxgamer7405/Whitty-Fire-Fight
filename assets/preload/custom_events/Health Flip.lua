function onEvent(name, value1, value2)
	if name == "Health Flip" then
    setProperty('healthBar.flipX', true)
	setProperty('healthBarBG.flipX', true)
    end
end

luaDebugMode = true