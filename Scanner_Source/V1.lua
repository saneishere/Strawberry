--[[
⠀⠀⠀⠀⠀⢀⡀⠀⠀⠀⠀⠀⡄⠀⠀⠀⠀⢀⠀⠀
⠀⠀⠀⠀⠀⠀⣏⠓⠒⠤⣰⠋⠹⡄⠀⣠⠞⣿⠀⠀
⠀⠀⠀⢀⠄⠂⠙⢦⡀⠐⠨⣆⠁⣷⣮⠖⠋⠉⠁⠀
⠀⠀⡰⠁⠀⠮⠇⠀⣩⠶⠒⠾⣿⡯⡋⠩⡓⢦⣀⡀
⠀⡰⢰⡹⠀⠀⠲⣾⣁⣀⣤⠞⢧⡈⢊⢲⠶⠶⠛⠁
⢀⠃⠀⠀⠀⣌⡅⠀⢀⡀⠀⠀⣈⠻⠦⣤⣿⡀⠀⠀
⠸⣎⠇⠀⠀⡠⡄⠀⠷⠎⠀⠐⡶⠁⠀⠀⣟⡇⠀⠀
⡇⠀⡠⣄⠀⠷⠃⠀⠀⡤⠄⠀⠀⣔⡰⠀⢩⠇⠀⠀
⡇⠀⠻⠋⠀⢀⠤⠀⠈⠛⠁⠀⢀⠉⠁⣠⠏⠀⠀⠀
⣷⢰⢢⠀⠀⠘⠚⠀⢰⣂⠆⠰⢥⡡⠞⠁⠀⠀⠀⠀
⠸⣎⠋⢠⢢⠀⢠⢀⠀⠀⣠⠴⠋⠀⠀⠀⠀⠀⠀⠀
⠀⠘⠷⣬⣅⣀⣬⡷⠖⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠈⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
]]--

local notifchecking = false -- Notifies the player when the script is checking a Parent
local backdoored = false
local event

local players = game:GetService("Players")
local rep = game:GetService("ReplicatedStorage")
local lp = players.LocalPlayer

local likelynames = {
	"delete", "remove", "destroy", "clean", "clear", "bullet", "bala", "shoot", "shot", "fire",
	"segway", "handless", "sword", "attack", "despawn", "deletar", "apagar"
}

local function notification(title, text, duration)
	pcall(function()
		game.StarterGui:SetCore("SendNotification", {
			Title = title,
			Text = text,
			Duration = duration
		})
	end)
end

local function scan(root)
	if notifchecking then
		notification("Strawberry", "Scanning " .. root.Name .. "...", 2)
	end
	for _, v in ipairs(root:GetDescendants()) do
		if v:IsA("RemoteEvent") then
			for _, phrase in pairs(likelynames) do
				if v.Name:lower():find(phrase) then
					backdoored = true
					event = v
					notification("Strawberry", "Found a backdoor: " .. v.Name, 2)
					return
				end
			end
		end
	end
end

local function delete(instance)
	if backdoored and event and instance then
		event:FireServer(instance)
	end
end

if not event then
	if notifchecking then notification("Strawberry", "Checking: ReplicatedStorage", 1) end
	scan(rep)
end

if not event then
	if notifchecking then notification("Strawberry", "Checking: Workspace", 1) end
	scan(workspace)
end

if not event then
	if notifchecking then notification("Strawberry", "Checking: LocalPlayer.PlayerGui", 1) end
	scan(lp:WaitForChild("PlayerGui"))
end

if not event then
	if notifchecking then notification("Strawberry", "Checking: Game", 1) end
	scan(game)
end

if not event then
	notification("Strawberry", "Couldn't find a remote, sorry", 2)
end

repeat task.wait(1) until backdoored 

local G2L = {};

