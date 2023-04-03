function onCreate()
    --luaDebugMode = true
    makeAnimatedLuaSprite('bgroom','classroom/bg',-900,-800)
    addAnimationByPrefix('bgroom','class','whole background',24,true)
    setScrollFactor('bgroom',1.1,1.1)
    addLuaSprite('bgroom')

    makeAnimatedLuaSprite('sayori','classroom/BGSayori',0,-500)
    addAnimationByPrefix('sayori','say','BGSayANIM',24,false)
    setScrollFactor('sayori',1.1,1.1)
    addLuaSprite('sayori')

    makeLuaSprite('blood','classroom/BLOOD',-80,750)
    setScrollFactor('blood',1.1,1.1)
    addLuaSprite('blood')

    makeAnimatedLuaSprite('yuri','classroom/yuribg',400,-300)
    addAnimationByPrefix('yuri','yuri','BGYuriANIM instance 1',24,false)
    setScrollFactor('yuri',1.12,1.12)
    addLuaSprite('yuri',true)

    makeLuaSprite('blackoverlay',nil,0,0)
    makeGraphic('blackoverlay',1280,720,'FFFFFF')
    scaleObject('blackoverlay',2,2)
    screenCenter('blackoverlay','xy')
    setScrollFactor('blackoverlay',0,0)
    setProperty('blackoverlay.alpha',0.3)
    setProperty('blackoverlay.color',getColorFromHex('000000'))
    addLuaSprite('blackoverlay',true)

    makeLuaSprite('rays','classroom/godrays',-900,0)
    setBlendMode('rays','add')
    setScrollFactor('rays',1.1,1.1)
    setProperty('rays.alpha',0.5)
    addLuaSprite('rays',true)

    makeAnimatedLuaSprite('desks','classroom/desks',-700,800)
    addAnimationByPrefix('desks','desk','desks instance 1',24,true)
    setScrollFactor('desks',1.12,1.12)
    addLuaSprite('desks',true)


    setProperty('blood.alpha',0)
    setProperty('yuri.alpha',0)
    setProperty('sayori.alpha',0)
    setProperty('skipCountdown',true)

    addHaxeLibrary('FlxBackdrop','flixel.addons.display')
    addHaxeLibrary('FlxAxes','flixel.util')
    runHaxeCode([[
        doki = new FlxBackdrop(Paths.image('classroom/dokidoki') , 0x11, -0, -0);
        doki.scrollFactor.set(1, 1);
        game.addBehindGF(doki);
        doki.velocity.set(-100,-100);
        doki.alpha = 0;

        game.variables.set('doki',doki);
    ]])

    precacheSound('PVoices')
end
local isBF = false
function onSongStart()
    playSound('PVoices',1,'MC')
end
function onPause()
    pauseSound('MC')
end
function onResume()
    resumeSound('MC')
end
function goodNoteHit(id, direction, noteType, isSustainNote)
    setSoundVolume('MC',1)
end
function noteMiss(id, noteData, noteType, isSustainNote)
    setSoundVolume('MC',0)
    setProperty('vocals.volume',1)
end
function onCreatePost()
    setProperty('cameraSpeed',99999)
    makeAnimatedLuaSprite('mexeRED', nil, -0, 0)
    loadGraphic('mexeRED', 'icons/mexe-red', 150)
    addAnimation('mexeRED', 'icon', {1, 1}, 0, true)
    setObjectCamera('mexeRED','camHUD')
    setObjectOrder('mexeRED',getObjectOrder('iconP2')+1)
    setProperty('mexeRED.alpha',0)
    toColor = rgbToHex(getProperty('dad.healthColorArray'))
    setProperty('iconP2.color',getColorFromHex('000000'))
    icoY = getProperty('iconP2.y')
    setHealthBarColors('000000' ,rgbToHex(getProperty('boyfriend.healthColorArray')))
end
function opponentNoteHit(id, direction, noteType, isSustainNote)
    if direction == 2 and not isSustainNote then
        setProperty('timeBar.color',getColorFromHex('FF0000'))
        doTweenColor('timeBar', 'timeBar', rgbToHex(getProperty('dad.healthColorArray')), 0.2)
        if getProperty('health') > 1.7 then
            setProperty('mexeRED.alpha',1)
            doTweenAlpha('mexe','mexeRED',0,0.2)
        end
    end
