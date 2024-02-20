local sgi = require("StargateInterface")

if (sgi == nil) then
    print("StargateInterface Reference Invalid")
    return
end


print("Stored Energy:"+sgi.getStoredEnergy());