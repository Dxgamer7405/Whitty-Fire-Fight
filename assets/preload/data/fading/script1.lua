function noteMiss(id, direction, noteType, isSustainNote)
missAnimation = {"singLEFT","singRIGHT","singUP","singDOWN"}
runTimer('backtoidleBF',0.24,1)
doTweenColor('missed', 'boyfriend', '7666EC', 0.001, 'linear')
if direction == 0 then
characterPlayAnim('boyfriend', 'singLEFT')
elseif direction == 1 then
characterPlayAnim('boyfriend', 'singUP')
elseif direction == 2 then
characterPlayAnim('boyfriend', 'singDOWN')
elseif direction == 3 then
characterPlayAnim('boyfriend', 'singRIGHT')
   end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'backtoidleBF' then
       doTweenColor('return', 'boyfriend', 'FFFFFF', 0.001, 'linear')
    end
end