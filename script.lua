local Rayfield = (loadstring(game:HttpGet("https://sirius.menu/rayfield")))();
local runs = game:GetService("RunService");
local tweens = game:GetService("TweenService");
local VirtualUser = game:GetService("VirtualUser");
local VirtualInputManager = game:GetService("VirtualInputManager");
local TeleportService = game:GetService("TeleportService");
local lp = game.Players.LocalPlayer;
local character = lp.Character or lp.CharacterAdded:Wait();
local humanoidRootPart = character:WaitForChild("HumanoidRootPart");
local tweeninfo = TweenInfo.new(1, Enum.EasingStyle.Linear);
local Humanoid = character:WaitForChild("Humanoid");
local UserInputService = game:GetService("UserInputService");
local http = game:GetService("HttpService");
local lp_Name = "[ Rune Hub User ] :  " .. tostring(lp.Name);
local autoClickConnection;
if (getgenv()).Config["Auto Farm"]["Anti AFK"] then
	Rayfield:Notify({
		Title = "Anti AFK Enabled",
		Content = "Setting",
		Duration = 2,
		Image = 4483362458,
		Actions = {
			Ignore = {
				Name = "Okay!",
				Callback = function()
					print("The user tapped Okay!");
				end
			}
		}
	});
	(game:GetService("Players")).LocalPlayer.Idled:connect(function()
		(game:GetService("VirtualUser")):Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame);
		wait(1);
		(game:GetService("VirtualUser")):Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame);
	end);
end;
if lp.PlayerGui.Display.Verson.Text then
	local Window = Rayfield:CreateWindow({
		Name = "Rune Hub [ Battle ]",
		LoadingTitle = " - Script Loader -",
		LoadingSubtitle = "by x2Rune",
		ConfigurationSaving = {
			Enabled = true,
			FolderName = nil,
			FileName = "Big Hub"
		},
		Discord = {
			Enabled = true,
			Invite = "abcd",
			RememberJoins = true
		},
		KeySystem = false,
		KeySettings = {
			Title = "Untitled",
			Subtitle = "Key System",
			Note = "No method of obtaining the key is provided",
			FileName = "Key",
			SaveKey = true,
			GrabKeyFromSite = false,
			Key = {
				"Hello"
			}
		}
	});
	local function createESP(object)
		local highlight = Instance.new("Highlight");
		highlight.Parent = object;
		highlight.FillColor = Color3.new(1, 0, 0);
		highlight.OutlineColor = Color3.new(0, 0, 0);
		highlight.FillTransparency = 0.5;
		highlight.OutlineTransparency = 0;
	end;
	local Tabs = {
		Tab = Window:CreateTab("Battle Royal", 4483362458)
	};
	local Paragraph = Tabs.Tab:CreateParagraph({
		Title = "Tips : ",
		Content = "Credit : x2RunE 💕\n- Best walkspeed : 65-70 "
	});
	local Walkspeed = Tabs.Tab:CreateSlider({
		Name = "Set Walkspeed",
		Range = {
			0,
			100
		},
		Increment = 5,
		Suffix = "",
		CurrentValue = 16,
		Flag = "Slider1",
		Callback = function(Value)
			while Value do
				Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false);
				Humanoid.WalkSpeed = Value;
				Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true);
				wait(0.05);
			end;
			UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
				if not gameProcessedEvent then
					if input.KeyCode == Enum.KeyCode.F then
						Callback(2);
					end;
				end;
			end);
			UserInputService.InputEnded:Connect(function(input, gameProcessedEvent)
				if not gameProcessedEvent then
					if input.KeyCode == Enum.KeyCode.F then
						Callback(16);
					end;
				end;
			end);
		end
	});
	local Toggle_infJump = Tabs.Tab:CreateToggle({
		Name = "INF Jump",
		CurrentValue = false,
		Flag = "Toggle1",
		Callback = function(Value)
			if Value then
				jumpConnection = UserInputService.JumpRequest:Connect(function()
					if lp.Character and lp.Character:FindFirstChildOfClass("Humanoid") then
						lp.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping);
					end;
				end);
			else
				jumpConnection:Disconnect();
			end;
		end
	});
	local Chest_ESP = Tabs.Tab:CreateButton({
		Name = "Chest ESP",
		Callback = function()
			local RunService = game:GetService("RunService");
			local Workspace = game:GetService("Workspace");
			local function CreateESP(object)
				local textLabel = Instance.new("TextLabel");
				textLabel.Parent = billboardGui;
				textLabel.Size = UDim2.new(1, 0, 1, 0);
				textLabel.BackgroundTransparency = 1;
				textLabel.Text = "Chest";
				textLabel.TextColor3 = Color3.fromRGB(255, 255, 255);
				textLabel.TextScaled = true;
			end;
			local function CheckChests()
				for _, object in pairs(Workspace:GetDescendants()) do
					if object:IsA("Model") and object.Name == "Chest" then
						CreateESP(object);
					end;
				end;
			end;
			CheckChests();
			Workspace.DescendantAdded:Connect(function(object)
				if object:IsA("Model") and object.Name == "Chest" then
					CreateESP(object);
				end;
			end);
		end
	});
	local Hitbox = Tabs.Tab:CreateButton({
		Name = "Big Hitbox",
		Callback = function()
			local npc = workspace:FindFirstChild("NPCName");
			if npc and npc:FindFirstChild("HumanoidRootPart") then
				local rootPart = npc.HumanoidRootPart;
				rootPart.Size = Vector3.new(30, 30, 30);
				rootPart.Transparency = 0.7;
				rootPart.CanCollide = false;
				rootPart.Massless = true;
				rootPart.Anchored = false;
				rootPart.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0);
			end;
		end
	});
else
	lp:Kick("                                      Rune Hub doesn't support : " .. lp.PlayerGui.Display.Verson.Text .. "Pls rejoin!");
end;
