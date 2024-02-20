
--print("Testing")
local c = require("component")
local event = require("event")
local os = require("os")
local sg = c.stargate

--print("Testing 1")
--status
function getSgType()
    return sg.getGateType()
end

function getStatus()
    return sg.getGateStatus()
end

function getEnergyNeeded(symbols)
    return sg.getEnergyRequiredToDial(symbols)
end

function getStoredEnergy()
    return sg.getEnergyStored()
end

--dialing
function engageSymbol(symbolName)
    while (getStatus() ~= "idle") do
        print("Waiting for gate to idle")
    end
    if (getStatus() == "idle") then
        return sg.engageSymbol(symbolName)
    end
end

function engageGate()
    return sg.engageGate()
end

function disengageGate()
    return sg.disengageGate()
end

--iris
function closeIris()
    local irisType = getIrisType()
    if (irisType == "NULL") then
        --no iris
        print("No Iris Installed")
    else
        --has iris
        local irisState = getIrisState()
        if (irisState == "OPENED") then
            toggleIris()
        else
            print("Iris Not Open")
        end
    end
end

function openIris()
    local irisType = getIrisType()
    if (irisType == "NULL") then
        --no iris
        print("No Iris Installed")
    else
        --has iris
        local irisState = getIrisState()
        if (irisState == "CLOSED") then
            toggleIris()
        else
            --not CLOSED
            print("Iris Not Closed")
        end
    end
end

function toggleIris()
    sg.toggleIris()
end

function getIrisType()
    return sg.getIrisType()
end

function getIrisState()
    return sg.getIrisState()
end

function getIrisDurability()
    return sg.getIrisDurability()
end

--print("Testing 2")
--print(getSgType())
