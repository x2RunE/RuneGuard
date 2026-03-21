getgenv().LowCPU = true
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Effects = ReplicatedStorage:FindFirstChild("Effects")
local ClientImpacts = ReplicatedStorage:FindFirstChild("ClientImpacts")
if Effects and ClientImpacts then Effects:Destroy() ClientImpacts:Destroy() end
local Terrain = Workspace.Terrain
Lighting:ClearAllChildren()
local function optimize(v)
    if v:IsA("BasePart") then v.Material = Enum.Material.Plastic v.Reflectance = 0 v.Transparency = 1 v.CastShadow = false end
    if v:IsA("Decal") or v:IsA("Texture") then v.Transparency = 1
    elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then v.Lifetime = NumberRange.new(0) v.Enabled = false
    elseif v:IsA("Explosion") then v.BlastPressure = 1 v.BlastRadius = 1
    elseif v:IsA("Fire") or v:IsA("Smoke") or v:IsA("Sparkles") or v:IsA("SpotLight") then v.Enabled = false
    elseif v:IsA("MeshPart") then v.Material = Enum.Material.Plastic v.Reflectance = 0 v.TextureID = "" v.Transparency = 1
    elseif v:IsA("SpecialMesh") then v.TextureId = ""
    elseif v:IsA("SurfaceAppearance") then v:Destroy()
    elseif v:IsA("Sound") then v.Volume = 0
    elseif v:IsA("Animator") then for _,track in ipairs(v:GetPlayingAnimationTracks()) do track:Stop() end v.AnimationPlayed:Connect(function(track) track:Stop() end)
    elseif v:IsA("Humanoid") or v:IsA("AnimationController") then local animator = v:FindFirstChildOfClass("Animator") if animator then for _,track in ipairs(animator:GetPlayingAnimationTracks()) do track:Stop() end animator.AnimationPlayed:Connect(function(track) track:Stop() end) end
    end
end
for _,v in ipairs(Workspace:GetDescendants()) do pcall(optimize,v) end
Workspace.DescendantAdded:Connect(function(v) pcall(optimize,v) end)
Lighting.GlobalShadows = false
Lighting.FogEnd = 9e9
Lighting.Brightness = 0
Lighting.EnvironmentDiffuseScale = 0
Lighting.EnvironmentSpecularScale = 0
for _,v in Lighting:GetChildren() do if v:IsA("PostEffect") then v.Enabled = false end end
Lighting.ChildAdded:Connect(function(v) if v:IsA("PostEffect") then v.Enabled = false end end)
Terrain.WaterWaveSize = 0
Terrain.WaterWaveSpeed = 0
Terrain.WaterReflectance = 0
Terrain.WaterTransparency = 0
Workspace.ClientAnimatorThrottling = Enum.ClientAnimatorThrottlingMode.Enabled
Workspace.InterpolationThrottling = Enum.InterpolationThrottlingMode.Enabled
Workspace.LevelOfDetail = Enum.ModelLevelOfDetail.Disabled
settings():GetService("RenderSettings").EagerBulkExecution = false
settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
getgenv().LowCPU_Loaded = true
