-- Roblox MM2 Modern UI Script (Fixed WalkSpeed / PID Hack, Tabs, ESP, Aimbot, Flight, Fling, Non-TP Fast Farm, Noclip & Infinite Jump)
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

getgenv().espEnabled = getgenv().espEnabled or false
getgenv().flightEnabled = getgenv().flightEnabled or false
getgenv().aimbotEnabled = getgenv().aimbotEnabled or false
getgenv().flingMurdererEnabled = getgenv().flingMurdererEnabled or false
getgenv().flingSheriffEnabled = getgenv().flingSheriffEnabled or false
getgenv().autoFarmEnabled = getgenv().autoFarmEnabled or false
getgenv().noclipEnabled = getgenv().noclipEnabled or false
getgenv().infiniteJumpEnabled = getgenv().infiniteJumpEnabled or false
getgenv().customSpeed = getgenv().customSpeed or 32
getgenv().walkSpeedEnabled = getgenv().walkSpeedEnabled or false
getgenv().walkSpeedValue = getgenv().walkSpeedValue or 24

if CoreGui:FindFirstChild("MM2ModernPanel") then
    CoreGui.MM2ModernPanel:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MM2ModernPanel"
ScreenGui.Parent = CoreGui

-- Modern Floating Open/Close Button
local ToggleButton = Instance.new("TextButton")
ToggleButton.Size = UDim2.new(0, 50, 0, 50)
ToggleButton.Position = UDim2.new(0, 15, 0.35, 0)
ToggleButton.BackgroundColor3 = Color3.fromRGB(24, 24, 32)
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.TextSize = 14
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.Text = "MM2"
ToggleButton.Active = true
ToggleButton.Draggable = true
ToggleButton.Parent = ScreenGui

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 12)
ToggleCorner.Parent = ToggleButton

local ToggleStroke = Instance.new("UIStroke")
ToggleStroke.Color = Color3.fromRGB(114, 137, 218)
ToggleStroke.Thickness = 2
ToggleStroke.Parent = ToggleButton

-- Main Window Frame
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 460, 0, 320)
MainFrame.Position = UDim2.new(0.5, -230, 0.5, -160)
MainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 10)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(45, 45, 60)
MainStroke.Thickness = 1.5
MainStroke.Parent = MainFrame

-- Top Bar / Header
local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 40)
Header.BackgroundColor3 = Color3.fromRGB(24, 24, 32)
Header.BorderSizePixel = 0
Header.Parent = MainFrame

local HeaderCorner = Instance.new("UICorner")
HeaderCorner.CornerRadius = UDim.new(0, 10)
HeaderCorner.Parent = Header

local HeaderCover = Instance.new("Frame")
HeaderCover.Size = UDim2.new(1, 0, 0, 10)
HeaderCover.Position = UDim2.new(0, 0, 1, -10)
HeaderCover.BackgroundColor3 = Color3.fromRGB(24, 24, 32)
HeaderCover.BorderSizePixel = 0
HeaderCover.Parent = Header

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0, 200, 1, 0)
Title.Position = UDim2.new(0, 15, 0, 0)
Title.BackgroundTransparency = 1
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 15
Title.Font = Enum.Font.GothamBold
Title.Text = "MM2 Hub <font color='#7289da'>v2.3</font>"
Title.RichText = true
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Header

-- Tab Selection Container
local TabContainer = Instance.new("Frame")
TabContainer.Size = UDim2.new(0, 120, 1, -45)
TabContainer.Position = UDim2.new(0, 0, 0, 45)
TabContainer.BackgroundColor3 = Color3.fromRGB(22, 22, 30)
TabContainer.BorderSizePixel = 0
TabContainer.Parent = MainFrame

local TabListLayout = Instance.new("UIListLayout")
TabListLayout.SortOrder = Enum.SortOrder.LayoutOrder
TabListLayout.Padding = UDim.new(0, 6)
TabListLayout.Parent = TabContainer

