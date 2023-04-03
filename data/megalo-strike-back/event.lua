function onCreatePost()
    dadx = getProperty('dad.x')
    bfx = getProperty('boyfriend.x')

    makeLuaSprite('blackoverlay',nil,0,0)
    makeGraphic('blackoverlay',1280,720,'000000')
    scaleObject('blackoverlay',2,2)
    screenCenter('blackoverlay','xy')
    setScrollFactor('blackoverlay',0,0)
    setProperty('blackoverlay.alpha',0.0)
    addLuaSprite('blackoverlay',true)
    flipped = false
end


function onStepHit()
    if curStep == 1165 then
        guhb = getSongPosition()
    end
    if curStep == 1173 or curStep == 1179 or curStep == 1186 or curStep == 1192 or curStep == 1198 or curStep == 1206 or curStep == 1213 or curStep == 1219 then
        loadSvae()
    end
    if curStep == 2053 then
        flipped = true
        for i = 0,3 do
            setPropertyFromGroup('opponentStrums', i, 'x', 732 + (112 * (i % 4)))
          
            setPropertyFromGroup('playerStrums', i, 'x', 92 + (112 * (i % 4)))
        end
        triggerEvent('Change Character','dad','charaFlip')
        triggerEvent('Change Character','boyfriend','bfFlip')
        triggerEvent('Play Animation','trick','dad')

        setProperty('dad.x',bfx)
        setProperty('boyfriend.x',dadx)
    end
    if curStep == 2276 then
        flipped = false
        for i = 0,3 do
            setPropertyFromGroup('opponentStrums', i, 'x', 92 + (112 * (i % 4)))
          
            setPropertyFromGroup('playerStrums', i, 'x', 732 + (112 * (i % 4)))
        end
        triggerEvent('Change Character','dad','chara')
        triggerEvent('Change Character','boyfriend','bf')

        setProperty('dad.x',dadx)
        setProperty('boyfriend.x',bfx)
    end
    if curStep == 2341 then
        doTweenAlpha('camhud','camHUD',0,3)
        doTweenAlpha('bvack','blackoverlay',1,3)
    end
    if curStep == 2380 then
        setProperty('boyfriend.visible',false)
        setProperty('gf.visible',false)

        setProperty('blackoverlay.alpha',0)
        setProperty('defaultCamZoom',1.4)
        setProperty('camGame.zoom',1.4)
    end
    if curStep == 2372 then
        triggerEvent('Camera Follow Pos',tostring(getProperty('dad.x')+200),tostring(getProperty('dad.y')+100))
    end
    if curStep == 2400 then
        setProperty('blackoverlay.alpha',1)
    end

end
function loadSvae()
    fakeLength = guhb
    trueLength = fakeLength
    buh = true
end

local timeBarTypes = {
    ['song name'] = function()
        return songName
    end,

    ['time left'] = function()
        return formatTime(fakeLength - (getSongPosition() - noteOffset))
    end,

    ['time elapsed'] = function()
        return formatTime(getSongPosition() - noteOffset)
    end
}

function lerp(a, b, c)
	return a + (b - a) * c
end

function boundTo(number, min, max)
    return math.max(min, math.min(max, number))
end

function formatTime(millisecond)
    local seconds = math.floor(millisecond / 1000)

    return string.format("%01d:%02d", (seconds / 60) % 60, seconds % 60)  
end

function onUpdatePost(elapsed)
    if flipped then
        P1Mult = getProperty('healthBar.x') + ((getProperty('healthBar.width') * getProperty('healthBar.percent') * 0.01) + (150 * getProperty('iconP1.scale.x') - 150) / 2 - 26)
        P2Mult = getProperty('healthBar.x') + ((getProperty('healthBar.width') * getProperty('healthBar.percent') * 0.01) - (150 * getProperty('iconP2.scale.x')) / 2 - 26 * 2)
        setProperty('iconP1.x',P1Mult - 90)
        setProperty('iconP1.origin.x',240)
        setProperty('iconP1.flipX',true)
        setProperty('iconP2.x',P2Mult + 90)
        setProperty('iconP2.origin.x',-100)
        setProperty('iconP2.flipX',true)
        setProperty('healthBar.flipX',true)
    else
        setProperty('healthBar.flipX',false)
        setProperty('iconP2.flipX',false)
        setProperty('iconP1.flipX',false)
    end
    setProperty('songPercent', getSongPosition() / fakeLength)

    if getSongPosition() > trueLength then
        fakeLength = lerp(songLength, fakeLength, boundTo(1 - (elapsed * 5), 0, 1))
    end
	
	setTextString('timeTxt', timeBarTypes[timeBarType:lower()]() or nil)
end
