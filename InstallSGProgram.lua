local files = {"StargateInterface.lua", "testProgram.lua", "Dial.lua", "sgc.lua"}
for index, value in ipairs(files) do
    os.execute("wget -f 'https://raw.githubusercontent.com/Parabellum12/Stargate-Programs/main/"..value.."' /home/"..value)

end