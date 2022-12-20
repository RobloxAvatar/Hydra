local Players = game:GetService("Players")
local lp = Players.LocalPlayer

local function GetClosestPlayer()
   local target = nil
   local distance = math.huge
 
   for i,v in next, Players:GetPlayers() do
       if v and v ~= lp and v.Character and v.Character:FindFirstChildOfClass('Humanoid') and v.Character:FindFirstChildOfClass('Humanoid').RootPart then
           local plrdist = lp:DistanceFromCharacter(v.Character:FindFirstChildOfClass('Humanoid').RootPart.CFrame.p)
           if plrdist < distance then
               target = v
               distance = plrdist
           end
       end
   end
 
   return target
end

local engine = loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxAvatar/Hydra/main/Engine.lua"))()

if ReaperFarm then
    engine.MakeNotification("Reaper Farm Turned On!", 3)
else
    engine.MakeNotification("Reaper Farm Turned Off!", 3)
end

spawn(function()
    while task.wait() do
        if ReaperFarm then
            pcall(function()
                repeat task.wait() until game.Players.LocalPlayer.Character ~= nil and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                repeat wait() until not game.Players.LocalPlayer.Character:FindFirstChild("entered")
                if not ReaperFarm then return end
                wait(1.25)
                if not game.Players.LocalPlayer.Character:FindFirstChild("entered") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, workspace.Lobby.Teleport1, 0)
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, workspace.Lobby.Teleport1, 1)
                end
                wait(1.25)
                if game.Players.LocalPlayer.Character:FindFirstChild("entered") and not game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then
                    game.Players.LocalPlayer.Character.Humanoid.Health = 0
                    return
                end
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = GetClosestPlayer().Character.HumanoidRootPart.CFrame
                repeat wait() until workspace[game.Players.LocalPlayer.Name]:FindFirstChild("DeathMark")
                game.Players.LocalPlayer.Character.Humanoid.Health = 0
            end)
        end
    end
end)
