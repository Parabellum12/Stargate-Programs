local sgi = require("StargateInterface")
local dialtest = require("Dial")
local os = require("os")
if (sgi == nil) then
    print("StargateInterface Reference Invalid")
    return
end


print("Stored Energy:"..sgi.getStoredEnergy());

local address = {"Libra", "Canis Minor", "Sextans", "Norma", "Leo Minor", "Pegasus", "Monoceros", "Orion", "Point of Origin"}



os.sleep(2)

dialtest.Dial({"Libra", "Microscopium", "Auriga", "Virgo", "Aries", "Lynx", "Taurus", "Point of Origin"})