
local c = require("component")
local sg = c.stargate
local event = require("event")

local dial = {}

local address

function dial.Dial(symbols) 
    addressLength = #symbols
    address = symbols
    dial.DialNext(0)
end

function dial.DialNext(lastDialedIndex)
    local glyph = address[lastDialedIndex+1]
    sg.engageSymbol(glyph);
end


function dial.cancelEvents()
	event.cancel(eventEngaged)
	event.cancel(openEvent)
	event.cancel(failEvent)
end

engagedEvent = event.listen("stargate_spin_chevron_engaged", function(evname, address, caller, num, lock, glyph)
    os.sleep(0.5)

    if lock then
        print("Engaging Wormhole")
        sg.engageGate()
    else
        dial.DialNext(num)
    end
end)

openEvent = event.listen("stargate_open", function()
	print("Stargate opened successfully")
	dial.cancelEvents()
end)

failEvent = event.listen("stargate_failed", function()
	print("Stargate failed to open")
	dial.cancelEvents()
end)




return dial