-- StarterGui.Strawberry
G2L["1"] = Instance.new("ScreenGui", game.CoreGui);
G2L["1"]["Enabled"] = true;
G2L["1"]["Name"] = [[Strawberry]];
G2L["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;
G2L["1"]["ResetOnSpawn"] = false;


-- StarterGui.Strawberry.MainFrame
G2L["2"] = Instance.new("Frame", G2L["1"]);
G2L["2"]["BorderSizePixel"] = 0;
G2L["2"]["BackgroundColor3"] = Color3.fromRGB(255, 52, 89);
G2L["2"]["Size"] = UDim2.new(0, 300, 0, 350);
G2L["2"]["Position"] = UDim2.new(0.75, 0, 0.5, 0);
G2L["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2"]["Name"] = [[MainFrame]];
G2L["2"]["BackgroundTransparency"] = 1;


-- StarterGui.Strawberry.MainFrame.UICorner
G2L["3"] = Instance.new("UICorner", G2L["2"]);
G2L["3"]["CornerRadius"] = UDim.new(0, 10);


-- StarterGui.Strawberry.MainFrame.Shadow
G2L["4"] = Instance.new("ImageLabel", G2L["2"]);
G2L["4"]["BorderSizePixel"] = 0;
G2L["4"]["SliceCenter"] = Rect.new(200, 200, 500, 500);
G2L["4"]["SliceScale"] = 0.095;
G2L["4"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["4"]["ScaleType"] = Enum.ScaleType.Slice;
G2L["4"]["ImageColor3"] = Color3.fromRGB(153, 153, 153);
G2L["4"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["4"]["Image"] = [[http://www.roblox.com/asset/?id=13960012399]];
G2L["4"]["Size"] = UDim2.new(1, 18, 1, 18);
G2L["4"]["BackgroundTransparency"] = 1;
G2L["4"]["Name"] = [[Shadow]];
G2L["4"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


-- StarterGui.Strawberry.MainFrame.Shadow.UIGradient
G2L["5"] = Instance.new("UIGradient", G2L["4"]);
G2L["5"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 52, 89)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 52, 89))};


-- StarterGui.Strawberry.MainFrame.Gloss
G2L["6"] = Instance.new("ImageLabel", G2L["2"]);
G2L["6"]["ZIndex"] = -2147483647;
G2L["6"]["BorderSizePixel"] = 0;
G2L["6"]["BackgroundColor3"] = Color3.fromRGB(67, 67, 67);
G2L["6"]["ImageTransparency"] = 0.1;
G2L["6"]["ImageColor3"] = Color3.fromRGB(153, 153, 153);
G2L["6"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["6"]["Image"] = [[rbxassetid://413422291]];
G2L["6"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["6"]["BackgroundTransparency"] = 1;
G2L["6"]["Name"] = [[Gloss]];
G2L["6"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


-- StarterGui.Strawberry.MainFrame.Gloss.UICorner
G2L["7"] = Instance.new("UICorner", G2L["6"]);
G2L["7"]["CornerRadius"] = UDim.new(0, 10);


-- StarterGui.Strawberry.MainFrame.Gloss.UIGradient
G2L["8"] = Instance.new("UIGradient", G2L["6"]);
G2L["8"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 52, 89)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 52, 89))};


-- StarterGui.Strawberry.MainFrame.UIGradient
G2L["9"] = Instance.new("UIGradient", G2L["2"]);
G2L["9"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 52, 89)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 52, 89))};


-- StarterGui.Strawberry.MainFrame.TextLabel
G2L["a"] = Instance.new("TextLabel", G2L["2"]);
G2L["a"]["TextWrapped"] = true;
G2L["a"]["BorderSizePixel"] = 0;
G2L["a"]["TextSize"] = 14;
G2L["a"]["TextScaled"] = true;
G2L["a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["a"]["FontFace"] = Font.new([[rbxassetid://16658221428]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
G2L["a"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["a"]["BackgroundTransparency"] = 1;
G2L["a"]["Size"] = UDim2.new(0, 165, 0, 33);
G2L["a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["a"]["Text"] = [[Strawberry v1.00]];
G2L["a"]["Position"] = UDim2.new(0.22333, 0, 0.02, 0);


-- StarterGui.Strawberry.MainFrame.Exit
G2L["b"] = Instance.new("Frame", G2L["2"]);
G2L["b"]["ZIndex"] = 2;
G2L["b"]["BorderSizePixel"] = 0;
G2L["b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["b"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["b"]["Size"] = UDim2.new(0, 30, 0, 30);
G2L["b"]["Position"] = UDim2.new(0.88, 12, 0.18, -40);
G2L["b"]["Name"] = [[Exit]];
G2L["b"]["BackgroundTransparency"] = 0.5;


-- StarterGui.Strawberry.MainFrame.Exit.UICorner
G2L["c"] = Instance.new("UICorner", G2L["b"]);
G2L["c"]["CornerRadius"] = UDim.new(0, 10);


-- StarterGui.Strawberry.MainFrame.Exit.RE
G2L["d"] = Instance.new("ImageButton", G2L["b"]);
G2L["d"]["BorderSizePixel"] = 0;
G2L["d"]["BackgroundColor3"] = Color3.fromRGB(34, 34, 34);
G2L["d"]["ZIndex"] = 3;
G2L["d"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["d"]["Image"] = [[http://www.roblox.com/asset/?id=14219436180]];
G2L["d"]["Size"] = UDim2.new(1, -14, 1, -14);
G2L["d"]["BackgroundTransparency"] = 1;
G2L["d"]["Name"] = [[RE]];
G2L["d"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
G2L["d"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


-- StarterGui.Strawberry.MainFrame.Exit.RE.LocalScript
G2L["e"] = Instance.new("LocalScript", G2L["d"]);



-- StarterGui.Strawberry.MainFrame.Exit.Shadow
G2L["f"] = Instance.new("ImageLabel", G2L["b"]);
G2L["f"]["BorderSizePixel"] = 0;
G2L["f"]["SliceCenter"] = Rect.new(200, 200, 500, 500);
G2L["f"]["SliceScale"] = 0.1;
G2L["f"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["f"]["ScaleType"] = Enum.ScaleType.Slice;
G2L["f"]["ImageTransparency"] = 0.5;
G2L["f"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["f"]["Image"] = [[http://www.roblox.com/asset/?id=13960012399]];
G2L["f"]["Size"] = UDim2.new(1, 18, 1, 18);
G2L["f"]["BackgroundTransparency"] = 1;
G2L["f"]["Name"] = [[Shadow]];
G2L["f"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


-- StarterGui.Strawberry.MainFrame.Exit.Shadow.UIGradient
G2L["10"] = Instance.new("UIGradient", G2L["f"]);
G2L["10"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 52, 89)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 52, 89))};


-- StarterGui.Strawberry.MainFrame.Exit.UIGradient
G2L["11"] = Instance.new("UIGradient", G2L["b"]);
G2L["11"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 52, 89)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 52, 89))};


-- StarterGui.Strawberry.MainFrame.Exit.Anim
G2L["12"] = Instance.new("LocalScript", G2L["b"]);
G2L["12"]["Name"] = [[Anim]];


-- StarterGui.Strawberry.MainFrame.Username
G2L["13"] = Instance.new("TextBox", G2L["2"]);
G2L["13"]["Name"] = [[Username]];
G2L["13"]["BorderSizePixel"] = 0;
G2L["13"]["TextSize"] = 18;
G2L["13"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["13"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["13"]["FontFace"] = Font.new([[rbxassetid://16658221428]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
G2L["13"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["13"]["PlaceholderText"] = [[Username]];
G2L["13"]["Size"] = UDim2.new(0, 215, 0, 30);
G2L["13"]["Position"] = UDim2.new(0.5, 0, 0, 60);
G2L["13"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["13"]["Text"] = [[]];
G2L["13"]["BackgroundTransparency"] = 1;


-- StarterGui.Strawberry.MainFrame.Username.Anim
G2L["14"] = Instance.new("LocalScript", G2L["13"]);
G2L["14"]["Name"] = [[Anim]];


-- StarterGui.Strawberry.MainFrame.Username.BG
G2L["15"] = Instance.new("Frame", G2L["13"]);
G2L["15"]["BorderSizePixel"] = 0;
G2L["15"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["15"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["15"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["15"]["Name"] = [[BG]];
G2L["15"]["BackgroundTransparency"] = 0.5;


-- StarterGui.Strawberry.MainFrame.Username.BG.Shadow
G2L["16"] = Instance.new("ImageLabel", G2L["15"]);
G2L["16"]["BorderSizePixel"] = 0;
G2L["16"]["SliceCenter"] = Rect.new(200, 200, 500, 500);
G2L["16"]["SliceScale"] = 0.1;
G2L["16"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["16"]["ScaleType"] = Enum.ScaleType.Slice;
G2L["16"]["ImageTransparency"] = 0.5;
G2L["16"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["16"]["Image"] = [[http://www.roblox.com/asset/?id=13960012399]];
G2L["16"]["Size"] = UDim2.new(1, 18, 1, 18);
G2L["16"]["BackgroundTransparency"] = 1;
G2L["16"]["Name"] = [[Shadow]];
G2L["16"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


-- StarterGui.Strawberry.MainFrame.Username.BG.Shadow.UIGradient
G2L["17"] = Instance.new("UIGradient", G2L["16"]);
G2L["17"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 52, 89)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 52, 89))};


-- StarterGui.Strawberry.MainFrame.Username.BG.UICorner
G2L["18"] = Instance.new("UICorner", G2L["15"]);
G2L["18"]["CornerRadius"] = UDim.new(0, 10);


-- StarterGui.Strawberry.MainFrame.Username.BG.UIGradient
G2L["19"] = Instance.new("UIGradient", G2L["15"]);
G2L["19"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 52, 89)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 52, 89))};


-- StarterGui.Strawberry.MainFrame.Username.Check
G2L["1a"] = Instance.new("LocalScript", G2L["13"]);
G2L["1a"]["Name"] = [[Check]];


-- StarterGui.Strawberry.MainFrame.ScrollingFrame
G2L["1b"] = Instance.new("ScrollingFrame", G2L["2"]);
G2L["1b"]["Active"] = true;
G2L["1b"]["BorderSizePixel"] = 0;
G2L["1b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1b"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["1b"]["Size"] = UDim2.new(0, 279, 0, 253);
G2L["1b"]["ScrollBarImageColor3"] = Color3.fromRGB(255, 65, 100);
G2L["1b"]["Position"] = UDim2.new(0.50458, 0, 0.60143, 0);
G2L["1b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1b"]["ScrollBarThickness"] = 0;
G2L["1b"]["BackgroundTransparency"] = 1;


-- StarterGui.Strawberry.MainFrame.ScrollingFrame.Kill
G2L["1c"] = Instance.new("TextButton", G2L["1b"]);
G2L["1c"]["BorderSizePixel"] = 0;
G2L["1c"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1c"]["TextSize"] = 18;
G2L["1c"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1c"]["FontFace"] = Font.new([[rbxassetid://16658221428]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
G2L["1c"]["Size"] = UDim2.new(0, 200, 0, 50);
G2L["1c"]["BackgroundTransparency"] = 0.8;
G2L["1c"]["Name"] = [[Kill]];
G2L["1c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1c"]["Text"] = [[Kill]];


-- StarterGui.Strawberry.MainFrame.ScrollingFrame.Kill.UICorner
G2L["1d"] = Instance.new("UICorner", G2L["1c"]);



-- StarterGui.Strawberry.MainFrame.ScrollingFrame.Kill.Shadow
G2L["1e"] = Instance.new("ImageLabel", G2L["1c"]);
G2L["1e"]["BorderSizePixel"] = 0;
G2L["1e"]["SliceCenter"] = Rect.new(200, 200, 500, 500);
G2L["1e"]["SliceScale"] = 0.1;
G2L["1e"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1e"]["ScaleType"] = Enum.ScaleType.Slice;
G2L["1e"]["ImageTransparency"] = 0.5;
G2L["1e"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["1e"]["Image"] = [[http://www.roblox.com/asset/?id=13960012399]];
G2L["1e"]["Size"] = UDim2.new(1, 18, 1, 18);
G2L["1e"]["BackgroundTransparency"] = 1;
G2L["1e"]["Name"] = [[Shadow]];
G2L["1e"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


-- StarterGui.Strawberry.MainFrame.ScrollingFrame.Kill.Shadow.UIGradient
G2L["1f"] = Instance.new("UIGradient", G2L["1e"]);
G2L["1f"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 52, 89)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 52, 89))};


-- StarterGui.Strawberry.MainFrame.ScrollingFrame.Kill.ex
G2L["20"] = Instance.new("LocalScript", G2L["1c"]);
G2L["20"]["Name"] = [[ex]];


-- StarterGui.Strawberry.MainFrame.ScrollingFrame.UIGridLayout
G2L["21"] = Instance.new("UIGridLayout", G2L["1b"]);
G2L["21"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
G2L["21"]["CellSize"] = UDim2.new(1, -35, 0, 40);
G2L["21"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
G2L["21"]["CellPadding"] = UDim2.new(0, 5, 0, 7);


-- StarterGui.Strawberry.MainFrame.ScrollingFrame.Punish
G2L["22"] = Instance.new("TextButton", G2L["1b"]);
G2L["22"]["BorderSizePixel"] = 0;
G2L["22"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["22"]["TextSize"] = 18;
G2L["22"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["22"]["FontFace"] = Font.new([[rbxassetid://16658221428]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
G2L["22"]["Size"] = UDim2.new(0, 200, 0, 50);
G2L["22"]["BackgroundTransparency"] = 0.8;
G2L["22"]["Name"] = [[Punish]];
G2L["22"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["22"]["Text"] = [[Punish]];


-- StarterGui.Strawberry.MainFrame.ScrollingFrame.Punish.UICorner
G2L["23"] = Instance.new("UICorner", G2L["22"]);



-- StarterGui.Strawberry.MainFrame.ScrollingFrame.Punish.Shadow
G2L["24"] = Instance.new("ImageLabel", G2L["22"]);
G2L["24"]["BorderSizePixel"] = 0;
G2L["24"]["SliceCenter"] = Rect.new(200, 200, 500, 500);
G2L["24"]["SliceScale"] = 0.1;
G2L["24"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["24"]["ScaleType"] = Enum.ScaleType.Slice;
G2L["24"]["ImageTransparency"] = 0.5;
G2L["24"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["24"]["Image"] = [[http://www.roblox.com/asset/?id=13960012399]];
G2L["24"]["Size"] = UDim2.new(1, 18, 1, 18);
G2L["24"]["BackgroundTransparency"] = 1;
G2L["24"]["Name"] = [[Shadow]];
G2L["24"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


-- StarterGui.Strawberry.MainFrame.ScrollingFrame.Punish.Shadow.UIGradient
G2L["25"] = Instance.new("UIGradient", G2L["24"]);
G2L["25"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 52, 89)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 52, 89))};


-- StarterGui.Strawberry.MainFrame.ScrollingFrame.Punish.LocalScript
G2L["26"] = Instance.new("LocalScript", G2L["22"]);



-- StarterGui.Strawberry.MainFrame.ScrollingFrame.Ragdoll
G2L["27"] = Instance.new("TextButton", G2L["1b"]);
G2L["27"]["BorderSizePixel"] = 0;
G2L["27"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["27"]["TextSize"] = 18;
G2L["27"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["27"]["FontFace"] = Font.new([[rbxassetid://16658221428]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
G2L["27"]["Size"] = UDim2.new(0, 200, 0, 50);
G2L["27"]["BackgroundTransparency"] = 0.8;
G2L["27"]["Name"] = [[Ragdoll]];
G2L["27"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["27"]["Text"] = [[Ragdoll]];


-- StarterGui.Strawberry.MainFrame.ScrollingFrame.Ragdoll.UICorner
G2L["28"] = Instance.new("UICorner", G2L["27"]);



-- StarterGui.Strawberry.MainFrame.ScrollingFrame.Ragdoll.Shadow
G2L["29"] = Instance.new("ImageLabel", G2L["27"]);
G2L["29"]["BorderSizePixel"] = 0;
G2L["29"]["SliceCenter"] = Rect.new(200, 200, 500, 500);
G2L["29"]["SliceScale"] = 0.1;
G2L["29"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["29"]["ScaleType"] = Enum.ScaleType.Slice;
G2L["29"]["ImageTransparency"] = 0.5;
G2L["29"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["29"]["Image"] = [[http://www.roblox.com/asset/?id=13960012399]];
G2L["29"]["Size"] = UDim2.new(1, 18, 1, 18);
G2L["29"]["BackgroundTransparency"] = 1;
G2L["29"]["Name"] = [[Shadow]];
G2L["29"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


-- StarterGui.Strawberry.MainFrame.ScrollingFrame.Ragdoll.Shadow.UIGradient
G2L["2a"] = Instance.new("UIGradient", G2L["29"]);
G2L["2a"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 52, 89)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 52, 89))};


-- StarterGui.Strawberry.MainFrame.ScrollingFrame.Ragdoll.LocalScript
G2L["2b"] = Instance.new("LocalScript", G2L["27"]);



-- StarterGui.Strawberry.MainFrame.ScrollingFrame.No-limbs
G2L["2c"] = Instance.new("TextButton", G2L["1b"]);
G2L["2c"]["BorderSizePixel"] = 0;
G2L["2c"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["2c"]["TextSize"] = 18;
G2L["2c"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2c"]["FontFace"] = Font.new([[rbxassetid://16658221428]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
G2L["2c"]["Size"] = UDim2.new(0, 200, 0, 50);
G2L["2c"]["BackgroundTransparency"] = 0.8;
G2L["2c"]["Name"] = [[No-limbs]];
G2L["2c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2c"]["Text"] = [[No-limbs]];


-- StarterGui.Strawberry.MainFrame.ScrollingFrame.No-limbs.UICorner
G2L["2d"] = Instance.new("UICorner", G2L["2c"]);



-- StarterGui.Strawberry.MainFrame.ScrollingFrame.No-limbs.Shadow
G2L["2e"] = Instance.new("ImageLabel", G2L["2c"]);
G2L["2e"]["BorderSizePixel"] = 0;
G2L["2e"]["SliceCenter"] = Rect.new(200, 200, 500, 500);
G2L["2e"]["SliceScale"] = 0.1;
G2L["2e"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2e"]["ScaleType"] = Enum.ScaleType.Slice;
G2L["2e"]["ImageTransparency"] = 0.5;
G2L["2e"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["2e"]["Image"] = [[http://www.roblox.com/asset/?id=13960012399]];
G2L["2e"]["Size"] = UDim2.new(1, 18, 1, 18);
G2L["2e"]["BackgroundTransparency"] = 1;
G2L["2e"]["Name"] = [[Shadow]];
G2L["2e"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


-- StarterGui.Strawberry.MainFrame.ScrollingFrame.No-limbs.Shadow.UIGradient
G2L["2f"] = Instance.new("UIGradient", G2L["2e"]);
G2L["2f"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 52, 89)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 52, 89))};


-- StarterGui.Strawberry.MainFrame.ScrollingFrame.No-limbs.LocalScript
G2L["30"] = Instance.new("LocalScript", G2L["2c"]);



-- StarterGui.Strawberry.MainFrame.ScrollingFrame.Naked
G2L["31"] = Instance.new("TextButton", G2L["1b"]);
G2L["31"]["BorderSizePixel"] = 0;
G2L["31"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["31"]["TextSize"] = 18;
G2L["31"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["31"]["FontFace"] = Font.new([[rbxassetid://16658221428]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
G2L["31"]["Size"] = UDim2.new(0, 200, 0, 50);
G2L["31"]["BackgroundTransparency"] = 0.8;
G2L["31"]["Name"] = [[Naked]];
G2L["31"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["31"]["Text"] = [[Naked]];


-- StarterGui.Strawberry.MainFrame.ScrollingFrame.Naked.UICorner
G2L["32"] = Instance.new("UICorner", G2L["31"]);



-- StarterGui.Strawberry.MainFrame.ScrollingFrame.Naked.Shadow
G2L["33"] = Instance.new("ImageLabel", G2L["31"]);
G2L["33"]["BorderSizePixel"] = 0;
G2L["33"]["SliceCenter"] = Rect.new(200, 200, 500, 500);
G2L["33"]["SliceScale"] = 0.1;
G2L["33"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["33"]["ScaleType"] = Enum.ScaleType.Slice;
G2L["33"]["ImageTransparency"] = 0.5;
G2L["33"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["33"]["Image"] = [[http://www.roblox.com/asset/?id=13960012399]];
G2L["33"]["Size"] = UDim2.new(1, 18, 1, 18);
G2L["33"]["BackgroundTransparency"] = 1;
G2L["33"]["Name"] = [[Shadow]];
G2L["33"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


-- StarterGui.Strawberry.MainFrame.ScrollingFrame.Naked.Shadow.UIGradient
G2L["34"] = Instance.new("UIGradient", G2L["33"]);
G2L["34"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 52, 89)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 52, 89))};


-- StarterGui.Strawberry.MainFrame.ScrollingFrame.Naked.LocalScript
G2L["35"] = Instance.new("LocalScript", G2L["31"]);



-- StarterGui.Strawberry.MainFrame.ScrollingFrame.Kick
G2L["36"] = Instance.new("TextButton", G2L["1b"]);
G2L["36"]["BorderSizePixel"] = 0;
G2L["36"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["36"]["TextSize"] = 18;
G2L["36"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["36"]["FontFace"] = Font.new([[rbxassetid://16658221428]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
G2L["36"]["Size"] = UDim2.new(0, 200, 0, 50);
G2L["36"]["BackgroundTransparency"] = 0.8;
G2L["36"]["Name"] = [[Kick]];
G2L["36"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["36"]["Text"] = [[Kick]];


-- StarterGui.Strawberry.MainFrame.ScrollingFrame.Kick.UICorner
G2L["37"] = Instance.new("UICorner", G2L["36"]);



-- StarterGui.Strawberry.MainFrame.ScrollingFrame.Kick.Shadow
G2L["38"] = Instance.new("ImageLabel", G2L["36"]);
G2L["38"]["BorderSizePixel"] = 0;
G2L["38"]["SliceCenter"] = Rect.new(200, 200, 500, 500);
G2L["38"]["SliceScale"] = 0.1;
G2L["38"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["38"]["ScaleType"] = Enum.ScaleType.Slice;
G2L["38"]["ImageTransparency"] = 0.5;
G2L["38"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["38"]["Image"] = [[http://www.roblox.com/asset/?id=13960012399]];
G2L["38"]["Size"] = UDim2.new(1, 18, 1, 18);
G2L["38"]["BackgroundTransparency"] = 1;
G2L["38"]["Name"] = [[Shadow]];
G2L["38"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


-- StarterGui.Strawberry.MainFrame.ScrollingFrame.Kick.Shadow.UIGradient
G2L["39"] = Instance.new("UIGradient", G2L["38"]);
G2L["39"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 52, 89)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 52, 89))};


-- StarterGui.Strawberry.MainFrame.ScrollingFrame.Kick.LocalScript
G2L["3a"] = Instance.new("LocalScript", G2L["36"]);



-- StarterGui.Strawberry.MainFrame.ScrollingFrame.Delete Tool
G2L["3b"] = Instance.new("TextButton", G2L["1b"]);
G2L["3b"]["BorderSizePixel"] = 0;
G2L["3b"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3b"]["TextSize"] = 18;
G2L["3b"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3b"]["FontFace"] = Font.new([[rbxassetid://16658221428]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
G2L["3b"]["Size"] = UDim2.new(0, 200, 0, 50);
G2L["3b"]["BackgroundTransparency"] = 0.8;
G2L["3b"]["Name"] = [[Delete Tool]];
G2L["3b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3b"]["Text"] = [[Delete Tool (ONLY YOU)]];


-- StarterGui.Strawberry.MainFrame.ScrollingFrame.Delete Tool.UICorner
G2L["3c"] = Instance.new("UICorner", G2L["3b"]);



-- StarterGui.Strawberry.MainFrame.ScrollingFrame.Delete Tool.Shadow
G2L["3d"] = Instance.new("ImageLabel", G2L["3b"]);
G2L["3d"]["BorderSizePixel"] = 0;
G2L["3d"]["SliceCenter"] = Rect.new(200, 200, 500, 500);
G2L["3d"]["SliceScale"] = 0.1;
G2L["3d"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3d"]["ScaleType"] = Enum.ScaleType.Slice;
G2L["3d"]["ImageTransparency"] = 0.5;
G2L["3d"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["3d"]["Image"] = [[http://www.roblox.com/asset/?id=13960012399]];
G2L["3d"]["Size"] = UDim2.new(1, 18, 1, 18);
G2L["3d"]["BackgroundTransparency"] = 1;
G2L["3d"]["Name"] = [[Shadow]];
G2L["3d"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


-- StarterGui.Strawberry.MainFrame.ScrollingFrame.Delete Tool.Shadow.UIGradient
G2L["3e"] = Instance.new("UIGradient", G2L["3d"]);
G2L["3e"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 52, 89)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 52, 89))};


-- StarterGui.Strawberry.MainFrame.ScrollingFrame.Delete Tool.LocalScript
G2L["3f"] = Instance.new("LocalScript", G2L["3b"]);



-- StarterGui.Strawberry.MainFrame.ScrollingFrame.Blockhead
G2L["40"] = Instance.new("TextButton", G2L["1b"]);
G2L["40"]["BorderSizePixel"] = 0;
G2L["40"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["40"]["TextSize"] = 18;
G2L["40"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["40"]["FontFace"] = Font.new([[rbxassetid://16658221428]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
G2L["40"]["Size"] = UDim2.new(0, 200, 0, 50);
G2L["40"]["BackgroundTransparency"] = 0.8;
G2L["40"]["Name"] = [[Blockhead]];
G2L["40"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["40"]["Text"] = [[Blockhead (R6)]];


-- StarterGui.Strawberry.MainFrame.ScrollingFrame.Blockhead.UICorner
G2L["41"] = Instance.new("UICorner", G2L["40"]);



-- StarterGui.Strawberry.MainFrame.ScrollingFrame.Blockhead.Shadow
G2L["42"] = Instance.new("ImageLabel", G2L["40"]);
G2L["42"]["BorderSizePixel"] = 0;
G2L["42"]["SliceCenter"] = Rect.new(200, 200, 500, 500);
G2L["42"]["SliceScale"] = 0.1;
G2L["42"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["42"]["ScaleType"] = Enum.ScaleType.Slice;
G2L["42"]["ImageTransparency"] = 0.5;
G2L["42"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["42"]["Image"] = [[http://www.roblox.com/asset/?id=13960012399]];
G2L["42"]["Size"] = UDim2.new(1, 18, 1, 18);
G2L["42"]["BackgroundTransparency"] = 1;
G2L["42"]["Name"] = [[Shadow]];
G2L["42"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


-- StarterGui.Strawberry.MainFrame.ScrollingFrame.Blockhead.Shadow.UIGradient
G2L["43"] = Instance.new("UIGradient", G2L["42"]);
G2L["43"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 52, 89)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 52, 89))};


-- StarterGui.Strawberry.MainFrame.ScrollingFrame.Blockhead.LocalScript
G2L["44"] = Instance.new("LocalScript", G2L["40"]);



-- StarterGui.Strawberry.MainFrame.ScrollingFrame.Waist
G2L["45"] = Instance.new("TextButton", G2L["1b"]);
G2L["45"]["BorderSizePixel"] = 0;
G2L["45"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["45"]["TextSize"] = 18;
G2L["45"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["45"]["FontFace"] = Font.new([[rbxassetid://16658221428]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
G2L["45"]["Size"] = UDim2.new(0, 200, 0, 50);
G2L["45"]["BackgroundTransparency"] = 0.8;
G2L["45"]["Name"] = [[Waist]];
G2L["45"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["45"]["Text"] = [[Delete Waist (R15)]];


-- StarterGui.Strawberry.MainFrame.ScrollingFrame.Waist.UICorner
G2L["46"] = Instance.new("UICorner", G2L["45"]);



-- StarterGui.Strawberry.MainFrame.ScrollingFrame.Waist.Shadow
G2L["47"] = Instance.new("ImageLabel", G2L["45"]);
G2L["47"]["BorderSizePixel"] = 0;
G2L["47"]["SliceCenter"] = Rect.new(200, 200, 500, 500);
G2L["47"]["SliceScale"] = 0.1;
G2L["47"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["47"]["ScaleType"] = Enum.ScaleType.Slice;
G2L["47"]["ImageTransparency"] = 0.5;
G2L["47"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["47"]["Image"] = [[http://www.roblox.com/asset/?id=13960012399]];
G2L["47"]["Size"] = UDim2.new(1, 18, 1, 18);
G2L["47"]["BackgroundTransparency"] = 1;
G2L["47"]["Name"] = [[Shadow]];
G2L["47"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


-- StarterGui.Strawberry.MainFrame.ScrollingFrame.Waist.Shadow.UIGradient
G2L["48"] = Instance.new("UIGradient", G2L["47"]);
G2L["48"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 52, 89)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 52, 89))};


-- StarterGui.Strawberry.MainFrame.ScrollingFrame.Waist.LocalScript
G2L["49"] = Instance.new("LocalScript", G2L["45"]);



-- StarterGui.Strawberry.MainFrame.Drag
G2L["4a"] = Instance.new("LocalScript", G2L["2"]);
G2L["4a"]["Name"] = [[Drag]];


-- StarterGui.Strawberry.MainFrame.Exit.RE.LocalScript
local function C_e()
local script = G2L["e"];
	script.Parent.MouseButton1Click:Connect(function()
		script.Parent.Parent.Parent.Parent:Destroy()
	end)
end;
task.spawn(C_e);
-- StarterGui.Strawberry.MainFrame.Exit.Anim
local function C_12()
local script = G2L["12"];
	local button = script.Parent
	
	button.MouseEnter:Connect(function()
		button:TweenSize(UDim2.new(0, 32,0, 32), "Out", "Quad", 0.1, true)
	end)
	button.MouseLeave:Connect(function()
		button:TweenSize(UDim2.new(0, 30,0, 30), "Out", "Quad", 0.1, true)
	end)
end;
task.spawn(C_12);
-- StarterGui.Strawberry.MainFrame.Username.Anim
local function C_14()
local script = G2L["14"];
	local button = script.Parent
	
	button.MouseEnter:Connect(function()
		button:TweenSize(UDim2.new(0, 217,0, 32), "Out", "Quad", 0.1, true)
	end)
	button.MouseLeave:Connect(function()
		button:TweenSize(UDim2.new(0, 215,0, 30), "Out", "Quad", 0.1, true)
	end)
end;
task.spawn(C_14);
-- StarterGui.Strawberry.MainFrame.Username.Check
local function C_1a()
local script = G2L["1a"];
	local Players = game:GetService("Players")
	local textBox = script.Parent
	
	local SPECIAL_KEYWORDS = {
		["all"] = true,
		["others"] = true,
		["me"] = true
	}
	
	local function findMatchingUsername(partial)
		local lowerPartial = partial:lower()
	
		if SPECIAL_KEYWORDS[lowerPartial] then
			return nil
		end
	
		for _, player in ipairs(Players:GetPlayers()) do
			if player.DisplayName:lower():sub(1, #lowerPartial) == lowerPartial then
				return player.Name
			end
		end
		return nil
	end
	
	textBox:GetPropertyChangedSignal("Text"):Connect(function()
		local input = textBox.Text
		wait(1)
	
		if input ~= "" and not SPECIAL_KEYWORDS[input:lower()] then
			local match = findMatchingUsername(input)
			if match and match ~= input then
				textBox.Text = match
			end
		end
	end)
end;
task.spawn(C_1a);
-- StarterGui.Strawberry.MainFrame.ScrollingFrame.Kill.ex
local function C_20()
local script = G2L["20"];
	script.Parent.MouseButton1Click:Connect(function()
		local name = script.Parent.Parent.Parent.Username.Text
		local player = game.Players:FindFirstChild(name)
	
		if name ~= "all" and name ~= "others" and name ~= "me" then
			if player and player.Character and player.Character:FindFirstChild("Head") then
				delete(player.Character.Head)
			end
		elseif name == "all" then
			for _, v in pairs(game.Players:GetPlayers()) do
				if v.Character and v.Character:FindFirstChild("Head") then
					delete(v.Character.Head)
				end
			end
		elseif name == "others" then
			local localPlayer = game.Players.LocalPlayer
			for _, v in pairs(game.Players:GetPlayers()) do
				if v ~= localPlayer and v.Character and v.Character:FindFirstChild("Head") then
					delete(v.Character.Head)
				end
			end
		elseif name == "me" then
			local localPlayer = game.Players.LocalPlayer
			if localPlayer.Character and localPlayer.Character:FindFirstChild("Head") then
				delete(localPlayer.Character.Head)
			end
		end
	end)
end;
task.spawn(C_20);
-- StarterGui.Strawberry.MainFrame.ScrollingFrame.Punish.LocalScript
local function C_26()
local script = G2L["26"];
	script.Parent.MouseButton1Click:Connect(function()
		local name = script.Parent.Parent.Parent.Username.Text
		local player = game.Players:FindFirstChild(name)
			
		if name ~= "all" and name ~= "others" and name ~= "me" then
			if player and player.Character and player.Character:FindFirstChild("Head") then
				delete(player.Character)
			end
		elseif name == "all" then
			for _, v in pairs(game.Players:GetPlayers()) do
				if v.Character and v.Character:FindFirstChild("Head") then
					delete(v.Character)
				end
			end
		elseif name == "others" then
			local localPlayer = game.Players.LocalPlayer
			for _, v in pairs(game.Players:GetPlayers()) do
				if v ~= localPlayer and v.Character and v.Character:FindFirstChild("Head") then
					delete(v.Character)
				end
			end
		elseif name == "me" then
			local localPlayer = game.Players.LocalPlayer
			if localPlayer.Character and localPlayer.Character:FindFirstChild("Head") then
				delete(game.Players.LocalPlayer.Character)
			end
		end
	end)
end;
task.spawn(C_26);
-- StarterGui.Strawberry.MainFrame.ScrollingFrame.Ragdoll.LocalScript
local function C_2b()
local script = G2L["2b"];
	script.Parent.MouseButton1Click:Connect(function()
		local name = script.Parent.Parent.Parent.Username.Text
		local player = game.Players:FindFirstChild(name)
		
		if name ~= "all" and name ~= "others" and name ~= "me" then
			if player and player.Character and player.Character:FindFirstChild("Head") then
				delete(player.Character.HumanoidRootPart)
			end
		elseif name == "all" then
			for _, v in pairs(game.Players:GetPlayers()) do
				if v.Character and v.Character:FindFirstChild("Head") then
					delete(v.Character.HumanoidRootPart)
				end
			end
		elseif name == "others" then
			local localPlayer = game.Players.LocalPlayer
			for _, v in pairs(game.Players:GetPlayers()) do
				if v ~= localPlayer and v.Character and v.Character:FindFirstChild("Head") then
					delete(v.Character.HumanoidRootPart)
				end
			end
		elseif name == "me" then
			local localPlayer = game.Players.LocalPlayer
			if localPlayer.Character and localPlayer.Character:FindFirstChild("Head") then
				delete(game.Players.LocalPlayer.Character.HumanoidRootPart)
			end
		end
	end)
end;
task.spawn(C_2b);
-- StarterGui.Strawberry.MainFrame.ScrollingFrame.No-limbs.LocalScript
local function C_30()
local script = G2L["30"];
	--this was my pain and suffering :')
	
	script.Parent.MouseButton1Click:Connect(function()
		local name = script.Parent.Parent.Parent.Username.Text
		local player = game.Players:FindFirstChild(name)
		local character = player.Character
	
		if name ~= "all" and name ~= "others" and name ~= "me" then
			if player and player.Character and player.Character:FindFirstChild("Head") then
				if character:FindFirstChild("Torso") then
					local limbs = {"Left Arm", "Left Leg", "Right Arm", "Right Leg"}
					for _, limb in ipairs(limbs) do
						local part = character:FindFirstChild(limb)
						if part then delete(part) end
					end
				elseif character:FindFirstChild("UpperTorso") then
					local limbs = {
						"LeftUpperArm", "LeftLowerArm", "LeftArm",
						"LeftUpperLeg", "LeftLowerLeg", "LeftLeg",
						"RightUpperArm", "RightLowerArm", "RightArm",
						"RightUpperLeg", "RightLowerLeg", "RightLeg"
					}
					for _, limb in ipairs(limbs) do
						local part = character:FindFirstChild(limb)
						if part then delete(part) end
					end
				end
			end
		elseif name == "all" then
			for _, v in pairs(game.Players:GetPlayers()) do
				if v.Character and v.Character:FindFirstChild("Head") then
					if v.Character:FindFirstChild("Torso") then
						local limbs = {"Left Arm", "Left Leg", "Right Arm", "Right Leg"}
						for _, limb in ipairs(limbs) do
							local part = v.Character:FindFirstChild(limb)
							if part then delete(part) end
						end
					elseif v.Character:FindFirstChild("UpperTorso") then
						local limbs = {
							"LeftUpperArm", "LeftLowerArm", "LeftArm",
							"LeftUpperLeg", "LeftLowerLeg", "LeftLeg",
							"RightUpperArm", "RightLowerArm", "RightArm",
							"RightUpperLeg", "RightLowerLeg", "RightLeg"
						}
						for _, limb in ipairs(limbs) do
							local part = v.Character:FindFirstChild(limb)
							if part then delete(part) end
						end
					end
				end
			end
		elseif name == "others" then
			local localPlayer = game.Players.LocalPlayer
			for _, v in pairs(game.Players:GetPlayers()) do
				if v ~= localPlayer and v.Character and v.Character:FindFirstChild("Head") then
					if v.Character:FindFirstChild("Torso") then
						local limbs = {"Left Arm", "Left Leg", "Right Arm", "Right Leg"}
						for _, limb in ipairs(limbs) do
							local part = v.Character:FindFirstChild(limb)
							if part then delete(part) end
						end
					elseif v.Character:FindFirstChild("UpperTorso") then
						local limbs = {
							"LeftUpperArm", "LeftLowerArm", "LeftArm",
							"LeftUpperLeg", "LeftLowerLeg", "LeftLeg",
							"RightUpperArm", "RightLowerArm", "RightArm",
							"RightUpperLeg", "RightLowerLeg", "RightLeg"
						}
						for _, limb in ipairs(limbs) do
							local part = v.Character:FindFirstChild(limb)
							if part then delete(part) end
						end
					end
				end
			end
		elseif name == "me" then
			local localPlayer = game.Players.LocalPlayer
			if localPlayer.Character and localPlayer.Character:FindFirstChild("Head") then
				if game.Players.LocalPlayer.Character:FindFirstChild("Torso") then
					local limbs = {"Left Arm", "Left Leg", "Right Arm", "Right Leg"}
					for _, limb in ipairs(limbs) do
						local part = character:FindFirstChild(limb)
						if part then delete(part) end
					end
				elseif game.Players.LocalPlayer.Character:FindFirstChild("UpperTorso") then
					local limbs = {
						"LeftUpperArm", "LeftLowerArm", "LeftArm",
						"LeftUpperLeg", "LeftLowerLeg", "LeftLeg",
						"RightUpperArm", "RightLowerArm", "RightArm",
						"RightUpperLeg", "RightLowerLeg", "RightLeg"
					}
					for _, limb in ipairs(limbs) do
						local part = game.Players.LocalPlayer.Character:FindFirstChild(limb)
						if part then delete(part) end
					end
				end
			end
		end
	end)
end;
task.spawn(C_30);
-- StarterGui.Strawberry.MainFrame.ScrollingFrame.Naked.LocalScript
local function C_35()
local script = G2L["35"];
	script.Parent.MouseButton1Click:Connect(function()
		local name = script.Parent.Parent.Parent.Username.Text
		local player = game.Players:FindFirstChild(name)
	
		if name ~= "all" and name ~= "others" and name ~= "me" then
			if player and player.Character and player.Character:FindFirstChild("Head") then
				for _, v in pairs(player.Character:GetChildren()) do
					if v:IsA("Shirt") or v:IsA("Pants") or v:IsA("ShirtGraphic") then
						delete(v)
					end
				end
			end
		elseif name == "all" then
			for _, v in pairs(game.Players:GetPlayers()) do
				if v.Character and v.Character:FindFirstChild("Head") then
					for _, x in pairs(v.Character:GetChildren()) do
						if x:IsA("Shirt") or x:IsA("Pants") or x:IsA("ShirtGraphic") then
							delete(v)
						end
					end
				end
			end
		elseif name == "others" then
			local localPlayer = game.Players.LocalPlayer
			for _, v in pairs(game.Players:GetPlayers()) do
				if v ~= localPlayer and v.Character and v.Character:FindFirstChild("Head") then
					for _, x in pairs(v.Character:GetChildren()) do
						if x:IsA("Shirt") or x:IsA("Pants") or x:IsA("ShirtGraphic") then
							delete(v)
						end
					end
				end
			end
		elseif name == "me" then
			local localPlayer = game.Players.LocalPlayer
			if localPlayer.Character and localPlayer.Character:FindFirstChild("Head") then
				for _, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
					if v:IsA("Shirt") or v:IsA("Pants") or v:IsA("ShirtGraphic") then
						delete(v)
					end
				end
			end
		end
	end)
end;
task.spawn(C_35);
-- StarterGui.Strawberry.MainFrame.ScrollingFrame.Kick.LocalScript
local function C_3a()
local script = G2L["3a"];
	script.Parent.MouseButton1Click:Connect(function()
		local name = script.Parent.Parent.Parent.Username.Text
		local player = game.Players:FindFirstChild(name)
		
		if name ~= "all" and name ~= "others" and name ~= "me" then
			if player and player.Character and player.Character:FindFirstChild("Head") then
				delete(player)
			end
		elseif name == "all" then
			for _, v in pairs(game.Players:GetPlayers()) do
				if v.Character and v.Character:FindFirstChild("Head") then
					delete(v)
				end
			end
		elseif name == "others" then
			local localPlayer = game.Players.LocalPlayer
			for _, v in pairs(game.Players:GetPlayers()) do
				if v ~= localPlayer and v.Character and v.Character:FindFirstChild("Head") then
					delete(v)
				end
			end
		elseif name == "me" then
			local localPlayer = game.Players.LocalPlayer
			if localPlayer.Character and localPlayer.Character:FindFirstChild("Head") then
				delete(game.Players.LocalPlayer)
			end
		end
	end)
end;
task.spawn(C_3a);
-- StarterGui.Strawberry.MainFrame.ScrollingFrame.Delete Tool.LocalScript
local function C_3f()
local script = G2L["3f"];
	script.Parent.MouseButton1Click:Connect(function()
		local Players = game:GetService("Players")
		local player = Players.LocalPlayer
		local mouse = player:GetMouse()
	
		local tool = Instance.new("Tool")
		tool.Name = "Delete Tool"
		tool.RequiresHandle = false
		tool.Parent = player:WaitForChild("Backpack")
	
		local equipped = false
	
		tool.Equipped:Connect(function()
			equipped = true
		end)
	
		tool.Unequipped:Connect(function()
			equipped = false
		end)
	
		mouse.Button1Down:Connect(function()
			if not equipped then return end
	
			local target = mouse.Target
			if target then
				delete(target)
			end
		end)
	end)
end;
task.spawn(C_3f);
-- StarterGui.Strawberry.MainFrame.ScrollingFrame.Blockhead.LocalScript
local function C_44()
local script = G2L["44"];
	script.Parent.MouseButton1Click:Connect(function()
		local name = script.Parent.Parent.Parent.Username.Text
		local player = game.Players:FindFirstChild(name)
		local character = player.Character
	
		if name ~= "all" and name ~= "others" and name ~= "me" then
			if player and player.Character and player.Character:FindFirstChild("Head") then
				delete(character.Head:FindFirstChildWhichIsA("SpecialMesh"))
			end
		elseif name == "all" then
			for _, v in pairs(game.Players:GetPlayers()) do
				if v.Character and v.Character:FindFirstChild("Head") then
					delete(v.Character.Head:FindFirstChildWhichIsA("SpecialMesh"))
				end
			end
		elseif name == "others" then
			local localPlayer = game.Players.LocalPlayer
			for _, v in pairs(game.Players:GetPlayers()) do
				if v ~= localPlayer and v.Character and v.Character:FindFirstChild("Head") then
					delete(v.Character.Head:FindFirstChildWhichIsA("SpecialMesh"))
				end
			end
		elseif name == "me" then
			local localPlayer = game.Players.LocalPlayer
			if localPlayer.Character and localPlayer.Character:FindFirstChild("Head") then
				delete(localPlayer.Character.Head:FindFirstChildWhichIsA("SpecialMesh"))
			end
		end
	end)
end;
task.spawn(C_44);
-- StarterGui.Strawberry.MainFrame.ScrollingFrame.Waist.LocalScript
local function C_49()
local script = G2L["49"];
	script.Parent.MouseButton1Click:Connect(function()
		local name = script.Parent.Parent.Parent.Username.Text
		local player = game.Players:FindFirstChild(name)
		local character = player.Character
	
		if name ~= "all" and name ~= "others" and name ~= "me" then
			if player and player.Character and player.Character:FindFirstChild("Head") then
				delete(character.UpperTorso:FindFirstChild("Waist"))
			end
		elseif name == "all" then
			for _, v in pairs(game.Players:GetPlayers()) do
				if v.Character and v.Character:FindFirstChild("Head") then
					delete(v.Character.UpperTorso:FindFirstChild("Waist"))
				end
			end
		elseif name == "others" then
			local localPlayer = game.Players.LocalPlayer
			for _, v in pairs(game.Players:GetPlayers()) do
				if v ~= localPlayer and v.Character and v.Character:FindFirstChild("Head") then
					delete(v.Character.UpperTorso:FindFirstChild("Waist"))
				end
			end
		elseif name == "me" then
			local localPlayer = game.Players.LocalPlayer
			if localPlayer.Character and localPlayer.Character:FindFirstChild("Head") then
				delete(game.Players.LocalPlayer.Character.UpperTorso:FindFirstChild("Waist"))
			end
		end
	end)
end;
task.spawn(C_49);
-- StarterGui.Strawberry.MainFrame.Drag
local function C_4a()
local script = G2L["4a"];
	--Instance.new("UIDragDetector",script.Parent) script:Destroy()
	local frame = script.Parent
	local userInputService = game:GetService("UserInputService")
	local runService = game:GetService("RunService")
	
	local dragging = false
	local dragOffset = Vector2.zero
	
	local function clampToScreen(pos, size)
		local viewportSize = workspace.CurrentCamera.ViewportSize
		local x = math.clamp(pos.X, 0, viewportSize.X - size.X)
		local y = math.clamp(pos.Y, 0, viewportSize.Y - size.Y)
		return Vector2.new(x, y)
	end
	
	frame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true
			local mousePos = userInputService:GetMouseLocation()
			local guiInset = game:GetService("GuiService"):GetGuiInset()
			mousePos = mousePos - guiInset
			dragOffset = mousePos - frame.AbsolutePosition
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	runService.RenderStepped:Connect(function()
		if dragging then
			local mousePos = userInputService:GetMouseLocation()
			local guiInset = game:GetService("GuiService"):GetGuiInset()
			mousePos = mousePos - guiInset
	
			local newPos = mousePos - dragOffset
			local clamped = clampToScreen(newPos, frame.AbsoluteSize)
			frame.Position = UDim2.new(0, clamped.X, 0, clamped.Y)
		end
	end)
	
end;
task.spawn(C_4a);

return G2L["1"], require;
