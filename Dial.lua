
local c = require("component")
local sg = c.stargate

local dial = {}

local address

function dial.Dial(symbols) 
    addressLength = #symbols
    address = symbols
end

function dial.DialNext(lastDialedIndex)
    local glyph = address[lastDialedIndex+1]
    sg.engageSymbol(glyph);
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


return dial