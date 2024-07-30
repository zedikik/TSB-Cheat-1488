local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character
local Humanoid = Character.Humanoid

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/zedikik/uwuware/main/Loader.lua", true))()
--To close/open the UI (after it's been initialized) use Library:Close() to toggle it, use the keybind option to quickly make a toggle for it without hassle (there is an example below)
 
--Making a window
local Window = Library:CreateWindow"TSB Cheat 1488"

Window:AddFolder"Main"

_G.Stealer = false
_G.SafeMode = true
_G.ScanDelay = 5
_G.TPDelay = 10
_G.Delayed = false

 
--Toggle
Window:AddToggle({text = "Kill Stealer", flag = "toggle", state = false, callback = function(val) 
    print(val)
    _G.Stealer = val

    while wait(_G.ScanDelay) do
        if _G.Stealer == true and _G.Delayed == false then
            for index, otherPlayer in pairs(Players:GetPlayers()) do
                if otherPlayer.Character then

                    if LocalPlayer.Character then

                        if otherPlayer.Character.Humanoid.Health >= 15 and otherPlayer.Character.Humanoid.Health ~= 1 then

                            if otherPlayer.Character:FindFirstChild("HumanoidRootPart") and Character:FindFirstChild("HumanoidRootPart") then

                                _G.Delayed = true

                                Character.HumanoidRootPart.CFrame = otherPlayer.Character.HumanoidRootPart.CFrame

                                task.wait(_G.TPDelay)

                                _G.Delayed = false

                            else

                                warn(otherPlayer.Name, "or", LocalPlayer.Name, "doesnt have HumanoidRootPart, using Torso")
                                
                                _G.Delayed = true

                                Character.Torso.CFrame = otherPlayer.Character.Torso.CFrame

                                task.wait(_G.TPDelay)

                                _G.Delayed = false

                            end

                        else
                            warn(otherPlayer.Name, "has health than more 15")
                        end

                    else

                        warn(LocalPlayer.Name, "doesnt have character")

                    end

                else
                    warn(otherPlayer.Name, "doesnt have character")
                end

            end
        else
            break
        end
    end
end})


Window:AddToggle({text = "Safe Mode", flag = "toggle1", state = true, callback = function(val) 
    print(val)
    _G.SafeMode = val
end})
--If the state is set to true by default then it will fire the callback when the library is initialized
 
 
--Slider
Window:AddSlider({text = "WalkSpeed Multipler", flag = "slider1", value = 100, min = 20, max = 200, float = 0.3, callback = function(val) 
    Humanoid.Changed:Connect(function()
        Humanoid.WalkSpeed = val
    end)
end})
 

Window:AddBind({text = "Toggle UI", key = "RightShift", callback = function() 
    Library:Close() 
end})
 

Library:Init()
