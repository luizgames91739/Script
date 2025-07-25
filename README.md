local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
screenGui.Name = "SpeedHub"

local imageFrame = Instance.new("ImageLabel", screenGui)
imageFrame.Size = UDim2.new(0, 220, 0, 120)
imageFrame.Position = UDim2.new(0, 20, 0, 20)
imageFrame.BackgroundTransparency = 1
imageFrame.Image = "rbxassetid://6071575925"
imageFrame.ScaleType = Enum.ScaleType.Stretch

local speedLabel = Instance.new("TextLabel", imageFrame)
speedLabel.Size = UDim2.new(1, 0, 0.3, 0)
speedLabel.Position = UDim2.new(0, 0, 0, 0)
speedLabel.BackgroundTransparency = 1
speedLabel.TextColor3 = Color3.new(1, 1, 1)
speedLabel.TextScaled = true
speedLabel.Font = Enum.Font.GothamBold
speedLabel.Text = "Velocidade: 16"

local plusButton = Instance.new("TextButton", imageFrame)
plusButton.Size = UDim2.new(0.5, -5, 0.5, -10)
plusButton.Position = UDim2.new(0, 5, 0.5, 5)
plusButton.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
plusButton.TextColor3 = Color3.new(1, 1, 1)
plusButton.Font = Enum.Font.GothamBold
plusButton.TextScaled = true
plusButton.Text = "+1"

local minusButton = Instance.new("TextButton", imageFrame)
minusButton.Size = UDim2.new(0.5, -5, 0.5, -10)
minusButton.Position = UDim2.new(0.5, 0, 0.5, 5)
minusButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
minusButton.TextColor3 = Color3.new(1, 1, 1)
minusButton.Font = Enum.Font.GothamBold
minusButton.TextScaled = true
minusButton.Text = "-1"

local speed = 16
humanoid.WalkSpeed = speed

plusButton.MouseButton1Click:Connect(function()
	speed += 1
	humanoid.WalkSpeed = speed
	speedLabel.Text = "Velocidade: " .. speed
end)

minusButton.MouseButton1Click:Connect(function()
	speed = math.max(0, speed - 1)
	humanoid.WalkSpeed = speed
	speedLabel.Text = "Velocidade: " .. speed
end)