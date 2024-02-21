local sgi = require("StargateInterface")
local dialtest = require("Dial")
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
    while (sgi.getStatus() == "dialing" or sgi.getStatus() == "dialing_computer") do
        
    end
end

sgi.engageGate()

os.sleep(5)

sgi.disengageGate()

os.sleep(2)

dialtest.Dial({"Libra", "Microscopium", "Auriga", "Virgo", "Aries", "Lynx", "Taurus", "Point of Origin"})