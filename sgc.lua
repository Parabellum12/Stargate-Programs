local inLoop = true
local sgi = require("StargateInterface")
local dial = require("Dial")
local mode = "norm"
function handleUsrIO(input)
    if (mode == "norm") then
        if (input == "diagnostic") then
            printDiagnostic()
        elseif (input == "dial") then
            mode = "dial"
            print("dial mode active")
        else
            print("UNRECOGNIZED COMMAND")
        end
    elseif (mode == "dial") then
        if (input == "q" or input == "quit") then
            mode = "norm"
            print("norm mode active")
        else 
            dial.Dial({input})
            print("DIALED GLYPHS:"..sgi.getDialedGlyphs())
        end
    end
end

function printDiagnostic()
    print("============DIAGNOSTICS============")
    print("GATE TYPE: " .. sgi.getSgType())
    print("GATE STATUS: " .. sgi.getStatus())
    print("STORED ENERGY:  " .. sgi.getStoredEnergy() .. " RF")
    print("MAXIMUM ENERGY: " .. sgi.getMaximumEnergy() .. " RF") --throws nil error (function doesnt exist i think) idk why
    print("CAPACITORS INSTALLED: " .. sgi.getNumCapacitors())
    print("IRIS TYPE: " .. sgi.getIrisType())
    print("IRIS STATUS: " .. sgi.getIrisState())
    print("IRIS DURABILITY: " .. sgi.getIrisDurability())
    print("================END================")
end

while inLoop do
    local userInput = io.read()

    if (userInput == "quit" or userInput == "q") then
        return
    else
        handleUsrIO(userInput)
    end
end
