function start (song)
	print("Song: " .. song .. " BPM " .. bpm .. " downscroll: " .. downscroll)
end

function update (elapsed)
    if difficulty == 2 then
        local currentBeat = (songPos / 1000)*(bpm/60)
        for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin((currentBeat + i*0)), i)
			setActorY(_G['defaultStrum'..i..'Y'],i)
		end
    end
end

function stepHit (step) --way screaming
    if step == 481 then
        setCamZoom(1.3)
    end

    if step == 925 then
        setCamZoom(1.4)
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