local pussy = singRIGHT
local pussy1 = singDOWN
local asscuck = true
function onCreate()
    makeAnimatedLuaSprite('rageblastsgf', 'ballistic/Ballistic New/Rage Blasts Gf', defaultGirlfriendX-1000,defaultGirlfriendY-900);
	addAnimationByPrefix('rageblastsgf', 'explode', 'Gf Rage Blasts', 24, false);
    objectPlayAnimation('rageblastsgf', 'explode');
    scaleObject('rageblastsgf', 2, 2)
    addLuaSprite('rageblastsgf', true);
    
    fuckYou()
    
end

function onUpdate()
    
    setObjectOrder('rageblastsgf', 83)
end


function fuckYou()
    objectPlayAnimation('rageblastsgf', 'explode', asscuck);
    runTimer('giveHead', 0.3)
end--her life

function onTimerCompleted(tag, asscuck)
    if tag == 'giveHead' then
        setProperty('rageblastsgf.visible', false)
    end
end
function onEvent()
    if getProperty('gf.animation.curAnim.name') == 'singRIGHT' then
        setProperty('rageblastsgf.visible', true)
        fuckYou()
    end
    if getProperty('gf.animation.curAnim.name') == 'singDOWN' then
        setProperty('rageblastsgf.visible', true)
        fuckYou()
    end
end