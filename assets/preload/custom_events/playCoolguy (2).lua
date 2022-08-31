-- Event notes hooks
function onEvent(name, value1, value2)
    if name == 'playCoolguy' then
        duration = tonumber(value1);
        if duration == 0 then
            duration = 0;
        end
        targetalpha = tonumber(value2);

        if duration == 0 then
            setProperty('dad.alpha', targetalpha);
            setProperty('iconP2.alpha', targetalpha);
        else
            doTweenAlpha('dadFadeEventTween', 'dad', targetalpha, duration, 'linear');
            doTweenAlpha('iconDadfadeEventTween', 'iconP2', targetalpha, duration, 'linear');
        end
    end
end
-- sorry! first time coding on lua lol!