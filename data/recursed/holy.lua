local letters = 0
local randomInt = 0
local x = 500
local letterArray = {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z', ' ', '(', ')', '    ', "'", ",", ''}
local letterArrayCap = {'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'}
local numberArray = {0,1,2,3,4,5,6,7,8,9}
local symbolsArray = {"-", ".", "/"}
letterNumber = 0
local currentText = ''
local lastState = nil
local keyIsHeld = false
local amountOfLetters = 0
local lines = 1
local textcleared = true
local textnow = false
local fakeLength = 5000
local trueLength = 0
local cursed = false
local sexo = false
function recursed()
    cameraFlash('other', 'FFFFFF', 0.5, true)
    for i = 0,3 do
		setPropertyFromGroup('playerStrums',i,'texture','recursed/NOTE_recursed')
	end
    textcleared = true
    what = 2
    currentHealth = getProperty('health')
    setProperty('iconP1.color',getColorFromHex('98AB98'))
    triggerEvent('Change Character','boyfriend','recur_bf')
    cursed = true
    timeGiven = getRandomInt(25000, 35000)
	timeLeft = timeGiven;
	notesLeft = getRandomInt(65,65)
	noteCount = 0;
    setProperty('health',2)
    setProperty('timerLeftText.visible',true)
    setProperty('noteLeftText.visible',true)
    setProperty('noteui.visible',true)
    setProperty('timerui.visible',true)
end
function unrecursed()
    cameraFlash('other', 'FFFFFF', 0.5, true)
    for i = 0,3 do
		setPropertyFromGroup('playerStrums',i,'texture','NOTE_assets')
	end
    cursed = false
    triggerEvent('Change Character','boyfriend','bf')
    setProperty('iconP1.color',getColorFromHex('FFFFFF'))
    setProperty('health',currentHealth)
    setProperty('timerLeftText.visible',false)
    setProperty('noteLeftText.visible',false)
    setProperty('noteui.visible',false)
    setProperty('timerui.visible',false)

    setProperty('camHUD.angle',0)
    setProperty('camGame.angle',0)
    setProperty('camHUD.x',0)
    setProperty('camGame.x',0)
    setProperty('camHUD.y',0)
    setProperty('camGame.y',0)
end

local randomAlphabetRecurser = {
    'chaos',
    'something',
    'the eye',
    'bambi',
    'recurser',
    'dave',
    'tristan',
    'he is watching'
}
function recurtext()
    sexo = true
    textcleared = false
    textnow = true
    thetextneeded = randomAlphabetRecurser[getRandomInt(1,7)]
    fakeLength = 5000
    setProperty('sexbg.alpha', 0.5)
    for i = 0,3 do
		setPropertyFromGroup('playerStrums',i,'texture','recursed/NOTE_recursed')
	end
    runHaxeCode([[
        testAlphabet = new Alphabet(0, 0, ']]..thetextneeded..[[', true);
        testAlphabet.cameras = [game.camHUD];
        testAlphabet.screenCenter();
		game.add(testAlphabet);
    ]])
    runTimer('wannadie',5)
end
function onSongStart()
   -- recurtext()
end
function uhremovestuff()
    runHaxeCode([[
        game.remove(testAlphabet);
    ]])
    setProperty('sexbg.alpha', 0)
    textnow = false
end
function onEvent(n,v1,v2)
    if n == 'recursedtext' then
    --recurtext()
    end
end

function onCreatePost()
    if not getPropertyFromClass("ClientPrefs", "noReset") then
		setPropertyFromClass("ClientPrefs", "noReset", true)
		isresetop = true
	end
    makeLuaSprite('sexbg', "", 0, 0)
	makeGraphic('sexbg', 1280, 720, '000000')
	addLuaSprite('sexbg', false)
	setProperty('sexbg.alpha', 0)
	setObjectCamera('sexbg', "camHUD")

    runTimer('updateNumber', 0.001, 1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000)
    makeLuaText('yess', '', nil,500, 500)
    addLuaText('yess', true)
    setProperty('skipCountdown', 1)
    setTextSize('yess', 50)
    setTextBorder('yess', 0)
    setObjectCamera('yess', 'other')
    startingX = getProperty('yess.x')





    direc = 'recursed/'
   
	makeLuaText('noteLeftText','test: 0/2',0,(screenWidth/2) - 200, getProperty('healthBar.y') - 50)
	makeLuaText('timerLeftText','timer: 1100',0,(screenWidth/2) + 100,getProperty('healthBar.y') - 50)
	addLuaText('noteLeftText')
	addLuaText('timerLeftText')
	makeLuaSprite('noteui',direc..'noteIcon',getProperty('noteLeftText.x') + getProperty('noteLeftText.width')+10,getProperty('noteLeftText.y')-15)
	makeLuaSprite('timerui',direc..'timerIcon',getProperty('timerLeftText.x') + getProperty('timerLeftText.width')+20,getProperty('timerLeftText.y')-7)
	addLuaSprite('noteui')
	addLuaSprite('timerui')
	setObjectCamera('noteui','camHUD')
	setObjectCamera('timerui','camHUD')
	scaleObject('noteui',0.4,0.4)
	scaleObject('timerui',0.4,0.4)

	setTextSize('timerLeftText',30)
	setTextSize('noteLeftText',30)

    setProperty('timerLeftText.visible',false)
    setProperty('noteLeftText.visible',false)
    setProperty('noteui.visible',false)
    setProperty('timerui.visible',false)

end

function onStepHit()
    if curStep % 10 == 0 and cursed then
        what = (what - 30 / century(timeGiven))
    end
end
fr = 0
function onUpdatePost(elapsed)
    fr = fr + elapsed
    if cursed then
        setProperty('health',what)
        setProperty('camHUD.angle',-3 + math.sin(fr*1) * 3 * math.pi)
        setProperty('camGame.angle',-3 + math.sin(fr*1) * 3 * math.pi)
        setProperty('camHUD.x',25 + math.sin(fr*2) * 25 * math.pi)
        setProperty('camGame.x',-25 + math.sin(fr*2) * 25 * math.pi)
        setProperty('camHUD.y',10 + math.cos(fr*1) * 10 * math.pi)
        setProperty('camGame.y',-10 + math.cos(fr*1) * 10 * math.pi)
        if noteCount > notesLeft then
            unrecursed()
        end
	setTextString('noteLeftText',noteCount..'/'..notesLeft)
	setTextString('timerLeftText',formatTime(timeGiven-(getSongPosition() - noteOffset)))
    end
    
    if getSongPosition() > trueLength and textcleared then fakeLength = lerp(songLength, fakeLength, boundTo(1 - (elapsed * 2), 0, 1)) end
	setTextString('timeTxt', formatTime(fakeLength - (getSongPosition() - noteOffset)))
    setProperty('songPercent', getSongPosition() / fakeLength)


    setTextAlignment('text', 'center')
    setProperty('yess.antialiasing', true)
    if textnow then onUpdateKeys() end
    currentText = getTextString('yess')
   
if currentText == thetextneeded and not textcleared then
    textcleared = true
    textnow = false
    for i = 0,3 do
		setPropertyFromGroup('playerStrums',i,'texture','NOTE_assets')
	end
    cancelTimer('wannadie')
    runTimer('clearText',0.5)
    runHaxeCode([[
        game.camHUD.shake(0.005,1);
        new FlxTimer().start(1.2, function(tmr:FlxTimer)
            {
                for (character in testAlphabet.letters)
                {
                    character.velocity.set(FlxG.random.int(-100, 100),FlxG.random.int(-100, 100));
                    character.angularVelocity = FlxG.random.int(-50, 50);
                    character.acceleration.y = 100;
                    character.acceleration.y = 550;
                }
                new FlxTimer().start(3, function(sex:FlxTimer)
                    {
                        game.remove(testAlphabet);
                    });
            });
    ]])
    doTweenAlpha('idontlikebg','sexbg',0,3,'sineInOut')
end

    if keyIsHeld then
        playSound('type')
        lastState = getTextString('yess')
        setTextString('yess', getTextString('yess') .. letterArray[letterNumber])

    end
    if getPropertyFromClass('flixel.FlxG', 'keys.justReleased.ANY') and not getPropertyFromClass('flixel.FlxG', 'keys.justReleased.BACKSPACE') and not getPropertyFromClass('flixel.FlxG', 'keys.justPressed.ENTER') then
        keyIsHeld = false
    end
  
end
function goodNoteHit(id, noteData, noteType, isSustainNote)
    if not isSustainNote then
    noteCount = noteCount + 1
    end
end
function onDestroy()
	if isresetop then
	setPropertyFromClass("ClientPrefs", "noReset", false)
	end
end
function lerp(a, b, c)
	return a + (b - a) * c
end
function century(year)
    return math.ceil(year / 100)
end
function boundTo(number, min, max)
    return math.max(min, math.min(max, number))
end

function formatTime(millisecond)
    local seconds = math.floor(millisecond / 1000)

    return string.format("%01d:%02d", (seconds / 60) % 60, seconds % 60)  
end
function round(x, n) --https://stackoverflow.com/questions/18313171/lua-rounding-numbers-and-then-truncate
    n = math.pow(10, n or 0)
    x = x * n
    if x >= 0 then x = math.floor(x + 0.5) else x = math.ceil(x - 0.5) end
    return x / n
end
function pr(ahh, key)
    getPropertyFromClass('flixel.FlxG', 'keys.' .. ahh .. '.'  .. key)
end
function onTimerCompleted(tag)
    if tag == 'isKeyHeld' then
        if getPropertyFromClass('flixel.FlxG', 'keys.pressed.ANY') and not getPropertyFromClass('flixel.FlxG', 'keys.pressed.BACKSPACE') and not getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT') then
            keyIsHeld = true
        end
    end
    if tag == 'addLetter' then
        setProperty('yess.x', getProperty('yess.x')-5)
        setTextString('yess', getTextString('yess') .. letterArray[letterNumber])
    end
    if tag == 'wannadie' then
        setTextString('yess', '')
        recursed()
        uhremovestuff()
    end
    if tag == 'clearText' then
        setTextString('yess', '')
    end
end


function onUpdateKeys()
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.A') then
        letterNumber = 1
        lastState = getTextString('yess')
        if not getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT') then
            setTextString('yess', getTextString('yess') .. letterArray[letterNumber])
        end
        if getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT') then
            setTextString('yess', getTextString('yess') .. letterArrayCap[letterNumber])
        end
        --screenCenter('yess', 'X')
        runTimer('isKeyHeld', 0.6)
    end
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.B') then
        letterNumber = 2
        lastState = getTextString('yess')
        if not getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT') then
            setTextString('yess', getTextString('yess') .. letterArray[letterNumber])
        end
        if getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT') then
            setTextString('yess', getTextString('yess') .. letterArrayCap[letterNumber])
        end
        --screenCenter('yess', 'X')
        runTimer('isKeyHeld', 0.6)
    end
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.C') then
        letterNumber = 3
        lastState = getTextString('yess')
        if not getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT') then
            setTextString('yess', getTextString('yess') .. letterArray[letterNumber])
        end
        if getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT') then
            setTextString('yess', getTextString('yess') .. letterArrayCap[letterNumber])
        end
        --screenCenter('yess', 'X')
        runTimer('isKeyHeld', 0.6)
    end
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.D') then
        letterNumber = 4
        lastState = getTextString('yess')
        if not getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT') then
            setTextString('yess', getTextString('yess') .. letterArray[letterNumber])
        end
        if getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT') then
            setTextString('yess', getTextString('yess') .. letterArrayCap[letterNumber])
        end
        --screenCenter('yess', 'X')
        runTimer('isKeyHeld', 0.6)
    end
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.E') then
        letterNumber = 5
        lastState = getTextString('yess')
        if not getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT') then
            setTextString('yess', getTextString('yess') .. letterArray[letterNumber])
        end
        if getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT') then
            setTextString('yess', getTextString('yess') .. letterArrayCap[letterNumber])
        end
        --screenCenter('yess', 'X')
        runTimer('isKeyHeld', 0.6)
    end
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.F') then
        letterNumber = 6
        lastState = getTextString('yess')
        if not getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT') then
            setTextString('yess', getTextString('yess') .. letterArray[letterNumber])
        end
        if getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT') then
            setTextString('yess', getTextString('yess') .. letterArrayCap[letterNumber])
        end
        --screenCenter('yess', 'X')
        runTimer('isKeyHeld', 0.6)
    end
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.G') then
        letterNumber = 7
        lastState = getTextString('yess')
        if not getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT') then
            setTextString('yess', getTextString('yess') .. letterArray[letterNumber])
        end
        if getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT') then
            setTextString('yess', getTextString('yess') .. letterArrayCap[letterNumber])
        end
        --screenCenter('yess', 'X')
        runTimer('isKeyHeld', 0.6)
    end
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.H') then
        letterNumber = 8
        lastState = getTextString('yess')
        if not getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT') then
            setTextString('yess', getTextString('yess') .. letterArray[letterNumber])
        end
        if getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT') then
            setTextString('yess', getTextString('yess') .. letterArrayCap[letterNumber])
        end
        --screenCenter('yess', 'X')
        runTimer('isKeyHeld', 0.6)
    end
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.I') then
        letterNumber = 9
        lastState = getTextString('yess')
        if not getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT') then
            setTextString('yess', getTextString('yess') .. letterArray[letterNumber])
        end
        if getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT') then
            setTextString('yess', getTextString('yess') .. letterArrayCap[letterNumber])
        end
        --screenCenter('yess', 'X')
        runTimer('isKeyHeld', 0.6)
    end
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.J') then
        letterNumber = 10
        lastState = getTextString('yess')
        if not getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT') then
            setTextString('yess', getTextString('yess') .. letterArray[letterNumber])
        end
        if getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT') then
            setTextString('yess', getTextString('yess') .. letterArrayCap[letterNumber])
        end
        --screenCenter('yess', 'X')
        runTimer('isKeyHeld', 0.6)
    end
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.K') then
        letterNumber = 11
        lastState = getTextString('yess')
        if not getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT') then
            setTextString('yess', getTextString('yess') .. letterArray[letterNumber])
        end
        if getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT') then
            setTextString('yess', getTextString('yess') .. letterArrayCap[letterNumber])
        end
        --screenCenter('yess', 'X')
        runTimer('isKeyHeld', 0.6)
    end
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.L') then
        letterNumber = 12
        lastState = getTextString('yess')
        if not getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT') then
            setTextString('yess', getTextString('yess') .. letterArray[letterNumber])
        end
        if getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT') then
            setTextString('yess', getTextString('yess') .. letterArrayCap[letterNumber])
        end
        --screenCenter('yess', 'X')
        runTimer('isKeyHeld', 0.6)
    end
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.M') then
        letterNumber = 13
        lastState = getTextString('yess')
        if not getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT') then
            setTextString('yess', getTextString('yess') .. letterArray[letterNumber])
        end
        if getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT') then
            setTextString('yess', getTextString('yess') .. letterArrayCap[letterNumber])
        end
        --screenCenter('yess', 'X')
        runTimer('isKeyHeld', 0.6)
    end
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.N') then
        letterNumber = 14
        lastState = getTextString('yess')
        if not getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT') then
            setTextString('yess', getTextString('yess') .. letterArray[letterNumber])
        end
        if getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT') then
            setTextString('yess', getTextString('yess') .. letterArrayCap[letterNumber])
        end
        --screenCenter('yess', 'X')
        runTimer('isKeyHeld', 0.6)
    end
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.O') then
        letterNumber = 15
        lastState = getTextString('yess')
        if not getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT') then
            setTextString('yess', getTextString('yess') .. letterArray[letterNumber])
        end
        if getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT') then
            setTextString('yess', getTextString('yess') .. letterArrayCap[letterNumber])
        end
        --screenCenter('yess', 'X')
        runTimer('isKeyHeld', 0.6)
    end
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.P') then
        letterNumber = 16
        lastState = getTextString('yess')
        if not getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT') then
            setTextString('yess', getTextString('yess') .. letterArray[letterNumber])
        end
        if getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT') then
            setTextString('yess', getTextString('yess') .. letterArrayCap[letterNumber])
        end
        --screenCenter('yess', 'X')
        runTimer('isKeyHeld', 0.6)
    end
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.Q') then
        letterNumber = 17
        lastState = getTextString('yess')
        if not getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT') then
            setTextString('yess', getTextString('yess') .. letterArray[letterNumber])
        end
        if getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT') then
            setTextString('yess', getTextString('yess') .. letterArrayCap[letterNumber])
        end
        --screenCenter('yess', 'X')
        runTimer('isKeyHeld', 0.6)
    end
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.R') then
        letterNumber = 18
        lastState = getTextString('yess')
        if not getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT') then
            setTextString('yess', getTextString('yess') .. letterArray[letterNumber])
        end
        if getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT') then
            setTextString('yess', getTextString('yess') .. letterArrayCap[letterNumber])
        end
        --screenCenter('yess', 'X')
        runTimer('isKeyHeld', 0.6)
    end
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.S') then
        letterNumber = 19
        lastState = getTextString('yess')
        if not getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT') then
            setTextString('yess', getTextString('yess') .. letterArray[letterNumber])
        end
        if getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT') then
            setTextString('yess', getTextString('yess') .. letterArrayCap[letterNumber])
        end
        --screenCenter('yess', 'X')
        runTimer('isKeyHeld', 0.6)
    end
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.T') then
        letterNumber = 20
        lastState = getTextString('yess')
        if not getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT') then
            setTextString('yess', getTextString('yess') .. letterArray[letterNumber])
        end
        if getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT') then
            setTextString('yess', getTextString('yess') .. letterArrayCap[letterNumber])
        end
        --screenCenter('yess', 'X')
        runTimer('isKeyHeld', 0.6)
    end
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.U') then
        letterNumber = 21
        lastState = getTextString('yess')
        if not getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT') then
            setTextString('yess', getTextString('yess') .. letterArray[letterNumber])
        end
        if getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT') then
            setTextString('yess', getTextString('yess') .. letterArrayCap[letterNumber])
        end
        --screenCenter('yess', 'X')
        runTimer('isKeyHeld', 0.6)
    end
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.V') then
        letterNumber = 22
        lastState = getTextString('yess')
        if not getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT') then
            setTextString('yess', getTextString('yess') .. letterArray[letterNumber])
        end
        if getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT') then
            setTextString('yess', getTextString('yess') .. letterArrayCap[letterNumber])
        end
        --screenCenter('yess', 'X')
        runTimer('isKeyHeld', 0.6)
    end
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.W') then
        letterNumber = 23
        lastState = getTextString('yess')
        if not getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT') then
            setTextString('yess', getTextString('yess') .. letterArray[letterNumber])
        end
        if getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT') then
            setTextString('yess', getTextString('yess') .. letterArrayCap[letterNumber])
        end
        --screenCenter('yess', 'X')
        runTimer('isKeyHeld', 0.6)
    end
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.X') then
        letterNumber = 24
        lastState = getTextString('yess')
        if not getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT') then
            setTextString('yess', getTextString('yess') .. letterArray[letterNumber])
        end
        if getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT') then
            setTextString('yess', getTextString('yess') .. letterArrayCap[letterNumber])
        end
        --screenCenter('yess', 'X')
        runTimer('isKeyHeld', 0.6)
    end
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.Y') then
        letterNumber = 25
        lastState = getTextString('yess')
        if not getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT') then
            setTextString('yess', getTextString('yess') .. letterArray[letterNumber])
        end
        if getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT') then
            setTextString('yess', getTextString('yess') .. letterArrayCap[letterNumber])
        end
        --screenCenter('yess', 'X')
        runTimer('isKeyHeld', 0.6)
    end
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.Z') then
        letterNumber = 26
        lastState = getTextString('yess')
        if not getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT') then
            setTextString('yess', getTextString('yess') .. letterArray[letterNumber])
        end
        if getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT') then
            setTextString('yess', getTextString('yess') .. letterArrayCap[letterNumber])
        end
        --screenCenter('yess', 'X')
        runTimer('isKeyHeld', 0.6)
    end
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SPACE') then
        letterNumber = 27
        lastState = getTextString('yess')
        setTextString('yess', getTextString('yess') .. letterArray[letterNumber])
        --screenCenter('yess', 'X')
        runTimer('isKeyHeld', 0.6)
    end
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.LBRACKET') then
        letterNumber = 28
        lastState = getTextString('yess')
        setTextString('yess', getTextString('yess') .. letterArray[letterNumber])
        --screenCenter('yess', 'X')
        runTimer('isKeyHeld', 0.6)
    end
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.RBRACKET') then
        letterNumber = 29
        lastState = getTextString('yess')
        setTextString('yess', getTextString('yess') .. letterArray[letterNumber])
        --screenCenter('yess', 'X')
        runTimer('isKeyHeld', 0.6)
    end
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.TAB') then
        letterNumber = 30
        lastState = getTextString('yess')
        setTextString('yess', getTextString('yess') .. letterArray[letterNumber])
        --screenCenter('yess', 'X')
        runTimer('isKeyHeld', 0.6)
    end
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.QUOTE') then
        letterNumber = 31
        lastState = getTextString('yess')
        setTextString('yess', getTextString('yess') .. letterArray[letterNumber])
        --screenCenter('yess', 'X')
        --screenCenter('yess', 'Y')
        runTimer('isKeyHeld', 0.6)
    end
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.COMMA') then
        letterNumber = 32
        lastState = getTextString('yess')
        setTextString('yess', getTextString('yess') .. letterArray[letterNumber])
        --screenCenter('yess', 'X')
        --screenCenter('yess', 'Y')
        runTimer('isKeyHeld', 0.6)
    end
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.ENTER') and not getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT') then
        letterNumber = 33
        lines = lines+1
        lastState = getTextString('yess')
        setTextString('yess', getTextString('yess') .. letterArray[letterNumber] .. '\n')
        --screenCenter('yess', 'X')
        --screenCenter('yess', 'Y')
        runTimer('isKeyHeld', 0.6)
    end
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.NUMPADZERO') then
        letterNumber = -1
        lastState = getTextString('yess')
        setTextString('yess', getTextString('yess') .. numberArray[1])
        --screenCenter('yess', 'X')
        --screenCenter('yess', 'Y')
    end
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.NUMPADONE') then
        letterNumber = -1
        lastState = getTextString('yess')
        setTextString('yess', getTextString('yess') .. numberArray[2])
        --screenCenter('yess', 'X')
        --screenCenter('yess', 'Y')
    end
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.DOWN') then
        letterNumber = -1
        lastState = getTextString('yess')
        setTextString('yess', getTextString('yess') .. numberArray[3])
        --screenCenter('yess', 'X')
        --screenCenter('yess', 'Y')
    end

    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.NUMPADTHREE') then
        letterNumber = -1
        lastState = getTextString('yess')
        setTextString('yess', getTextString('yess') .. numberArray[4])
        --screenCenter('yess', 'X')
        --screenCenter('yess', 'Y')
    end
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.LEFT') then
        letterNumber = -1
        lastState = getTextString('yess')
        setTextString('yess', getTextString('yess') .. numberArray[5])
        --screenCenter('yess', 'X')
        --screenCenter('yess', 'Y')
    end
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.NUMPADFIVE') then
        letterNumber = -1
        lastState = getTextString('yess')
        setTextString('yess', getTextString('yess') .. numberArray[6])
        --screenCenter('yess', 'X')
        --screenCenter('yess', 'Y')
    end
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.RIGHT') then
        letterNumber = -1
        lastState = getTextString('yess')
        setTextString('yess', getTextString('yess') .. numberArray[7])
        --screenCenter('yess', 'X')
        --screenCenter('yess', 'Y')
    end

    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.NUMPADSEVEN') then
        letterNumber = -1
        lastState = getTextString('yess')
        setTextString('yess', getTextString('yess') .. numberArray[8])
        --screenCenter('yess', 'X')
        --screenCenter('yess', 'Y')
    end
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.UP') then
        letterNumber = -1
        lastState = getTextString('yess')
        setTextString('yess', getTextString('yess') .. numberArray[9])
        --screenCenter('yess', 'X')
        --screenCenter('yess', 'Y')
    end
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.NUMPADNINE') then
        letterNumber = -1
        lastState = getTextString('yess')
        setTextString('yess', getTextString('yess') .. numberArray[10])
        --screenCenter('yess', 'X')
        --screenCenter('yess', 'Y')
    end
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.MINUS') then
        letterNumber = -1
        lastState = getTextString('yess')
        setTextString('yess', getTextString('yess') .. symbolsArray[1])
        --screenCenter('yess', 'X')
        --screenCenter('yess', 'Y')
    end
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.PERIOD') then
        letterNumber = -1
        lastState = getTextString('yess')
        setTextString('yess', getTextString('yess') .. symbolsArray[2])
        --screenCenter('yess', 'X')
        --screenCenter('yess', 'Y')
    end
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SLASH') then
        letterNumber = -1
        lastState = getTextString('yess')
        setTextString('yess', getTextString('yess') .. symbolsArray[3])
        --screenCenter('yess', 'X')
        --screenCenter('yess', 'Y')
    end
    --getPropertyFromClass('flixel.FlxG', 'keys.justPressed.NUMPADONE')
    if getPropertyFromClass('flixel.FlxG', "keys.pressed.BACKSPACE") then
        letterNumber = -1
        setTextColor('yess', 'ffffff')
        setTextString('yess', '')
        setProperty('yess.x', startingX)
    end
end

