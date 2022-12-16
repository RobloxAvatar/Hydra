local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/RobloxAvatar/uiLibary/main/Uilib.lua')))()

local w = library:CreateWindow("Merge Pet Simulator")
local MainTab = w:CreateFolder("Main")

getgenv().AutoClickBestPet = false
getgenv().AutoMerge = false

MainTab:Toggle("Auto Click Best Pet", function(bool)
    getgenv().AutoClickBestPet = bool
end)

MainTab:Toggle("Auto Merge", function(bool)
    getgenv().AutoMerge = bool
end)

MainTab:Button("Complete Obby", function()
    game:GetService("ReplicatedStorage").Remotes.obby_done:FireServer()
end)

spawn(function()
    while task.wait() do
        if getgenv().AutoClickBestPet then
            pcall(function()
                local petNames = {}
                if workspace.Plots[game.Players.LocalPlayer.Name.."_Plot"]:FindFirstChild("ID", true) then
                    for i,v in pairs(workspace.Plots[game.Players.LocalPlayer.Name.."_Plot"]:GetChildren()) do
                        if tonumber(v.Name) ~= nil then
                            if not table.find(petNames, tonumber(v.Name)) then
                                table.insert(petNames, tonumber(v.Name))
                            end
                        end
                    end
                    if workspace.Plots[game.Players.LocalPlayer.Name.."_Plot"]:FindFirstChild("ID", true) then
                        if petNames[1] ~= nil then
                            if table.unpack(petNames) ~= nil then
                                if math.max(table.unpack(petNames)) ~= nil then
                                    game:GetService("ReplicatedStorage").Remotes.mouse_down:FireServer(workspace.Plots[game.Players.LocalPlayer.Name.."_Plot"]:FindFirstChild(math.max(table.unpack(petNames))))
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while task.wait() do
        if getgenv().AutoMerge then
            pcall(function()
                for i,v in pairs(workspace.Plots[game.Players.LocalPlayer.Name .. "_Plot"]:GetChildren()) do
                    if tonumber(v.Name) ~= nil then
                        if v:FindFirstChild("ID") then
                            game:GetService("ReplicatedStorage").Remotes.merge_pet:FireServer(v:FindFirstChild("ID").Value, v:FindFirstChild("ID").Value)
                        end
                    end
                end
            end)
        end
    end
end)
