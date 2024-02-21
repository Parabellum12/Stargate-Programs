
local inLoop = true

while inLoop do

    local userInput = io.read()

    if (userInput == "quit") then
        return
    else
        print("echo:"..userInput)
    end

end