local TabPadding = Instance.new("UIPadding")
TabPadding.PaddingTop = UDim.new(0, 10)
TabPadding.PaddingLeft = UDim.new(0, 10)
TabPadding.PaddingRight = UDim.new(0, 10)
TabPadding.Parent = TabContainer

-- Content Pages Container
local PagesContainer = Instance.new("Frame")
PagesContainer.Size = UDim2.new(1, -130, 1, -55)
PagesContainer.Position = UDim2.new(0, 125, 0, 50)
PagesContainer.BackgroundTransparency = 1
PagesContainer.Parent = MainFrame

local Tabs = {}
local Pages = {}

local function createTab(name, order)
    local TabButton = Instance.new("TextButton")
    TabButton.Size = UDim2.new(1, 0, 0, 32)
    TabButton.BackgroundColor3 = Color3.fromRGB(30, 30, 42)
    TabButton.TextColor3 = Color3.fromRGB(160, 160, 180)
    TabButton.TextSize = 12
    TabButton.Font = Enum.Font.GothamSemibold
    TabButton.Text = name
    TabButton.LayoutOrder = order
    TabButton.Parent = TabContainer

    local BtnCorner = Instance.new("UICorner")
    BtnCorner.CornerRadius = UDim.new(0, 6)
    BtnCorner.Parent = TabButton

    local Page = Instance.new("ScrollingFrame")
    Page.Size = UDim2.new(1, 0, 1, 0)
    Page.BackgroundTransparency = 1
    Page.BorderSizePixel = 0
    Page.CanvasSize = UDim2.new(0, 0, 0, 0)
    Page.ScrollBarThickness = 3
    Page.Visible = false
    Page.Parent = PagesContainer

    local PageLayout = Instance.new("UIListLayout")
    PageLayout.SortOrder = Enum.SortOrder.LayoutOrder
    PageLayout.Padding = UDim.new(0, 8)
    PageLayout.Parent = Page

    local PagePadding = Instance.new("UIPadding")
    PagePadding.PaddingRight = UDim.new(0, 5)
    PagePadding.Parent = Page

    PageLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        Page.CanvasSize = UDim2.new(0, 0, 0, PageLayout.AbsoluteContentSize.Y + 10)
    end)

    table.insert(Tabs, {Button = TabButton, Page = Page})
    return TabButton, Page
end

local tab1Btn, tab1Page = createTab("Главная", 1)
local tab2Btn, tab2Page = createTab("Фарм & Флинг", 2)
local tab3Btn, tab3Page = createTab("Разработчики", 3)

local function switchTab(selectedTab)
    for _, tab in ipairs(Tabs) do
        if tab.Page == selectedTab then
            tab.Page.Visible = true
            TweenService:Create(tab.Button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(114, 137, 218), TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
        else
            tab.Page.Visible = false
            TweenService:Create(tab.Button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(30, 30, 42), TextColor3 = Color3.fromRGB(160, 160, 180)}):Play()
        end
    end
end

tab1Btn.MouseButton1Click:Connect(function() switchTab(tab1Page) end)
tab2Btn.MouseButton1Click:Connect(function() switchTab(tab2Page) end)
tab3Btn.MouseButton1Click:Connect(function() switchTab(tab3Page) end)
switchTab(tab1Page)

-- Modern Toggle Button Builder
local function createToggle(parent, text, initialState, callback)
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(1, 0, 0, 36)
    Button.BackgroundColor3 = Color3.fromRGB(26, 26, 36)
    Button.TextColor3 = Color3.fromRGB(220, 220, 240)
    Button.TextSize = 13
    Button.Font = Enum.Font.GothamMedium
    Button.Text = "  " .. text
    Button.TextXAlignment = Enum.TextXAlignment.Left
    Button.Parent = parent

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 6)
    Corner.Parent = Button

    local Indicator = Instance.new("Frame")
    Indicator.Size = UDim2.new(0, 12, 0, 12)
    Indicator.Position = UDim2.new(1, -24, 0.5, -6)
    Indicator.BackgroundColor3 = initialState and Color3.fromRGB(50, 200, 100) or Color3.fromRGB(200, 60, 60)
    Indicator.Parent = Button

    local IndCorner = Instance.new("UICorner")
    IndCorner.CornerRadius = UDim.new(1, 0)
    IndCorner.Parent = Indicator

    local state = initialState
    Button.MouseButton1Click:Connect(function()
        state = not state
        Indicator.BackgroundColor3 = state and Color3.fromRGB(50, 200, 100) or Color3.fromRGB(200, 60, 60)
        callback(state)
    end)

    return Button
