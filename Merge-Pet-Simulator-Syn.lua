function script()
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

    local Window = Library.CreateLib("Merge Pet Simulator - Synapse X", "Serpent")

    local MainTab = Window:NewTab("Main")

    local MainSection = MainTab:NewSection("Main")

    getgenv().AutoClickBestPet = false
    getgenv().AutoMerge = false

    MainSection:NewToggle("Auto Click Best Pet", "", function(state)
        getgenv().AutoClickBestPet = state
    end)

    MainSection:NewToggle("Auto Merge", "", function(state)
        getgenv().AutoMerge = state
    end)

    MainSection:NewButton("Complete Obby", "3 minutes delay!", function()
        game:GetService("ReplicatedStorage").Remotes.obby_done:FireServer()
    end)

    while wait() do
        if getgenv().AutoClickBestPet then
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
        else
            if getgenv().AutoMerge then
                for i,v in pairs(workspace.Plots[game.Players.LocalPlayer.Name .. "_Plot"]:GetChildren()) do
                    if tonumber(v.Name) ~= nil then
                        if v:FindFirstChild("ID") then
                            game:GetService("ReplicatedStorage").Remotes.merge_pet:FireServer(v:FindFirstChild("ID").Value, v:FindFirstChild("ID").Value)
                        end
                    end
                end
            end
        end
    end
end

if syn then
    script()
else
    game.Players.LocalPlayer:Kick("You are not using Synapse X")
end
