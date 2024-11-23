local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local jumpKey = Enum.KeyCode.Space
local holdTime = 2 -- customize how long to hold if you jumping (seconds)
local boostTime = 0.4 -- speed how long it will boost you (seconds)
local boostSpeed = 40 -- speed you are getting boosted at (walkspeed)

local holdTimer = 0

UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == jumpKey then
        holdTimer = 0
        while holdTimer < holdTime do
            holdTimer = holdTimer + 0.1
            task.wait(0.1) -- how long between each boost tasks
            if not UserInputService:IsKeyDown(jumpKey) then
                holdTimer = 0
                break
            end
        end
        if holdTimer >= holdTime then
            humanoid.WalkSpeed = boostSpeed
            task.wait(boostTime)
            humanoid.WalkSpeed = 16 -- your default walkspeed
        end
    end
end)