end

-- Speed Input UI Builder
local function createSpeedInput(parent, text, defaultVal, callback)
    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(1, 0, 0, 46)
    Frame.BackgroundColor3 = Color3.fromRGB(26, 26, 36)
    Frame.Parent = parent

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 6)
    Corner.Parent = Frame

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(0.6, 0, 1, 0)
    Label.Position = UDim2.new(0, 10, 0, 0)
    Label.BackgroundTransparency = 1
    Label.TextColor3 = Color3.fromRGB(220, 220, 240)
    Label.TextSize = 13
    Label.Font = Enum.Font.GothamMedium
    Label.Text = text
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Frame

    local TextBox = Instance.new("TextBox")
    TextBox.Size = UDim2.new(0.3, 0, 0, 26)
    TextBox.Position = UDim2.new(0.67, 0, 0.5, -13)
    TextBox.BackgroundColor3 = Color3.fromRGB(35, 35, 48)
    TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextBox.TextSize = 13
    TextBox.Font = Enum.Font.GothamBold
    TextBox.Text = tostring(defaultVal)
    TextBox.Parent = Frame

    local BoxCorner = Instance.new("UICorner")
    BoxCorner.CornerRadius = UDim.new(0, 4)
    BoxCorner.Parent = TextBox

    TextBox.FocusLost:Connect(function()
        local num = tonumber(TextBox.Text)
        if num then
            callback(num)
        else
            TextBox.Text = tostring(defaultVal)
        end
    end)
end

-- Populate Tab 1 (Главная)
createToggle(tab1Page, "ESP (Роли игроков)", getgenv().espEnabled, function(state)
    getgenv().espEnabled = state
end)

createToggle(tab1Page, "Smooth Aimbot (на Мардера)", getgenv().aimbotEnabled, function(state)
    getgenv().aimbotEnabled = state
end)

createToggle(tab1Page, "Flight (Полет по камере)", getgenv().flightEnabled, function(state)
    getgenv().flightEnabled = state
    if MobileFlightGui then
        MobileFlightGui.Enabled = state
    end
end)

createToggle(tab1Page, "Infinite Jump (Бесконечный прыжок)", getgenv().infiniteJumpEnabled, function(state)
    getgenv().infiniteJumpEnabled = state
end)

createToggle(tab1Page, "Noclip (Хождение сквозь стены)", getgenv().noclipEnabled, function(state)
    getgenv().noclipEnabled = state
end)

createToggle(tab1Page, "Включить Спидхак (Ходьба)", getgenv().walkSpeedEnabled, function(state)
    getgenv().walkSpeedEnabled = state
end)

createSpeedInput(tab1Page, "Скорость ходьбы", getgenv().walkSpeedValue, function(val)
    getgenv().walkSpeedValue = val
end)

-- Populate Tab 2 (Фарм & Флинг)
createToggle(tab2Page, "Auto Coin Farm (Быстрый без ТП)", getgenv().autoFarmEnabled, function(state)
    getgenv().autoFarmEnabled = state
end)

createSpeedInput(tab2Page, "Скорость Фарма (ПиД Хак)", getgenv().customSpeed, function(val)
    getgenv().customSpeed = val
end)

createToggle(tab2Page, "Fling Murderer", getgenv().flingMurdererEnabled, function(state)
    getgenv().flingMurdererEnabled = state
end)

