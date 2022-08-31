local Warn = 0;
function onCreate()
	if downscroll then
			makeAnimatedLuaSprite('warn', 'qt/attack_alert_NEW', 490, 210);
		else
			makeAnimatedLuaSprite('warn', 'qt/attack_alert_NEW', 490, 210);
		end
		makeAnimatedLuaSprite('attack', 'qt/attackv6', -2060, 410);
		setObjectCamera('warn', 'hud');
		setObjectCamera('attack', 'hud');
		addAnimationByPrefix('warn', 'one', 'kb_attack_animation_alert-single', 24, false)
		addAnimationByPrefix('warn', 'two', 'kb_attack_animation_alert-double', 24, false)
		addAnimationByPrefix('attack', 'fire', 'kb_attack_animation_fire', 24, false)
		setLuaSpriteScrollFactor('warn', 0, 0);
		setLuaSpriteScrollFactor('attack', 0, 0);
	end	

function onEvent(name, value1, value2)
	if name == "QT Dodge Double" then
		if Warn < 12 or Warn == 12 then
			function onBeatHit()
			Warn = Warn + 1;
				if Warn == 1 or Warn == 2 then
					playSound('alert', 0.5)
					addLuaSprite('warn', false);
					objectPlayAnimation('warn', 'one', true)
					Warn = Warn + 1;
				end
					if Warn == 3 then
					playSound('alertALT', 0.5)
					addLuaSprite('warn', false);
					objectPlayAnimation('warn', 'two', true)
					Warn = Warn + 1;

				end

					if Warn == 5 then
					playSound('attack', 0.5)
					objectPlayAnimation('attack', 'fire', true)
					addLuaSprite('attack', false);
					runTimer('dodge', 0.1);
					Warn = Warn + 1;

				end
					if Warn == 7 then
					playSound('attackALT', 0.5)
					objectPlayAnimation('attack', 'fire', true)
					addLuaSprite('attack', false);
					runTimer('dodge', 0.1);
					Warn = Warn + 1;
				end
					if Warn == 8 then
					Warn = Warn + 1;
				end
					if Warn == 10 then
					Warn = Warn + 1;
				end

					function onTimerCompleted(tag, loops, loopsLeft)
						if tag == 'dodge' then
						if keyPressed('space') then
							characterPlayAnim('boyfriend', 'dodge', true);
						else
							characterPlayAnim('boyfriend', 'hurt', true);
							setProperty('health', -500);
						end
				end
			end
		end
	end
		if Warn > 12 then
			Warn = 0;
			function onBeatHit()
			Warn = Warn + 1;
				if Warn == 1 or Warn == 2 then
					playSound('alert', 0.5)
					addLuaSprite('warn', false);
					objectPlayAnimation('warn', 'one', true)
					Warn = Warn + 1;
				end
					if Warn == 3 then
					playSound('alertALT', 0.5)
					addLuaSprite('warn', false);
					objectPlayAnimation('warn', 'two', true)
					Warn = Warn + 1;

				end

					if Warn == 5 then
					playSound('attack', 0.5)
					objectPlayAnimation('attack', 'fire', true)
					addLuaSprite('attack', false);
					runTimer('dodge', 0.1);
					Warn = Warn + 1;

				end
					if Warn == 7 then
					playSound('attackALT', 0.5)
					objectPlayAnimation('attack', 'fire', true)
					addLuaSprite('attack', false);
					runTimer('dodge', 0.1);
					Warn = Warn + 1;

				end
					if Warn == 8 then
					Warn = Warn + 1;
				end
					if Warn == 10 then
					Warn = Warn + 1;
				end

					function onTimerCompleted(tag, loops, loopsLeft)
						if tag == 'dodge' then
						if keyPressed('space') then
							characterPlayAnim('boyfriend', 'dodge', true);
						else
							characterPlayAnim('boyfriend', 'hurt', true);
							setProperty('health', -500);
						end
				end
			end
		end
	end
end

end