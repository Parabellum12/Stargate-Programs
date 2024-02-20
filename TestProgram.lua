local sgi = require("StargateInterface")

if (sgi == nil) then
    print("StargateInterface Reference Invalid")
    return
end


print("Stored Energy:"..sgi.getStoredEnergy());

local temp = {"Libra", "Canis Minor", "Sextans", "Norma", "Leo Minor", "Pegasus", "Monoceros", "Orion", "Point of Origin"}

local index = 1

for i = 1, 9 do
    print("Engaging "..temp[i])
    if (sgi.engageSymbol(temp[i])[1]) then
        print("Engaged")
    end
end

sgi.engageGate()