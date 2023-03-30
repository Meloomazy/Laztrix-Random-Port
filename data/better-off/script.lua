guh = 0
local window_default = {}
function onCreate()
    window_default[1] = getPropertyFromClass("openfl.Lib", "application.window.x")
	window_default[2] = getPropertyFromClass("openfl.Lib", "application.window.y")
	setPropertyFromClass("openfl.Lib", "application.window.borderless",true)
end
function opponentNoteHit(id, direction, noteType, isSustainNote)
	val = 5
    if direction == 0 then
        setPropertyFromClass("openfl.Lib", "application.window.x",getPropertyFromClass("openfl.Lib", "application.window.x") - val)
    elseif direction == 1 then
        setPropertyFromClass("openfl.Lib", "application.window.y",getPropertyFromClass("openfl.Lib", "application.window.y") + val)
    elseif direction == 2 then
        setPropertyFromClass("openfl.Lib", "application.window.y",getPropertyFromClass("openfl.Lib", "application.window.y") - val)
    elseif direction == 3 then
        setPropertyFromClass("openfl.Lib", "application.window.x",getPropertyFromClass("openfl.Lib", "application.window.x") + val)
    end
end
function onDestroy()
    setPropertyFromClass("openfl.Lib", "application.window.borderless",false)
    setPropertyFromClass("openfl.Lib", "application.window.x",window_default[1])
    setPropertyFromClass("openfl.Lib", "application.window.y",window_default[2])
end

function onUpdate(elapsed)
	guh = guh + elapsed
	setProperty('dad.y',-50 - 50 * math.sin((guh * 0.3) * math.pi))
end

function boundTo(value, min, max)
    return math.max(min, math.min(max, value))
end
function math.lerp(from,to,i)return from+(to-from)*i end