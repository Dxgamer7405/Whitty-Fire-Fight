function onCreate()
	makeLuaSprite('focus', 'focus', 0, 0);
	setLuaSpriteScrollFactor('focus', 0, 0);
	defaultCamZoom = getProperty('defaultCamZoom') - 0.01;
	setProperty('focus.scale.x', 1 / defaultCamZoom);
	setProperty('focus.scale.y', 1 / defaultCamZoom);
	setProperty('focus.alpha', 0.0001);
	addLuaSprite('focus', true);
end

-- Event notes hooks
function onEvent(name, value1, value2)
	if name == "Focus" then
		choose = tonumber(value2);
		if (choose == 0) then
	        setProperty('focus.alpha', 1);
        end
		if (choose == 1) then
	    	setProperty('focus.alpha', 0.0001);
        end
	end
end