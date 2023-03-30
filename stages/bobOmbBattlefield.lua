local ohshit = 0
function onCreate()
    makeLuaSprite('backgroundie','bobOmbBattlefield/bg',-680,-620)
    scaleObject('backgroundie',1.1,1.1)
    addLuaSprite('backgroundie')

    makeLuaSprite('groundie','bobOmbBattlefield/hill',-680,-620)
    scaleObject('groundie',1.1,1.1)
    addLuaSprite('groundie')

    makeLuaSprite('black', '', 0, 0);
    makeGraphic('black',1280,720,'000000')
    addLuaSprite('black', true);
    setLuaSpriteScrollFactor('black',0,0)
    setProperty('black.scale.x',2)
    setProperty('black.scale.y',2)
    setProperty('black.alpha',1)
end
function onCreatePost()
    setProperty('camHUD.alpha',0)
    luaDebugMode = true
    runHaxeCode([[
        game.initLuaShader('glitched');
        glitched = game.createRuntimeShader('glitched');

        game.camHUD.setFilters([new ShaderFilter(glitched)]);
        game.camGame.setFilters([new ShaderFilter(glitched)]);
    ]])
    for i = 0,3 do
        setPropertyFromGroup('opponentStrums',i,'x',-3000)
    end
end
function opponentNoteHit(id, noteData, noteType, isSustainNote)
    if isSustainNote then
        ohshit = ohshit + 0.03
    else
        ohshit = ohshit + 0.05 -- edit this
    end
end
function onUpdate(elapsed)
    runHaxeCode([[
        glitched.setFloat('iTime',]]..os.clock()..[[);
        glitched.setFloat('AMT',]]..ohshit..[[);
    ]])
    ohshit = math.lerp(ohshit, 0.05, boundTo(elapsed * 3, 0, 1))
end
guh = 0
guhe = 0
function onUpdatePost()
    if curBeat == 1 then
        doTweenAlpha('bla','black',0,5,'linear')
    end
    if curBeat == 96 then
        setProperty('black.alpha',1)
    end
    if curBeat == 100 then
        doTweenAlpha('bla','black',0,5,'linear')
    end
    if curBeat == 104 then
        setProperty('black.alpha',1)
        doTweenAlpha('bla','black',0,5,'linear')
    end
    if curBeat == 168 then
        doTweenAlpha('hud','camHUD',1,1,'linear')
    end
    if curBeat == 714 then
        setProperty('black.alpha',1)
    end
    if not mustHitSection then
        --cameraSetTarget('dad')
    end
    setProperty('iconP2.angle',guh * math.sin(getSongPosition()/guhe))
    if getProperty('healthBar.percent') > 80 then
        guh = 3
        guhe = 0.5
	else
		guh = 1
        guhe = 3
	end
end

function boundTo(value, min, max)
    return math.max(min, math.min(max, value))
end
function math.lerp(from,to,i)return from+(to-from)*i end