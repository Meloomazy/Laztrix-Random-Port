
local bpmbased = false
local iconhp = 0
local speed = 0.2
local hpbased = true
local transition = 'circOut'
--https://api.haxeflixel.com/flixel/tweens/FlxEase.html

function onBeatHit()
if bpmbased then
  doTweenX('icon1', 'iconP1.scale', 1, crochet/7500, transition)
  doTweenX('icon2', 'iconP2.scale', 1, crochet/7500, transition)
else
  doTweenX('icon1', 'iconP1.scale', 1, speed, transition)
  doTweenX('icon2', 'iconP2.scale', 1, speed, transition)
end

if hpbased then
  setProperty('iconP1.scale.x', iconhp)
  setProperty('iconP2.scale.x', iconhp2)
end
end

function onUpdatePost()
iconhp = getProperty('healthBar.percent') / 35 * 0.5 + 1
iconhp2 = -getProperty('healthBar.percent') / 35 * 0.5 + 2.5

--base by Семен Гаряев

if hpbased then
 setProperty('iconP1.scale.y', (getProperty('iconP1.scale.y') - 1) / -iconhp + 1)
 setProperty('iconP2.scale.y', (getProperty('iconP2.scale.y') - 1) / -iconhp2 + 1)
 setProperty('iconP1.origin.y', 0)
 setProperty('iconP2.origin.y', 0)
else
 setProperty('iconP1.scale.y', (getProperty('iconP1.scale.y') - 1) / -2.5 + 1)
 setProperty('iconP2.scale.y', (getProperty('iconP2.scale.y') - 1) / -2.5 + 1)
 setProperty('iconP1.origin.y', 0)
 setProperty('iconP2.origin.y', 0)
end
end