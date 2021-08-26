function start (song)
	print("Song: " .. song .. " BPM " .. bpm .. " downscroll: " .. downscroll)
end

function update (elapsed)
    -- for i = 4, 7 do
    --     tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 275,getActorAngle(i) + 0, 0.1, 'setDefault')
    -- end
    for i = 0, 3 do 
        tweenPosYAngle(i, _G['defaultStrum'..i..'Y'] - 900,getActorAngle(i) + 0, 0.1, 'setDefault')
    end
end

function beatHit (beat) --zooming cuz why not
    if beat then
        for i = 1, 1, 1 do --current camera zoom????? idk how those loops work
            setCamZoom(0.95) --what zoom set to i think
        end
    end
end

function keyPressed (key)
end