end
fr = 0
function onUpdatePost(elapsed)
    fr = fr + elapsed
    if curStep >= 16 and curStep <= 32 then
        local interpolatedColor = lerpHexColor('000000', rgbToHex(getProperty('dad.healthColorArray')),runHaxeCode "return getVar('guh');")
        setHealthBarColors(interpolatedColor ,rgbToHex(getProperty('boyfriend.healthColorArray')))
    end
    if getProperty('health') > 1.7 then
        setProperty('iconP2.x',getProperty('iconP2.x')+getRandomInt(1,3))
        setProperty('iconP2.y',getRandomInt(icoY,icoY + 3))
    end
    setProperty('mexeRED.origin.x',getProperty('iconP2.origin.x'))
    setProperty('mexeRED.origin.y',getProperty('iconP2.origin.y'))

    setProperty('mexeRED.x',getProperty('iconP2.x'))
    setProperty('mexeRED.y',getProperty('iconP2.y'))
    setProperty('mexeRED.scale.x',getProperty('iconP2.scale.x'))
    setProperty('mexeRED.scale.y',getProperty('iconP2.scale.y'))
end
function onStepHit()
    if curStep == 5 then
        setProperty('cameraSpeed',1)
    end
    if curStep == 16 then
        doTweenColor('iconp2', 'iconP2', 'FFFFFF',1, 'linear')
        runHaxeCode([[
			var guhTween:FlxTween;
	
			if (guhTween != null) guhTween.cancel();
			 guhTween = FlxTween.num(0, 1, 1, {ease: FlxEase.linear}, function(num) { setVar('guh',num); });
		]])
    end
    if curStep == 1184 then
        doTweenAlpha('rays','rays',0,16)
        doTweenAlpha('desks','desks',0,16)
        doTweenAlpha('yuri','yuri',0,16)
        doTweenAlpha('doki','doki',1,16)
        doTweenColor('dokiCO', 'doki', '974141', 16, 'linear')
        doTweenAlpha('overlay','blackoverlay',0,16)
    end
    if curStep == 1312 then
        doTweenColor('boyfriend', 'boyfriend', '000000', 12, 'linear')
        doTweenColor('dad', 'dad', '000000', 12, 'linear')
    end
    if curStep == 1600 then
        cameraFade('camOther','000000',2,true)
    end
end
function onEvent(n,v1,v2)
    if n == 'Bad Apple' then
        if v1 == 'true' then
            doTweenColor('boyfriend', 'boyfriend', '000000', 1, 'linear')
		    doTweenColor('dad', 'dad', '000000',1, 'linear')
        end
        if v1 == '0' then
            doTweenColor('boyfriend', 'boyfriend', 'FFFFFF', v2, 'linear')
		    doTweenColor('dad', 'dad', 'FFFFFF', v2, 'linear')
        end
    end
    if n == 'They Appear' then
        setProperty('blood.alpha',1)
        setProperty('yuri.alpha',1)
        setProperty('sayori.alpha',1)
    end
    if n == 'MEXE BG' then
        if v1 == '1' then
            doTweenAlpha('desks','desks',1,1)
            doTweenAlpha('overlay','blackoverlay',0.5,1)
            doTweenAlpha('rays','rays',0.5,1)
            doTweenAlpha('doki','doki',0,1)
            doTweenAlpha('yuri','yuri',1,1)
        end
        if v1 == '0' then
            doTweenAlpha('desks','desks',0,1)
            doTweenAlpha('yuri','yuri',0,1)
            doTweenAlpha('overlay','blackoverlay',0,0.3)
            doTweenAlpha('rays','rays',0,0.3)
            doTweenAlpha('doki','doki',1,0.5)
        end
    end
    if n == 'Darken BG' then
        if v1 == '1' then
            doTweenAlpha('overlay','blackoverlay',0.7,1)
        end
        if v1 == '0' then
            doTweenAlpha('overlay','blackoverlay',0.3,1)
        end
    end
end

function onBeatHit()
    if curBeat % 2 == 0 then
        playAnim('yuri','yuri',true)
        playAnim('sayori','say',true)
    end
end
function rgbToHex(array)
	return string.format('%.2x%.2x%.2x', array[1], array[2], array[3])
end
function lerpHexColor(fromColor, toColor, t)
    -- Convert hex color strings to RGB values
    local fromR, fromG, fromB = tonumber(fromColor:sub(1,2), 16), tonumber(fromColor:sub(3,4), 16), tonumber(fromColor:sub(5,6), 16)
    local toR, toG, toB = tonumber(toColor:sub(1,2), 16), tonumber(toColor:sub(3,4), 16), tonumber(toColor:sub(5,6), 16)
    
    -- Interpolate RGB values
    local r = fromR + (toR - fromR) * t
    local g = fromG + (toG - fromG) * t
    local b = fromB + (toB - fromB) * t
    
    -- Convert back to hex color string
    return string.format("%02X%02X%02X", r, g, b)
  end