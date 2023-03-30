--- credit if you use this or else
--- original icon bop golden apple script by bbpanzu
--- laztrix did all here

--- CURRENT HUD USED IS GOLDEN APPLE 1.2
local icontype = 'gapple'   --leave this alone
local songby = 'Song by ???'
local bar = ''
local iconbar = ''
local baranim = ''
function onCreate()

  if songName == 'Exploitation' or songName == 'Recursed' or songName == 'Cheating' or songName == 'Unfairness' then
    icontype = 'dnb'
    songby = 'Song By Aadsta'
  end
  
end
function onCreatePost()

  setProperty('timeBarBG.visible',false)
  setProperty('timeBar.visible',false)
  setTextFont('botplayTxt', 'comic1.TTF')
  setTextFont('timeTxt', 'comic1.TTF')
  setTextFont('scoreTxt', 'comic1.TTF')

  makeLuaText('ghudsong', (songName), 1280, 2, (downscroll and 125 or 695));
  setTextBorder("ghudsong", 1.8, '000000')
  setTextAlignment('ghudsong', 'LEFT')
  setTextFont('ghudsong', 'comic1.TTF')
  setTextSize('ghudsong', 18)
  addLuaText('ghudsong')


if icontype == 'dnb' then 

  makeLuaSprite('black', 'timerBar', 340.5, 20)
  makeLuaSprite('gray', 'gray', 345.8, 23)
  makeLuaSprite('green', 'green', 345.8, 23)

  setObjectCamera('black', 'hud')
  setObjectCamera('gray', 'hud')
  setObjectCamera('green', 'hud')

  scaleObject('gray', 1.766, .039)
  scaleObject('green', 1.766, .039)
  
setProperty('timeBarBG.visible', false)
setProperty('timeBar.visible', false)

  addLuaSprite('gray', true)
  addLuaSprite('green', true)
  addLuaSprite('black', true)
  
  setProperty('grpNoteSplashes.visible',false)
end
end
function onSongStart() 
  setProperty('timeTxt.y', getProperty('green.y')-20)
  setObjectOrder('timeTxt',getObjectOrder('black')+1)
end
function onCountdownTick(counter)
  if counter == 2 then
if icontype == 'dnb' then
  sex = true
  makeLuaText('textsong',songby,0,-500,155)
  setTextSize('textsong',32)
  setTextColor('textsong','FFFFFF')
  setTextFont('textsong', 'comic1.ttf')
  makeLuaSprite('wall','recursed/recursedHeading',-2 * getTextWidth('textsong'),160)
  scaleObject('wall',0.8,1)
  setObjectCamera('wall','camHUD')
	addLuaSprite('wall',true)
	addLuaText('textsong')
  makeLuaSprite('iconbar','recursed/Aadsta',250,155)
  scaleObject('iconbar',0.4,0.4)
  setObjectCamera('iconbar','hud')
  addLuaSprite('iconbar')
  setObjectOrder('iconbar',getObjectOrder('textsong'))
  doTweenX('redygo','wall',0,1,'elasticOut')
	runTimer('redygo',5)
end
end
end
function onUpdatePost()
  scaleObject('green', 1.766 * getProperty("songPercent"), .035)
  if downscroll then -- downscroll only
      setProperty('black.y', 685)
      setProperty('gray.y', 690)
      setProperty('green.y', 690)
  end
  setProperty('timeTxt.visible',true)

 setTextString('scoreTxt','Score: '..score..' | Misses: '..misses..' | Accuracy: '..round((getProperty('ratingPercent') * 100), 2) ..'%')
 if sex then
 setProperty('textsong.x',getProperty('wall.x'))
 setProperty('iconbar.x',getProperty('textsong.x')+260)
 end
-- some shit that i really really hate it

setProperty('bficon.origin.y',0)
setProperty('dadicon.origin.y',0)
setProperty('bficon.origin.x',0)
setProperty('dadicon.origin.x',150)
scaleObject('scoreTxt',1,1)
end


function onTweenCompleted(t)
 if t == 'redygo2' then
  removeLuaSprite('wall')
  removeLuaText('textsong')
  removeLuaSprite('iconbar')
  sex = false
 end
end

function onTimerCompleted(t)
    if t == 'redygo' then
      if icontype == 'dnb' then
        doTweenX('redygo2','wall',-1000,2,'elasticInOut')
      else
      doTweenX('redygo2','wall',-1000,1,'elasticInOut')
      end
    end
end


function milliToHuman(milliseconds) -- https://forums.mudlet.org/viewtopic.php?t=3258
	local totalseconds = math.floor(milliseconds / 1000)
	local seconds = totalseconds % 60
	local minutes = math.floor(totalseconds / 60)
	minutes = minutes % 60
	return string.format("%02d:%02d", minutes, seconds)  
end

function round(x, n) --https://stackoverflow.com/questions/18313171/lua-rounding-numbers-and-then-truncate
  n = math.pow(10, n or 0)
  x = x * n
  if x >= 0 then x = math.floor(x + 0.5) else x = math.ceil(x - 0.5) end
  return x / n
end