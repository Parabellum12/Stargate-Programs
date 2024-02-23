local c = require("component")
local sg = c.stargate
local event = require("event")

local dial = {}

local milkywayGlyphs = {
    "Sculptor",
    "Scorpius",
    "Centaurus",
    "Monoceros",
    "Point of Origin",
    "Pegasus",
    "Andromeda",
    "Serpens Caput",
    "Aries",
    "Libra",
    "Eridanus",
    "Leo Minor",
    "Hydra",
    "Sagittarius",
    "Sextans",
    "Scutum",
    "Pisces",
    "Virgo",
    "Bootes",
    "Auriga",
    "Corona Australis",
    "Gemini",
    "Leo",
    "Cetus",
    "Triangulum",
    "Aquarius",
    "Microscopium",
    "Equuleus",
    "Crater",
    "Perseus",
    "Cancer",
    "Norma",
    "Taurus",
    "Canis Minor",
    "Capricornus",
    "Lynx",
    "Orion",
    "Piscis Austrinus"
}
local pegasusGlyphs = {
    "Roehi",
    "Once El",
    "Baselai",
    "Sandovi",
    "Illume",
    "Amiwill",
    "Sibbron",
    "Gilltin",
    "Unknow2",
    "Ramnon",
    "Olavii",
    "Hacemill",
    "Poco Re",
    "Abrin",
    "Salma",
    "Hamlinto",
    "Elenami",
    "Tahnan",
    "Zeo",
    "Unknow1",
    "Robandus",
    "Recktic",
    "Zamilloz",
    "Subido",
    "Dawnre",
    "Acjesis",
    "Lenchan",
    "Alura",
    "Ca Po",
    "Laylox",
    "Ecrumig",
    "Avoniv",
    "Bydo",
    "Aaxel",
    "Aldeni",
    "Setas",
    "Arami",
    "Danami"
}
local address

function dial.Dial(symbols)
    address = symbols
    dial.DialNext(0)
end

function dial.getSymbolTable()
    if (sg.getGateType() == "MILKYWAY") then
        return milkywayGlyphs
    elseif (sg.getGateType() == "PEGASUS") then
        return pegasusGlyphs
    end
end

function dial.isValidSymbol(singleSymbol)
    local glyphTable = dial.getSymbolTable()
    for index, value in ipairs(glyphTable) do
        if (string.lower(singleSymbol) == string.lower(value)) then
            --print("GIVEN GLYPH:" .. singleSymbol .. " REAL GLYPH:" .. value)
            return true
        end
    end
    --print(singleSymbol.." IS FAKE GLYPH")
    return false
end

function dial.DialNext(lastDialedIndex)
    if (#address < (lastDialedIndex + 1)) then
        return
    end
    local glyph = address[lastDialedIndex + 1]
    if (dial.isValidSymbol(glyph)) then
        print("ENGAGING "..glyph)
        sg.engageSymbol(glyph)
    else
        print("INVALID GLYPH")
        dial.printGlyphTable()
    end
end

function dial.printGlyphTable()
    local out = ""
    for index, value in ipairs(dial.getSymbolTable()) do
        out = out..value..", "
    end
    print("VALID GLYPHS:" .. out)
end

function dial.getGlyphTable()
    local out = ""
    for index, value in ipairs(dial.getSymbolTable()) do
        out = out..value..", "
    end
    return out
end

function dial.isInDial()
    if (#sg.dialedAddress > 0) then
        return true
    end
    return false
end

function dial.Abort()
    if (dial.isInDial()) then
        dial.engageGate()
    else
        dial.disengageGate()
    end
end

function dial.engageGate()
    sg.engageGate()
end

function dial.disengageGate()
    sg.disengageGate()
end

engagedEvent =
    event.listen(
    "stargate_spin_chevron_engaged",
    function(evname, address, caller, num, lock, glyph)
        os.sleep(0.5)
        
        print("CHEVRON "..num.." ENGAGED")
        if lock then
            print("Engaging Wormhole")
            sg.engageGate()
        else
            dial.DialNext(num)
        end
    end
)

openEvent =
    event.listen(
    "stargate_open",
    function()
        print("Stargate opened successfully")
        dial.cancelEvents()
    end
)

failEvent =
    event.listen(
    "stargate_failed",
    function()
        print("Stargate failed to open")
        dial.cancelEvents()
    end
)

return dial
