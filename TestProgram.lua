local sgi = require("StargateInterface")

while (sgi == nil)
do
    print("sgi FAIL RETRY")
    sgi = require("StargateInterface")
end


print("Stored Energy:"+sgi.getStoredEnergy());