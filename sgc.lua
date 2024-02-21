local inLoop = true
local sgi = require("StargateInterface")

function handleUsrIO(input)
    if (input == "diagnostic") then
        printDiagnostic()
    end
end

function printDiagnostic()
    print("============DIAGNOSTICS============")
    print("GATE TYPE: "..sgi.getSgType())
    print("GATE STATUS: "..sgi.getStatus())
    print("STORED ENERGY: "..sgi.getStoredEnergy())
    print("CAPACITORS INSTALLED: "..sgi.getCapacitors())
    print("IRIS TYPE: "..sgi.getIrisType())
    print("IRIS STATUS: "..sgi.getIrisState())
    print("IRIS DURABILITY: "..sgi.getIrisDurability())
    print("================END================")
end

while inLoop do
    local userInput = io.read()

    if (userInput == "quit") then
        return
    else
        handleUsrIO(userInput)
    end
end
