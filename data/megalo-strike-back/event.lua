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
    
end
function onStepHit()
    if curStep == 2053 then
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
