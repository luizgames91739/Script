-- 🌍 Speed Boost GUI completo com notificações, tags e controle PC/Mobile
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")

local player = Players.LocalPlayer

-- CONFIGURAÇÃO DO DONO
local OWNER_USERID = 5572753034 -- Seu UserId

-- Função para criar notificações estilo Roblox
local function notificar(msg, tempo)
    StarterGui:SetCore("SendNotification", {
        Title = "Leviathan Hub";
        Text = msg;
        Duration = tempo;
    })
end

-- ===== Função de criar GUI =====
local function criarGUI()
    local playerGui = player:WaitForChild("PlayerGui")

    if playerGui:FindFirstChild("SpeedBoostGui") then
        playerGui.SpeedBoostGui:Destroy()
    end

    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "SpeedBoostGui"
    screenGui.Parent = playerGui
    screenGui.ResetOnSpawn = false

    local isMobile = UserInputService.TouchEnabled
    local hubOpen = false

    -- ===== BOTÃO MOBILE =====
    local hubBtn
    if isMobile then
        hubBtn = Instance.new("TextButton")
        hubBtn.Name = "HubButton"
        hubBtn.Size = UDim2.new(0, 90, 0, 32)
        hubBtn.Position = UDim2.new(0, 10, 0, 10)
        hubBtn.BackgroundColor3 = Color3.fromRGB(30,30,30)
        hubBtn.BackgroundTransparency = 0.3
        hubBtn.BorderSizePixel = 0
        hubBtn.Text = "🌍 Hub"
        hubBtn.Font = Enum.Font.Gotham
        hubBtn.TextSize = 16
        hubBtn.TextColor3 = Color3.fromRGB(240,240,240)
        hubBtn.Parent = screenGui

        local hubStroke = Instance.new("UIStroke")
        hubStroke.Thickness = 2
        hubStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        hubStroke.Parent = hubBtn
    end

    -- ===== PAINEL =====
    local main = Instance.new("Frame")
    main.Name = "Main"
    main.AnchorPoint = Vector2.new(0.5,0.5)
    main.Position = UDim2.new(0.5, 0, 0.5, 0)
    main.Size = UDim2.new(0, 380, 0, 230)
    main.BackgroundTransparency = 1
    main.Visible = false
    main.Parent = screenGui

    local panel = Instance.new("Frame")
    panel.Size = UDim2.new(1,0,1,0)
    panel.BackgroundColor3 = Color3.fromRGB(18,18,20)
    panel.BackgroundTransparency = 0.3
    panel.BorderSizePixel = 0
    panel.Parent = main

    local stroke = Instance.new("UIStroke")
    stroke.Thickness = 2
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    stroke.Parent = panel

    -- ===== TÍTULO =====
    local titleBtn = Instance.new("TextButton")
    titleBtn.Name = "Title"
    titleBtn.Size = UDim2.new(1, -16, 0, 36)
    titleBtn.Position = UDim2.new(0, 8, 0, 8)
    titleBtn.BackgroundTransparency = 1
    titleBtn.Text = "⚡ Speed Boost"
    titleBtn.Font = Enum.Font.Gotham
    titleBtn.TextSize = 20
    titleBtn.TextXAlignment = Enum.TextXAlignment.Left
    titleBtn.TextColor3 = Color3.fromRGB(240,240,240)
    titleBtn.AutoButtonColor = false
    titleBtn.Parent = panel

    -- ===== STATUS =====
    local status = Instance.new("TextLabel")
    status.Name = "Status"
    status.Size = UDim2.new(0.4, 0, 0, 20)
    status.AnchorPoint = Vector2.new(1,0)
    status.Position = UDim2.new(1, -8, 0, 8)
    status.BackgroundTransparency = 1
    status.Text = ""
    status.Font = Enum.Font.Gotham
    status.TextSize = 14
    status.TextColor3 = Color3.fromRGB(220,220,220)
    status.TextXAlignment = Enum.TextXAlignment.Right
    status.TextYAlignment = Enum.TextYAlignment.Center
    status.Parent = panel

    -- ===== TEXTO VELOCIDADE =====
    local speedStatus = Instance.new("TextLabel")
    speedStatus.Name = "SpeedStatus"
    speedStatus.Size = UDim2.new(1, -16, 0, 20)
    speedStatus.Position = UDim2.new(0, 8, 0, 44)
    speedStatus.BackgroundTransparency = 1
    speedStatus.Font = Enum.Font.Gotham
    speedStatus.TextSize = 14
    speedStatus.TextColor3 = Color3.fromRGB(220,220,220)
    speedStatus.TextXAlignment = Enum.TextXAlignment.Left
    speedStatus.Text = "Velocidade: 16"
    speedStatus.Parent = panel

    -- ===== SLIDER =====
    local sliderFrame = Instance.new("Frame")
    sliderFrame.Name = "SliderFrame"
    sliderFrame.Size = UDim2.new(1, -16, 0, 8)
    sliderFrame.Position = UDim2.new(0, 8, 0, 128)
    sliderFrame.BackgroundColor3 = Color3.fromRGB(60,60,60)
    sliderFrame.BorderSizePixel = 0
    sliderFrame.Parent = panel

    local sliderDot = Instance.new("TextButton")
    sliderDot.Name = "SliderDot"
    sliderDot.Size = UDim2.new(0, 20, 0, 20)
    sliderDot.AnchorPoint = Vector2.new(0.5, 0.5)
    sliderDot.Position = UDim2.new(0, 0, 0.5, 0)
    sliderDot.BackgroundTransparency = 1
    sliderDot.Text = "⚪"
    sliderDot.Font = Enum.Font.Gotham
    sliderDot.TextSize = 24
    sliderDot.TextColor3 = Color3.fromRGB(255,255,255)
    sliderDot.AutoButtonColor = false
    sliderDot.Parent = sliderFrame

    local sliderValue = Instance.new("TextLabel")
    sliderValue.Name = "SliderValue"
    sliderValue.Size = UDim2.new(0, 80, 0, 20)
    sliderValue.AnchorPoint = Vector2.new(0.5, 1)
    sliderValue.Position = UDim2.new(0.5, 0, 0, -4)
    sliderValue.BackgroundTransparency = 1
    sliderValue.Font = Enum.Font.GothamBold
    sliderValue.TextSize = 14
    sliderValue.Text = "| 16 |"
    sliderValue.TextColor3 = Color3.fromRGB(255,255,255)
    sliderValue.Parent = sliderDot

    -- ===== BOTÕES =====
    local execBtn = Instance.new("TextButton")
    execBtn.Name = "Execute"
    execBtn.Size = UDim2.new(0.46, -8, 0, 36)
    execBtn.Position = UDim2.new(0, 8, 0, 162)
    execBtn.BackgroundColor3 = Color3.fromRGB(38,38,38)
    execBtn.BackgroundTransparency = 0.55
    execBtn.BorderSizePixel = 0
    execBtn.Text = "Executar"
    execBtn.Font = Enum.Font.Gotham
    execBtn.TextSize = 16
    execBtn.TextColor3 = Color3.fromRGB(245,245,245)
    execBtn.Parent = panel

    local resetBtn = Instance.new("TextButton")
    resetBtn.Name = "Reset"
    resetBtn.Size = UDim2.new(0.46, -8, 0, 36)
    resetBtn.Position = UDim2.new(0.5, 0, 0, 162)
    resetBtn.BackgroundColor3 = Color3.fromRGB(38,38,38)
    resetBtn.BackgroundTransparency = 0.55
    resetBtn.BorderSizePixel = 0
    resetBtn.Text = "Reset Speed"
    resetBtn.Font = Enum.Font.Gotham
    resetBtn.TextSize = 16
    resetBtn.TextColor3 = Color3.fromRGB(245,245,245)
    resetBtn.Parent = panel

    -- ===== LÓGICA SLIDER =====
    local MIN_SPEED, MAX_SPEED = 16, 250
    local currentSpeed = MIN_SPEED
    local dragging = false
    local dragInput = nil
    local defaultWalkSpeed = 16

    if player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
        defaultWalkSpeed = player.Character:FindFirstChildOfClass("Humanoid").WalkSpeed or 16
    end
    player.CharacterAdded:Connect(function(char)
        local hum = char:WaitForChild("Humanoid", 5)
        if hum then defaultWalkSpeed = hum.WalkSpeed or 16 end
    end)

    local function updateSliderFromX(absX)
        local absPos = sliderFrame.AbsolutePosition.X
        local width = math.max(1, sliderFrame.AbsoluteSize.X)
        local rel = math.clamp(absX - absPos, 0, width)
        sliderDot.Position = UDim2.new(0, rel, 0.5, 0)
        local speed = math.floor(MIN_SPEED + (rel / width) * (MAX_SPEED - MIN_SPEED) + 0.5)
        currentSpeed = speed
        sliderValue.Text = "| " .. tostring(speed) .. " |"
        speedStatus.Text = "Velocidade: " .. tostring(speed)
    end

    sliderDot.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragInput = input
            updateSliderFromX(input.Position.X)
        end
    end)
    sliderDot.InputEnded:Connect(function(input)
        if input == dragInput then
            dragging = false
            dragInput = nil
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            updateSliderFromX(input.Position.X)
        end
    end)

    -- ===== EXECUTAR =====
    execBtn.MouseButton1Click:Connect(function()
        if player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
            player.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = currentSpeed
        end
        status.Text = "Velocidade aplicada: " .. tostring(currentSpeed)
        task.delay(2, function() status.Text = "" end)
    end)

    resetBtn.MouseButton1Click:Connect(function()
        if player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
            player.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = defaultWalkSpeed
        end
        currentSpeed = defaultWalkSpeed
        sliderValue.Text = "| " .. tostring(currentSpeed) .. " |"
        speedStatus.Text = "Velocidade: " .. tostring(currentSpeed)
        sliderDot.Position = UDim2.new(0, 0, 0.5, 0)
        status.Text = "Velocidade resetada"
        task.delay(2, function() status.Text = "" end)
    end)

    -- ===== ABRIR/FECHAR HUB =====
    local function toggleHub()
        hubOpen = not hubOpen
        main.Visible = hubOpen
    end

    if isMobile and hubBtn then
        hubBtn.MouseButton1Click:Connect(toggleHub)
    else
        -- PC: L ou K
        UserInputService.InputBegan:Connect(function(input, gpe)
            if gpe then return end
            if input.UserInputType == Enum.UserInputType.Keyboard then
                if input.KeyCode == Enum.KeyCode.L or input.KeyCode == Enum.KeyCode.K then
                    toggleHub()
                end
            end
        end)
    end

    -- ===== ANIMAÇÃO RGB =====
    local hue = 0
    RunService.RenderStepped:Connect(function()
        hue = (hue + 0.02) % 1
        local color = Color3.fromHSV(hue, 0.9, 0.9)
        stroke.Color = color
        if hubBtn then hubBtn.UIStroke.Color = color end
        sliderValue.TextColor3 = color
    end)
