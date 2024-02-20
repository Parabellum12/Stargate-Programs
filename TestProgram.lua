local sgi = require("StargateInterface")

if (sgi == nil) then
    print("StargateInterface Reference Invalid")
    return
end


print("Stored Energy:"..sgi.getStoredEnergy());

local address = {"Libra", "Canis Minor", "Sextans", "Norma", "Leo Minor", "Pegasus", "Monoceros", "Orion", "Point of Origin"}


for i = 1, 9 do
    temp = address[i]
    print("Engaging "..temp)
    sgi.engageSymbol(temp)
end

sgi.engageGate()
sgi.disengageGate()