createToggle(tab2Page, "Fling Sheriff", getgenv().flingSheriffEnabled, function(state)
    getgenv().flingSheriffEnabled = state
end)

-- Populate Tab 3 (Разработчики)
local DevLabel = Instance.new("TextLabel")
DevLabel.Size = UDim2.new(1, 0, 0, 40)
DevLabel.BackgroundColor3 = Color3.fromRGB(26, 26, 36)
DevLabel.TextColor3 = Color3.fromRGB(114, 137, 218)
DevLabel.TextSize = 14
DevLabel.Font = Enum.Font.GothamBold
DevLabel.Text = "sanonaprivate"
DevLabel.Parent = tab3Page

local DevCorner = Instance.new("UICorner")
DevCorner.CornerRadius = UDim.new(0, 6)
DevCorner.Parent = DevLabel

ToggleButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

-- Mobile Flight Control GUI (Buttons for phone users)
local MobileFlightGui = Instance.new("ScreenGui")
MobileFlightGui.Name = "MM2MobileFlight"
MobileFlightGui.Enabled = false
MobileFlightGui.Parent = CoreGui

local UpBtn = Instance.new("TextButton")
UpBtn.Size = UDim2.new(0, 60, 0, 60)
UpBtn.Position = UDim2.new(1, -75, 0.4, -70)
UpBtn.BackgroundColor3 = Color3.fromRGB(24, 24, 32)
UpBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
UpBtn.TextSize = 18
UpBtn.Font = Enum.Font.GothamBold
UpBtn.Text = "UP"
UpBtn.Parent = MobileFlightGui

local UpCorner = Instance.new("UICorner")
UpCorner.CornerRadius = UDim.new(0, 12)
UpCorner.Parent = UpBtn

local DownBtn = Instance.new("TextButton")
DownBtn.Size = UDim2.new(0, 60, 0, 60)
DownBtn.Position = UDim2.new(1, -75, 0.4, 10)
DownBtn.BackgroundColor3 = Color3.fromRGB(24, 24, 32)
DownBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
DownBtn.TextSize = 16
DownBtn.Font = Enum.Font.GothamBold
DownBtn.Text = "DOWN"
DownBtn.Parent = MobileFlightGui

local DownCorner = Instance.new("UICorner")
DownCorner.CornerRadius = UDim.new(0, 12)
DownCorner.Parent = DownBtn

local movingUp = false
local movingDown = false

UpBtn.MouseButton1Down:Connect(function() movingUp = true end)
UpBtn.MouseButton1Up:Connect(function() movingUp = false end)

DownBtn.MouseButton1Down:Connect(function() movingDown = true end)
DownBtn.MouseButton1Up:Connect(function() movingDown = false end)

-- Infinite Jump Listener
UserInputService.JumpRequest:Connect(function()
    if getgenv().infiniteJumpEnabled then
        local character = LocalPlayer.Character
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end
    end
end)

-- Role Detection
local function getPlayerRole(player)
    local char = player.Character
    if not char then return "Innocent" end
    
    local humanoid = char:FindFirstChildOfClass("Humanoid")
    if not humanoid or humanoid.Health <= 0 then
        return "Innocent"
    end

    local backpack = player:FindFirstChild("Backpack")

    local function searchContainer(container)
        if not container then return nil end
        for _, item in ipairs(container:GetChildren()) do
            local n = item.Name
            if n == "Knife" or n == "CKnife" then
                return "Murderer"
            elseif n == "Gun" or n == "Revolver" or n == "CGun" then
                return "Sheriff"
            end
        end
        return nil
    end

    return searchContainer(char) or searchContainer(backpack) or "Innocent"
end

local function getPlayerRoleColor(player)
    local role = getPlayerRole(player)
    if role == "Murderer" then
        return Color3.fromRGB(255, 60, 60)
    elseif role == "Sheriff" then
        return Color3.fromRGB(60, 140, 255)
    else
        return Color3.fromRGB(60, 220, 100)
    end
