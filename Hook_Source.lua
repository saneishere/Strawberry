-- // this is the the obfuscated file in this repo aka Hook.lua but unobfuscated without our webhook
-- // reason that one is obfuscated it because it contains our webhook. but heres the code, just replace the webhook with yours.

function SendMessage(url, message)
    local http = game:GetService("HttpService")
    local headers = {
        ["Content-Type"] = "application/json"
    }
    local data = {
        ["content"] = message
    }
    local body = http:JSONEncode(data)
    local response = request({
        Url = url,
        Method = "POST",
        Headers = headers,
        Body = body
    })
end

local hook = "https://discord.com/api/webhooks/123"

SendMessage(hook, "https://roblox.com/games/"..game.PlaceId.."/")
