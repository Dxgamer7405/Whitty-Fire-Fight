function onCreate()
	-- background shit
	makeLuaSprite('whittyBack', 'whittyBack', -600, -300);
	setLuaSpriteScrollFactor('whittyBack', 1,1);
	precacheImage('overhead/circle/power');
	
	makeLuaSprite('whittyFront', 'whittyFront', -650, 600);
	setLuaSpriteScrollFactor('whittyFront', 1, 1);
	scaleObject('whittyFront', 1.1, 1.1);

	-- sprites that only load if Low Quality is turned off

	addLuaSprite('whittyBack', false);
	addLuaSprite('whittyFront', false);
	addLuaSprite('stagelight_left', false);
	addLuaSprite('stagelight_right', false);
	addLuaSprite('stagecurtains', false);

    doTweenZoom('start zoom', 'camGame', 1.8, 0.00001, 'linear');
	
	
	
 --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end

function onSongStart()

    doTweenZoom('real start zoom', 'camGame', 0.65, 1, 'linear')
end