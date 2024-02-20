
--print("Testing")
local c = require("component")
local event = require("event")
local os = require("os")
local sg = c.stargate

local sgInterface = {}

--print("Testing 1")
--status
function sgInterface.getSgType()
    return sg.getGateType()
end

function sgInterface.getStatus()
    return sg.getGateStatus()
end

function sgInterface.getEnergyNeeded(symbols)
    return sg.getEnergyRequiredToDial(symbols)
end

function sgInterface.getStoredEnergy()
    return sg.getEnergyStored()
end

--dialing
function sgInterface.engageSymbol(symbolName)
    while (sgInterface.getStatus() ~= "idle") do
        print("Waiting for gate to idle")
    end
    if (sgInterface.getStatus() == "idle") then
        return sg.engageSymbol(symbolName)
    end
end

function sgInterface.isReadyForSymbol()
    if (sgInterface.getStatus() == "idle") then
        return true
    else
        return false
    end
end

function sgInterface.engageGate()
    return sg.engageGate()
end

function sgInterface.disengageGate()
    return sg.disengageGate()
end

--iris
function sgInterface.closeIris()
    local irisType = sgInterface.getIrisType()
    if (irisType == "NULL") then
        --no iris
        print("No Iris Installed")
    else
        --has iris
        local irisState = sgInterface.getIrisState()
        if (irisState == "OPENED") then
            sgInterface.toggleIris()
        else
            print("Iris Not Open")
        end
    end
end

function sgInterface.openIris()
    local irisType = sgInterface.getIrisType()
    if (irisType == "NULL") then
        --no iris
        print("No Iris Installed")
    else
        --has iris
        local irisState = sgInterface.getIrisState()
        if (irisState == "CLOSED") then
            sgInterface.toggleIris()
        else
            --not CLOSED
            print("Iris Not Closed")
        end
    end
end

function sgInterface.toggleIris()
    sg.toggleIris()
end

function sgInterface.getIrisType()
    return sg.getIrisType()
end

function sgInterface.getIrisState()
    return sg.getIrisState()
end

function sgInterface.getIrisDurability()
    return sg.getIrisDurability()
end

--print("Testing 2")
--print(getSgType())

return sgInterface