end

-- ESP Loop
local function createEsp(player)
    if not Drawing then return end
    local box = Drawing.new("Square")
    box.Visible = false
    box.Thickness = 1.5
    box.Filled = false

    local connection
    connection = RunService.RenderStepped:Connect(function()
        if not getgenv().espEnabled or not box then
            box.Visible = false
            if not player or not player.Parent then
                box:Remove()
                connection:Disconnect()
            end
            return
        end

        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local rootPart = player.Character.HumanoidRootPart
            local vector, onScreen = Camera:WorldToViewportPoint(rootPart.Position)

            if onScreen then
                box.Color = getPlayerRoleColor(player)
                box.Size = Vector2.new(2000 / vector.Z, 3000 / vector.Z)
                box.Position = Vector2.new(vector.X - box.Size.X / 2, vector.Y - box.Size.Y / 2)
                box.Visible = true
            else
                box.Visible = false
            end
        else
            box.Visible = false
        end
    end)
end

for _, player in ipairs(Players:GetPlayers()) do
    if player ~= LocalPlayer then
        task.spawn(function() createEsp(player) end)
    end
end

Players.PlayerAdded:Connect(function(player)
    if player ~= LocalPlayer then
        task.spawn(function() createEsp(player) end)
    end
end)

-- Smooth Aimbot Loop
RunService.RenderStepped:Connect(function()
    if getgenv().aimbotEnabled then
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and getPlayerRole(player) == "Murderer" then
                local char = player.Character
                if char and (char:FindFirstChild("UpperTorso") or char:FindFirstChild("HumanoidRootPart")) then
                    local targetPart = char:FindFirstChild("UpperTorso") or char.HumanoidRootPart
                    local currentCFrame = Camera.CFrame
                    local targetCFrame = CFrame.new(currentCFrame.Position, targetPart.Position)
                    Camera.CFrame = currentCFrame:Lerp(targetCFrame, 0.2)
                end
                break
            end
        end
    end
end)

-- Flight Logic (Universal Mobile & PC Joystick Support)
RunService.RenderStepped:Connect(function(dt)
    local character = LocalPlayer.Character
    if not character then return end
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not rootPart or not humanoid then return end

    if getgenv().flightEnabled then
        humanoid.PlatformStand = true
        
        for _, child in ipairs(rootPart:GetChildren()) do
            if child:IsA("BodyVelocity") or child:IsA("BodyGyro") or child:IsA("VectorForce") or child:IsA("AlignPosition") then
                child:Destroy()
            end
        end

        local camCFrame = Camera.CFrame
        local moveDir = Vector3.new()

        -- Keyboard controls (PC)
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveDir = moveDir + camCFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveDir = moveDir - camCFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveDir = moveDir - camCFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveDir = moveDir + camCFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) or movingUp then moveDir = moveDir + Vector3.new(0, 1, 0) end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) or movingDown then moveDir = moveDir - Vector3.new(0, 1, 0) end

        -- Mobile Thumbstick / MoveDirection integration
        if humanoid.MoveDirection.Magnitude > 0 then
            local flatMove = Vector3.new(camCFrame.LookVector.X, 0, camCFrame.LookVector.Z).Unit
            local flatRight = Vector3.new(camCFrame.RightVector.X, 0, camCFrame.RightVector.Z).Unit
            moveDir = moveDir + (flatMove * humanoid.MoveDirection.Z) + (flatRight * humanoid.MoveDirection.X)
        end

        if moveDir.Magnitude > 0 then
            moveDir = moveDir.Unit
        end

        local speed = 50
        rootPart.Velocity = moveDir * speed
        rootPart.CFrame = CFrame.new(rootPart.Position + (moveDir * speed * dt), rootPart.Position + camCFrame.LookVector * 10)
    else
        if humanoid.PlatformStand then
            humanoid.PlatformStand = false
        end
        movingUp = false
        movingDown = false
    end
