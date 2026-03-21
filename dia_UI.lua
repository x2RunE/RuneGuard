getgenv().UI = true

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")

RunService:Set3dRenderingEnabled(false)

local plr = Players.LocalPlayer
local statsFolder = ReplicatedStorage["Stats"..plr.Name]
local Stats = statsFolder.Stats

local function GetStat(name)
	local v = Stats:FindFirstChild(name)
	return v and v.Value or 0
end

local function GetInventory(item)
	local inv = statsFolder.Inventory.Inventory.Value
	if type(inv) == "string" then
		inv = HttpService:JSONDecode(inv)
	end
	return inv[item] or 0
end

local gui = Instance.new("ScreenGui")
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Parent = game.CoreGui

local main = Instance.new("Frame")
main.Size = UDim2.new(0,420,0,260)
main.Position = UDim2.new(0.5,-210,0.5,-130)
main.BackgroundColor3 = Color3.fromRGB(8,8,8)
main.BorderSizePixel = 0
main.Parent = gui

local corner = Instance.new("UICorner",main)
corner.CornerRadius = UDim.new(0,10)

local stroke = Instance.new("UIStroke",main)
stroke.Color = Color3.fromRGB(0,255,255)
stroke.Thickness = 2

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,0,0,60)
title.BackgroundTransparency = 1
title.Text = "💎 Diamond Hub"
title.Font = Enum.Font.GothamBold
title.TextSize = 36
title.TextColor3 = Color3.fromRGB(0,255,255)
title.Parent = main

local container = Instance.new("Frame")
container.BackgroundTransparency = 1
container.Size = UDim2.new(1,-40,0,160)
container.Position = UDim2.new(0,20,0,80)
container.Parent = main

local stats = {
	{"Online","00h 00m"},
	{"Level","0"},
	{"Peli","0"},
	{"Chest","0"}
}

local labels = {}

for i,v in ipairs(stats) do
	
	local row = Instance.new("Frame")
	row.Size = UDim2.new(1,0,0,35)
	row.Position = UDim2.new(0,0,0,(i-1)*40)
	row.BackgroundTransparency = 1
	row.Parent = container
	
	local name = Instance.new("TextLabel")
	name.Size = UDim2.new(0.6,0,1,0)
	name.BackgroundTransparency = 1
	name.TextXAlignment = Enum.TextXAlignment.Left
	name.Font = Enum.Font.GothamBold
	name.TextSize = 26
	name.TextColor3 = Color3.fromRGB(255,255,255)
	name.Text = v[1]
	name.Parent = row
	
	local value = Instance.new("TextLabel")
	value.Size = UDim2.new(0.4,0,1,0)
	value.Position = UDim2.new(0.6,0,0,0)
	value.BackgroundTransparency = 1
	value.TextXAlignment = Enum.TextXAlignment.Right
	value.Font = Enum.Font.GothamBold
	value.TextSize = 26
	value.TextColor3 = Color3.fromRGB(0,255,255)
	value.Text = v[2]
	value.Parent = row
	
	labels[v[1]] = value
end

local startTime = tick()

task.spawn(function()
	while task.wait(1) do
		
		local elapsed = tick() - startTime
		local h = math.floor(elapsed/3600)
		local m = math.floor((elapsed%3600)/60)
		local s = math.floor(elapsed%60)
		
		labels["Online"].Text = string.format("%02dh %02dm %02ds",h,m,s)
		labels["Level"].Text = GetStat("Level")
		labels["Peli"].Text = GetStat("Peli")
		labels["Chest"].Text = GetInventory("Mythical Fruit Chest")
	end
end)

local hidden = false

UserInputService.InputBegan:Connect(function(input,gp)
	if gp or input.KeyCode ~= Enum.KeyCode.K then return end
	
	hidden = not hidden
	
	RunService:Set3dRenderingEnabled(hidden)
	main.Visible = not hidden
end)

getgenv().UI_Loaded = true
