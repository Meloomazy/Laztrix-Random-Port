function onCreate()
    makeLuaSprite('background','chara-bg',0,0)
    scaleObject('background',1.2,1.2)
    addLuaSprite('background')
    luaDebugMode = true
end
function onSongStart()
    setProperty('voices.persist', true)
end
function onUpdatePost()
    setProperty('voices.x', screenWidth)
end