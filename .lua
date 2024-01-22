local Library = 
loadstring(Game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local Window_1 = Library:NewWindow("AI")
local User = game.Players.LocalPlayer
local UI = User["PlayerGui"]["Main"]["Menus"]["Tasks"]
local AI = {}
local Tab1 = Window_1:NewSection("Auto complete")

local function AI.start()
  if UI["Task"]["Text"]:sub(1,5) == "Click" then
    game:GetService("ReplicatedStorage")["Events"]["ForServer"]["TaskProgress"]:FireServer("Click")
  elseif UI["Task"]["Text"]:sub(1,4) == "Walk" then
    game:GetService("ReplicatedStorage")["Events"]["ForServer"]["UpdQuest4"]:FireServer(50)
  elseif UI["Task"]["Text"]:sub(1,4) == "Jump" then
    User["Character"]["Humanoid"]["Jump"] = true
    User["Character"]["Humanoid"]["Sit"] = true
  elseif UI["Task"]["Text"]:sub(1,9) == "Dont move" or UI["Task"]["Text"]:sub(1,6) == "Freeze" then
    game:GetService("ReplicatedStorage")["Events"]["ForServer"]["TaskProgress"]:FireServer("Freeze",9e9)
  end
end

Tab1:CreateToggle("Start AI",function(value)
    _G.AI = value
        while wait() do
           if _G.AI == false then break end
             if UI["Task"]["Text"]:sub(1,13) ~= "Next task in:" then
                AI.start()
              end
        end
end)
