c = require("component")
event = require("event")
os = require("os")
sg = c.stargate


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
    return sg.engageSymbol(symbolName)
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