end)

-- Fling Function Logic
local function runFling(targetRole)
    local localChar = LocalPlayer.Character
    if not localChar or not localChar:FindFirstChild("HumanoidRootPart") or not localChar:FindFirstChildOfClass("Humanoid") then return end
    
    local myRoot = localChar.HumanoidRootPart
    local humanoid = localChar:FindFirstChildOfClass("Humanoid")

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and getPlayerRole(player) == targetRole then
            local char = player.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                local targetRoot = char.HumanoidRootPart
                humanoid.PlatformStand = true
                local randomOffset = Vector3.new(math.random(-2, 2), math.random(1, 3), math.random(-2, 2))
                myRoot.CFrame = targetRoot.CFrame + randomOffset
                myRoot.AssemblyLinearVelocity = Vector3.new(99999, 99999, 99999)
                myRoot.AssemblyAngularVelocity = Vector3.new(99999, 99999, 99999)
            end
            break
        end
    end
end

RunService.Heartbeat:Connect(function()
    if getgenv().flingMurdererEnabled then
        runFling("Murderer")
    end
end)

RunService.Heartbeat:Connect(function()
    if getgenv().flingSheriffEnabled then
        runFling("Sheriff")
    end
end)

-- Noclip Toggle Control
RunService.Stepped:Connect(function()
    local character = LocalPlayer.Character
    if not character then return end
    
    if getgenv().noclipEnabled then
        for _, part in ipairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    else
        for _, part in ipairs(character:GetDescendants()) do
            if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                part.CanCollide = true
            end
        end
    end
end)

-- Fixed Speed Hack Loop (Bypasses anti-cheat/game overrides using Heartbeat)
RunService.Heartbeat:Connect(function()
    local character = LocalPlayer.Character
    if not character then return end
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not humanoid then return end

    if not getgenv().autoFarmEnabled then
        if getgenv().walkSpeedEnabled then
            humanoid.WalkSpeed = getgenv().walkSpeedValue or 24
        else
            humanoid.WalkSpeed = 16
        end
    end
end)

-- Non-TP Fast Coin Farm with Adjustable Speed
RunService.Stepped:Connect(function()
    local character = LocalPlayer.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") or not character:FindFirstChildOfClass("Humanoid") then return end
    local rootPart = character.HumanoidRootPart
    local humanoid = character:FindFirstChildOfClass("Humanoid")

    if getgenv().autoFarmEnabled then
        pcall(function()
            local closestCoin = nil
            local shortestDist = math.huge

            for _, mapChild in ipairs(workspace:GetChildren()) do
                if mapChild.Name == "CoinContainer" or mapChild.Name == "NormalCoin" or mapChild.Name == "Coins" or mapChild.Name == "CoinVisual" then
                    for _, coin in ipairs(mapChild:GetDescendants()) do
                        if coin:IsA("BasePart") then
                            local dist = (rootPart.Position - coin.Position).Magnitude
                            if dist < shortestDist then
                                shortestDist = dist
                                closestCoin = coin
                            end
                        end
                    end
                end
            end

            if not closestCoin then
                for _, descendant in ipairs(workspace:GetDescendants()) do
                    if descendant.Name == "CoinVisual" or (descendant.Name == "HumanoidRootPart" and descendant.Parent and descendant.Parent.Name == "Coin") then
                        local targetPart = descendant:IsA("Model") and descendant.PrimaryPart or descendant
                        if targetPart and targetPart:IsA("BasePart") then
                            local dist = (rootPart.Position - targetPart.Position).Magnitude
                            if dist < shortestDist then
                                shortestDist = dist
                                closestCoin = targetPart
                            end
                        end
                    end
                end
            end

            if closestCoin then
                humanoid.WalkSpeed = getgenv().customSpeed or 32
                humanoid:MoveTo(closestCoin.Position)
            else
                humanoid.WalkSpeed = 16
            end
        end)
    end
end)
