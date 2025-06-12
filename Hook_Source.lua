local playersList = ""
for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
	playersList = playersList .. string.format("`%s` (%d)\n", player.Name, player.UserId)
end
if #playersList == 0 then playersList = "None" end

local embed = {
	["title"] = "🍓 Strawberry Logged A Game!",
	["description"] = "Game Link: [https://www.roblox.com/games/" .. game.PlaceId .. "](https://www.roblox.com/games/"..game.PlaceId..")",
	["color"] = 16711680,
	["fields"] = {
		{
			["name"] = "Game Info",
			["value"] = string.format("```\nName: %s\nPlaceId: %d\nJobId: %s\nCreatorId: %d\n```", game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name, game.PlaceId, game.JobId, game.CreatorId),
			["inline"] = false
		},
		{
			["name"] = "Players ("..#game:GetService("Players"):GetPlayers().."/"..game:GetService("Players").MaxPlayers..")",
			["value"] = playersList,
			["inline"] = true
		}
	},
	["footer"] = {
		["text"] = "Strawberry V6 // BEASTMODE by C:\\Drive, Saji & Sane"
	},
	["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%S.000Z")
}

request({
	Url = "", -- // ur webhook url
	Method = "POST",
	Headers = {["Content-Type"] = "application/json"},
	Body = game:GetService("HttpService"):JSONEncode({["username"] = "Strawberry Logger", ["avatar_url"] = "https://i.imgur.com/qav7D0t.png", ["embeds"] = {embed}})
})
