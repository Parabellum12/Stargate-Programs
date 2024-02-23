local inLoop = true
local sgi = require("StargateInterface")
local dial = require("Dial")
local mode = "norm"
function handleUsrIO(input)
    if (mode == "norm") then
        handleNormCommands(input)
    elseif (mode == "dial") then
        handleDialCommands(input)
    end
end

function handleNormCommands(input)
    if (input == "diagnostic") then
        printDiagnostic()
    elseif (input == "dial") then
        mode = "dial"
        print("dial mode active")
    else
        print("UNRECOGNIZED COMMAND")
    end
end

function handleDialCommands(input)
    if (input == "q" or input == "quit") then
        mode = "norm"
        print("norm mode active")
    elseif (input == "abort") then
        dial.Abort()
    elseif (input == "engage") then
        dial.engageGate()
    elseif (input == "disengage") then
        dial.disengageGate()
    else
        handleDialReqest(input)
    end
end

function handleDialReqest(glyphs)
    if (sgi.isReadyForSymbol()) then
        os.execute("clear")
        dial.Dial({glyphs})
    else
        print("STARGATE NOT READY FOR GLYPH")
    end
end

function printDiagnostic()
    print("============DIAGNOSTICS============")
    print("GATE TYPE: " .. sgi.getSgType())
    print("GATE STATUS: " .. sgi.getStatus())
    print("DIALED ADDRESS: " .. sgi.getDialedGlyphs())
    print("STORED ENERGY:  " .. sgi.getStoredEnergy() .. " RF")
    print("MAXIMUM ENERGY: " .. sgi.getMaximumEnergy() .. " RF") --throws nil error (function doesnt exist i think) idk why
    print("CAPACITORS INSTALLED: " .. sgi.getNumCapacitors())
    print("IRIS TYPE: " .. sgi.getIrisType())
    print("IRIS STATUS: " .. sgi.getIrisState())
    print("IRIS DURABILITY: " .. sgi.getIrisDurability())
    print("================END================")
end

while inLoop do
    if (mode == "dial") then
        print("AVAILABLE GLYPHS:" .. dial.getGlyphTable())
        if sgi.getDialedGlyphs() ~= nil then
            print("DIALED GLYPHS:" .. sgi.getDialedGlyphs())
        end
    end

    local userInput = io.read()

    if mode == "norm" and (userInput == "quit" or userInput == "q") then
        return
    else
        handleUsrIO(userInput)
    end
end
