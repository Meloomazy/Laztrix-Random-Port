
function onCreate()
	addHaxeLibrary('FlxBackdrop','flixel.addons.display')
    addHaxeLibrary('FlxPoint','flixel.math')
	runHaxeCode([[
		sky = new FlxBackdrop(Paths.image('recursed/darkSky') , 0x11, -0, -0);
		sky.scale.set(3.6,2);
		sky.scrollFactor.set(1.2, 1.2);
		game.addBehindGF(sky);
		sky.velocity.set(6000,-100);
	]])

	makeLuaSprite('bgcolored', "", 0, 0)
	makeGraphic('bgcolored', 2048, 1080, 'FFFFFF')
	screenCenter('bgcolored','xy')
	setScrollFactor('bgcolored',0,0)
	addLuaSprite('bgcolored', false)
	setProperty('bgcolored.color',getColorFromHex('040533'))
	setProperty('bgcolored.alpha', 0)

	luaDebugMode = true
	runHaxeCode([[
	

		alphabetsex = new Alphabet(0, 0, 'houseinsanitypolygonizedbonussonghouseinsanitypolygonizedbonussonghouseinsanitypolygonizedbonussonghouseinsanitypolygonizedbonussonghouseinsanitypolygonizedbonussonghouseinsanitypolygonizedbonussonghouseinsanitypolygonizedbonussonghouseinsanitypolygonizedbonussonghouseinsanitypolygonizedbonussonghouseinsanitypolygonizedbonussong', true);
        alphabetsex.screenCenter();
		game.addBehindGF(alphabetsex);

		for (character in alphabetsex.letters)
                {
					character.alpha = 0;
					character.velocity.set(FlxG.random.float(-50, 50), FlxG.random.float(-50, 50));
					character.angularVelocity = FlxG.random.int(30, 50);
					character.setPosition(FlxG.random.float(1400 + FlxG.width / 2, 1700+ FlxG.width * 2.5), FlxG.random.float(-500,500+ FlxG.height * 2.5));
                }
	]])
	addCharacterToList('recur_bf','boyfriend')
end

function onCreatePost()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
            setPropertyFromGroup('unspawnNotes', i, 'texture', 'recursed/NOTE_recursed');
			if getPropertyFromGroup('unspawnNotes',i,'isSustainNote') then
				setPropertyFromGroup('unspawnNotes', i, 'offset.x', 18);
			end
			if getRandomBool(98) then
				--loadFrames('unspawnNotes['..i..']','alphabet')
			end
		end
    end
	for i = 0,3 do
		setPropertyFromGroup('opponentStrums',i,'texture','recursed/NOTE_recursed')
	end
	setProperty('camZooming',true)
    setObjectOrder('healthBarBG',getObjectOrder('healthBar'))
	loadGraphic('healthBarBG','fakehealth')
end
fr = 0
function onUpdatePost()
	luaDebugMode = true

	if mustHitSection then
	
	else
		cameraSetTarget('dad')
	end
end
function onUpdate(elapsed)
	fr = fr + elapsed
	runHaxeCode([[
		for (letter in alphabetsex.letters)
		{
			letter.alpha = letter.alpha - 0.01;
		}
	]])
	setProperty('bgcolored.alpha',getProperty('bgcolored.alpha')-0.01)
	if curBeat % 4 == 0 then
		setProperty('bgcolored.alpha', 0.8)
		runHaxeCode([[
			for (letter in alphabetsex.letters)
				{
					letter.alpha = 0.8;
				}
		]])
	end
	setProperty('dad.x',2550 + math.sin(fr*1) * 200);
	setProperty('dad.angle',-2 + math.sin(fr*1) * -8);
	setProperty('dad.y',0 + math.sin(fr*2) * 300);
end
function onSectionHit()
	if mustHitSection then
		setProperty('defaultCamZoom',0.7)
	else
		setProperty('defaultCamZoom',0.4)
	end
end
function onStepHit()
	if curStep == 352 then
		cameraFlash('camGame', 'FFFFFF', 1, true)
	end
	if curStep == 864 then
		cameraFlash('camGame', 'FFFFFF', 1, true)
		setProperty('bgcolored.color',getColorFromHex('123304'))
		runHaxeCode([[
		alphabetsex = new Alphabet(0, 0, 'blockedcorntheftmazemealieblockedcorntheftmazemealieblockedcorntheftmazemealieblockedcorntheftmazemealieblockedcorntheftmazemealieblockedcorntheftmazemealieblockedcorntheftmazemealieblockedcorntheftmazemealieblockedcorntheftmazemealieblockedcorntheftmazemealieblockedcorntheftmazemealieblockedcorntheftmazemealieblockedcorntheftmazemealieblockedcorntheftmazemealie', true);
        alphabetsex.screenCenter();
		game.addBehindGF(alphabetsex);

		for (character in alphabetsex.letters)
                {
					character.velocity.set(FlxG.random.float(-50, 50), FlxG.random.float(-50, 50));
					character.angularVelocity = FlxG.random.int(30, 50);
					character.setPosition(FlxG.random.float(1400 + FlxG.width / 2, 1700+ FlxG.width * 2.5), FlxG.random.float(-500,500+ FlxG.height * 2.5));
                }
	]])
	end
	if curStep == 1248 then
		cameraFlash('camGame', 'FFFFFF', 1, true)
		setProperty('bgcolored.color',getColorFromHex('4A1305'))
		runHaxeCode([[
		alphabetsex = new Alphabet(0, 0, 'adventurevs-tristanadventurevs-tristanadventurevs-tristanadventurevs-tristanadventurevs-tristanadventurevs-tristanadventurevs-tristanadventurevs-tristanadventurevs-tristanadventurevs-tristanadventurevs-tristanadventurevs-tristanadventurevs-tristanadventurevs-tristanadventurevs-tristanadventurevs-tristanadventurevs-tristanadventurevs-tristanadventurevs-tristanadventurevs-tristanadventurevs-tristan', true);
        alphabetsex.screenCenter();
		game.addBehindGF(alphabetsex);

		for (character in alphabetsex.letters)
                {
					character.velocity.set(FlxG.random.float(-50, 50), FlxG.random.float(-50, 50));
					character.angularVelocity = FlxG.random.int(30, 50);
					character.setPosition(FlxG.random.float(1400 + FlxG.width / 2, 1700+ FlxG.width * 2.5), FlxG.random.float(-500,500+ FlxG.height * 2.5));
                }
	]])
	end
	if curStep == 1632 then
		cameraFlash('camGame', 'FFFFFF', 1, true)
	end
end
function onBeatHit()
	for i = 0, getProperty('notes.length')-1 do
		if getRandomInt(1,50) == 1 then
			if getPropertyFromGroup('notes', i, 'mustPress') then
				if not getPropertyFromGroup('notes',i,'isSustainNote') then
					setPropertyFromGroup('notes', i, 'texture', 'recursed/NOTE_recursed');
					setPropertyFromGroup('notes', i, 'noteType', 'recursor');
				end
			end
		end
    end
end
function round(x, n) --https://stackoverflow.com/questions/18313171/lua-rounding-numbers-and-then-truncate
    n = math.pow(10, n or 0)
    x = x * n
    if x >= 0 then x = math.floor(x + 0.5) else x = math.ceil(x - 0.5) end
    return x / n
end
function formatTime(millisecond)
    local seconds = math.floor(millisecond / 1000)

    return string.format("%01d:%02d", (seconds / 60) % 60, seconds % 60)  
end