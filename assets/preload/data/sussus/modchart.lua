function start (song)
	print("Song: " .. song .. " BPM " .. bpm .. " downscroll: " .. downscroll)
end

function update (elapsed)
    for i = 0, 3 do 
        tweenPosYAngle(i, _G['defaultStrum'..i..'X'] - 900,getActorAngle(i) + 0, 0.1, 'setDefault')
    end
end

function beatHit (beat) --zooming cuz why not
    if beat > 84 then
        for i = 1, 1, 1 do --current camera zoom????? idk how those loops work
            setCamZoom(1.1) --what zoom set to i think
        end
    end
end

function keyPressed (key)
end

function beatHit(step)
    if curBeat == 141 then
        changeBoyfriendCharacter("bf-sus-second")
    end
    if curBeat == 164 then
        changeBoyfriendCharacter("bf-sus-first")
    end
    if curBeat == 192 then
        changeBoyfriendCharacter("bf-sus-second")
    end
    if curBeat == 234 then
        changeBoyfriendCharacter("bf-sus-first")
    end
    if curBeat == 252 then
        changeBoyfriendCharacter("bf-sus-second")
    end
    if curBeat == 296 then
        changeBoyfriendCharacter("bf-sus-first")
    end
end