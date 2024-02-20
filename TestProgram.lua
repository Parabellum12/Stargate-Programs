local sgi = require("StargateInterface")
local os = require("os")
if (sgi == nil) then
    print("StargateInterface Reference Invalid")
    return
end


print("Stored Energy:"..sgi.getStoredEnergy());

local address = {"Libra", "Canis Minor", "Sextans", "Norma", "Leo Minor", "Pegasus", "Monoceros", "Orion", "Point of Origin"}


for i = 1, 9 do
    local temp = address[i]
    print("Engaging "..temp)
    sgi.engageSymbol(temp)
end

sgi.engageGate()

os.sleep(0.1)

sgi.disengageGate()