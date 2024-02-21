local inLoop = true
local sgi = require("StargateInterface")

function handleUsrIO(input)
    if (input == "diagnostic") then
        printDiagnostic()
    elseif (input == "closeIris") then
        sgi.closeIris()
    elseif (input == "openIris") then
        sgi.openIris()
    else
        print("UNRECOGNIZED COMMAND")
    end
end

function printDiagnostic()
    print("============DIAGNOSTICS============")
    print("GATE TYPE: "..sgi.getSgType())
    print("GATE STATUS: "..sgi.getStatus())
    print("STORED ENERGY: "..sgi.getStoredEnergy()" RF")
    print("MAXIMUM ENERGY: "..sgi.getMaximumEnergy()" RF")
    print("CAPACITORS INSTALLED: "..sgi.getNumCapacitors())
    print("IRIS TYPE: "..sgi.getIrisType())
    print("IRIS STATUS: "..sgi.getIrisState())
    print("IRIS DURABILITY: "..sgi.getIrisDurability())
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
