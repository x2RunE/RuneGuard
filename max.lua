local ServiceNames = {"ReplicatedStorage","TweenService", "Players", "Workspace","RunService","UserInputService"}
local Services = {}
for _, Service in ipairs(ServiceNames) do 
    Services[Service] = cloneref(game:GetService(Service))
end 
local rs = Services.ReplicatedStorage
local plrs = Services.Players
local plr = plrs.LocalPlayer
repeat
    task.wait(1.25)
until rs and plr
pcall(function()
    pcall(function()
        local crabRemote = rs:FindFirstChild("Crab_Strangler")
        if crabRemote then
            crabRemote:Destroy()
        end
    end)
    task.wait(1.25)
end)
loadstring(game:HttpGet("https://api.luarmor.net/files/v4/loaders/3437e5df438f126562c22e3e31ad895b.lua"))()