end

-- ===== TAG ACIMA DA CABEÇA =====
local function setBillboard(plr)
    local char = plr.Character or plr.CharacterAdded:Wait()
    local head = char:WaitForChild("Head")
    if head:FindFirstChild("HubTag") then head.HubTag:Destroy() end

    local billboard = Instance.new("BillboardGui")
    billboard.Name = "HubTag"
    billboard.Size = UDim2.new(0, 200, 0, 50)
    billboard.StudsOffset = Vector3.new(0, 2.5, 0)
    billboard.AlwaysOnTop = true
    billboard.Parent = head

    local text = Instance.new("TextLabel")
    text.Size = UDim2.new(1, 0, 1, 0)
    text.BackgroundTransparency = 1
    text.Font = Enum.Font.GothamBold
    text.TextSize = 18
    text.TextStrokeTransparency = 0.5
    text.Parent = billboard

    if plr.UserId == OWNER_USERID then
        text.Text = "👑 Owner 👑"
        text.TextColor3 = Color3.fromRGB(255, 215, 0)
    else
        text.Text = "📜 User 📜"
        text.TextColor3 = Color3.fromRGB(200, 200, 255)
    end
end

-- ===== EXECUÇÃO =====
notificar("✔️ Seu Hub está sendo executado 🌿", 2)
task.wait(2)
criarGUI()
setBillboard(player)
notificar("📜 Seu Hub está pronto ✔️", 2)
