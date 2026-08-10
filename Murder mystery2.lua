-- ==========================================================
-- MM2 Modern UI Script (Target Player Fling Added)
-- ==========================================================
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
getgenv().murdererAimbotEnabled = getgenv().murdererAimbotEnabled or false
getgenv().killAllMurdererEnabled = getgenv().killAllMurdererEnabled or false
getgenv().flingMurdererEnabled = getgenv().flingMurdererEnabled or false
getgenv().flingSheriffEnabled = getgenv().flingSheriffEnabled or false
getgenv().targetFlingEnabled = getgenv().targetFlingEnabled or false
getgenv().selectedTargetName = getgenv().selectedTargetName or ""
getgenv().autoFarmEnabled = getgenv().autoFarmEnabled or false
getgenv().noclipEnabled = getgenv().noclipEnabled or false
getgenv().infiniteJumpEnabled = getgenv().infiniteJumpEnabled or false
getgenv().tpGunEnabled = getgenv().tpGunEnabled or false
getgenv().spinbotEnabled = getgenv().spinbotEnabled or false
getgenv().swimWalkEnabled = getgenv().swimWalkEnabled or false
getgenv().customSpeed = getgenv().customSpeed or 32
getgenv().walkSpeedEnabled = getgenv().walkSpeedEnabled or false
getgenv().walkSpeedValue = getgenv().walkSpeedValue or 24

if CoreGui:FindFirstChild("MM2ModernPanel") then
    CoreGui.MM2ModernPanel:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MM2ModernPanel"
ScreenGui.Parent = CoreGui

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
Title.Size = UDim2.new(0, 220, 1, 0)
Title.Position = UDim2.new(0, 15, 0, 0)
Title.BackgroundTransparency = 1
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 15
Title.Font = Enum.Font.GothamBold
Title.Text = "MM2 Hub <font color='#7289da'>v3.2 TargetFling</font>"
Title.RichText = true
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Header

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
local tab2Btn, tab2Page = createTab("Фарм & ТП", 2)
local tab3Btn, tab3Page = createTab("Игроки", 3)
local tab4Btn, tab4Page = createTab("Авторы", 4)

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
tab4Btn.MouseButton1Click:Connect(function() switchTab(tab4Page) end)
switchTab(tab1Page)

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

createToggle(tab1Page, "ESP (Роли игроков)", getgenv().espEnabled, function(state) getgenv().espEnabled = state end)
createToggle(tab1Page, "Aimbot для Шерифа (На Мардера)", getgenv().aimbotEnabled, function(state) getgenv().aimbotEnabled = state end)
createToggle(tab1Page, "Aimbot для Мардера (На ближайшую цель)", getgenv().murdererAimbotEnabled, function(state) getgenv().murdererAimbotEnabled = state end)
createToggle(tab1Page, "Убить всех (Авто-телепорт для Мардера)", getgenv().killAllMurdererEnabled, function(state) getgenv().killAllMurdererEnabled = state end)
createToggle(tab1Page, "Flight (Полет по камере)", getgenv().flightEnabled, function(state)
    getgenv().flightEnabled = state
    if MobileFlightGui then MobileFlightGui.Enabled = state end
end)
createToggle(tab1Page, "Infinite Jump", getgenv().infiniteJumpEnabled, function(state) getgenv().infiniteJumpEnabled = state end)
createToggle(tab1Page, "Noclip", getgenv().noclipEnabled, function(state) 
    getgenv().noclipEnabled = state 
    if not state and LocalPlayer.Character then
        for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then part.CanCollide = true end
        end
    end
end)
createToggle(tab1Page, "Spinbot (Крутиться)", getgenv().spinbotEnabled, function(state) getgenv().spinbotEnabled = state end)
createToggle(tab1Page, "Свим-Флай (Плавание с полетом)", getgenv().swimWalkEnabled, function(state) getgenv().swimWalkEnabled = state end)
createToggle(tab1Page, "Спидхак (Ходьба)", getgenv().walkSpeedEnabled, function(state) getgenv().walkSpeedEnabled = state end)
createSpeedInput(tab1Page, "Скорость ходьбы", getgenv().walkSpeedValue, function(val) getgenv().walkSpeedValue = val end)

createToggle(tab2Page, "Auto Coin Farm", getgenv().autoFarmEnabled, function(state) getgenv().autoFarmEnabled = state end)
createSpeedInput(tab2Page, "Скорость Фарма", getgenv().customSpeed, function(val) getgenv().customSpeed = val end)
createToggle(tab2Page, "ТП к упавшему пистолету", getgenv().tpGunEnabled, function(state) getgenv().tpGunEnabled = state end)
createToggle(tab2Page, "Fling Murderer", getgenv().flingMurdererEnabled, function(state) getgenv().flingMurdererEnabled = state end)
createToggle(tab2Page, "Fling Sheriff", getgenv().flingSheriffEnabled, function(state) getgenv().flingSheriffEnabled = state end)

-- Динамический список игроков для выбора цели под Флинг
local TargetListContainer = Instance.new("ScrollingFrame")
TargetListContainer.Size = UDim2.new(1, 0, 1, 0)
TargetListContainer.BackgroundTransparency = 1
TargetListContainer.BorderSizePixel = 0
TargetListContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
TargetListContainer.ScrollBarThickness = 3
TargetListContainer.Parent = tab3Page

local TargetListLayout = Instance.new("UIListLayout")
TargetListLayout.SortOrder = Enum.SortOrder.LayoutOrder
TargetListLayout.Padding = UDim.new(0, 6)
TargetListLayout.Parent = TargetListContainer

TargetListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    TargetListContainer.CanvasSize = UDim2.new(0, 0, 0, TargetListLayout.AbsoluteContentSize.Y + 10)
end)

local function refreshPlayerList()
    for _, child in ipairs(TargetListContainer:GetChildren()) do
        if child:IsA("Frame") then child:Destroy() end
    end

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local pFrame = Instance.new("Frame")
            pFrame.Size = UDim2.new(1, 0, 0, 42)
            pFrame.BackgroundColor3 = Color3.fromRGB(26, 26, 36)
            pFrame.Parent = TargetListContainer
            Instance.new("UICorner", pFrame).CornerRadius = UDim.new(0, 6)

            local pLabel = Instance.new("TextLabel")
            pLabel.Size = UDim2.new(0.5, 0, 1, 0)
            pLabel.Position = UDim2.new(0, 10, 0, 0)
            pLabel.BackgroundTransparency = 1
            pLabel.TextColor3 = Color3.fromRGB(220, 220, 240)
            pLabel.TextSize = 13
            pLabel.Font = Enum.Font.GothamMedium
            pLabel.Text = player.Name
            pLabel.TextXAlignment = Enum.TextXAlignment.Left
            pLabel.Parent = pFrame

            local pFlingBtn = Instance.new("TextButton")
            pFlingBtn.Size = UDim2.new(0, 100, 0, 28)
            pFlingBtn.Position = UDim2.new(1, -110, 0.5, -14)
            pFlingBtn.BackgroundColor3 = getgenv().selectedTargetName == player.Name and Color3.fromRGB(50, 200, 100) or Color3.fromRGB(114, 137, 218)
            pFlingBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
            pFlingBtn.TextSize = 12
            pFlingBtn.Font = Enum.Font.GothamBold
            pFlingBtn.Text = getgenv().selectedTargetName == player.Name and "Флингуется" or "Выбрать"
            pFlingBtn.Parent = pFrame
            Instance.new("UICorner", pFlingBtn).CornerRadius = UDim.new(0, 4)

            pFlingBtn.MouseButton1Click:Connect(function()
                if getgenv().selectedTargetName == player.Name then
                    getgenv().selectedTargetName = ""
                    getgenv().targetFlingEnabled = false
                else
                    getgenv().selectedTargetName = player.Name
                    getgenv().targetFlingEnabled = true
                end
                refreshPlayerList()
            end)
        end
    end
end

Players.PlayerAdded:Connect(refreshPlayerList)
Players.PlayerRemoving:Connect(refreshPlayerList)
task.spawn(refreshPlayerList)

local function createDevLabel(devName)
    local DevLabel = Instance.new("TextLabel")
    DevLabel.Size = UDim2.new(1, 0, 0, 40)
    DevLabel.BackgroundColor3 = Color3.fromRGB(26, 26, 36)
    DevLabel.TextColor3 = Color3.fromRGB(114, 137, 218)
    DevLabel.TextSize = 14
    DevLabel.Font = Enum.Font.GothamBold
    DevLabel.Text = devName
    DevLabel.Parent = tab4Page
    local DevCorner = Instance.new("UICorner")
    DevCorner.CornerRadius = UDim.new(0, 6)
    DevCorner.Parent = DevLabel
end
createDevLabel("sanonaprivate")
createDevLabel("Darynlox32")

ToggleButton.MouseButton1Click:Connect(function() MainFrame.Visible = not MainFrame.Visible end)

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
Instance.new("UICorner", UpBtn).CornerRadius = UDim.new(0, 12)

local DownBtn = Instance.new("TextButton")
DownBtn.Size = UDim2.new(0, 60, 0, 60)
DownBtn.Position = UDim2.new(1, -75, 0.4, 10)
DownBtn.BackgroundColor3 = Color3.fromRGB(24, 24, 32)
DownBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
DownBtn.TextSize = 16
DownBtn.Font = Enum.Font.GothamBold
DownBtn.Text = "DOWN"
DownBtn.Parent = MobileFlightGui
Instance.new("UICorner", DownBtn).CornerRadius = UDim.new(0, 12)

local movingUp, movingDown = false, false
UpBtn.MouseButton1Down:Connect(function() movingUp = true end)
UpBtn.MouseButton1Up:Connect(function() movingUp = false end)
DownBtn.MouseButton1Down:Connect(function() movingDown = true end)
DownBtn.MouseButton1Up:Connect(function() movingDown = false end)

UserInputService.JumpRequest:Connect(function()
    if getgenv().infiniteJumpEnabled then
        local character = LocalPlayer.Character
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then humanoid:ChangeState(Enum.HumanoidStateType.Jumping) end
        end
    end
end)

local function getPlayerRole(player)
    local char = player.Character
    if not char then return "Innocent" end
    local humanoid = char:FindFirstChildOfClass("Humanoid")
    if not humanoid or humanoid.Health <= 0 then return "Innocent" end
    local backpack = player:FindFirstChild("Backpack")
    local function searchContainer(container)
        if not container then return nil end
        for _, item in ipairs(container:GetChildren()) do
            local n = item.Name
            if n == "Knife" or n == "CKnife" then return "Murderer"
            elseif n == "Gun" or n == "Revolver" or n == "CGun" then return "Sheriff" end
        end
        return nil
    end
    return searchContainer(char) or searchContainer(backpack) or "Innocent"
end

local function getPlayerRoleColor(player)
    local role = getPlayerRole(player)
    if role == "Murderer" then return Color3.fromRGB(255, 60, 60)
    elseif role == "Sheriff" then return Color3.fromRGB(60, 140, 255)
    else return Color3.fromRGB(60, 220, 100) end
end

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
            if not player or not player.Parent then box:Remove(); connection:Disconnect() end
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
    if player ~= LocalPlayer then task.spawn(function() createEsp(player) end) end
end
Players.PlayerAdded:Connect(function(player)
    if player ~= LocalPlayer then task.spawn(function() createEsp(player) end) end
end)

-- Aimbot для Шерифа
RunService.RenderStepped:Connect(function()
    if getgenv().aimbotEnabled then
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and getPlayerRole(player) == "Murderer" then
                local char = player.Character
                if char and (char:FindFirstChild("UpperTorso") or char:FindFirstChild("HumanoidRootPart")) then
                    local targetPart = char:FindFirstChild("UpperTorso") or char.HumanoidRootPart
                    local _, onScreen = Camera:WorldToViewportPoint(targetPart.Position)
                    if onScreen then
                        local origin = Camera.CFrame.Position
                        local direction = (targetPart.Position - origin)
                        local raycastParams = RaycastParams.new()
                        raycastParams.FilterType = RaycastParams.FilterType.Exclude
                        raycastParams.FilterDescendantsInstances = {LocalPlayer.Character, char}
                        
                        local raycastResult = workspace:Raycast(origin, direction, raycastParams)
                        if not raycastResult then
                            local currentCFrame = Camera.CFrame
                            Camera.CFrame = currentCFrame:Lerp(CFrame.new(currentCFrame.Position, targetPart.Position), 0.3)

                            pcall(function()
                                local backpack = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Backpack") or LocalPlayer:FindFirstChild("Backpack")
                                local equippedGun = LocalPlayer.Character and (LocalPlayer.Character:FindFirstChild("Gun") or LocalPlayer.Character:FindFirstChild("Revolver"))
                                
                                if not equippedGun and backpack then
                                    local gunItem = backpack:FindFirstChild("Gun") or backpack:FindFirstChild("Revolver")
                                    if gunItem and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
                                        LocalPlayer.Character.Humanoid:EquipTool(gunItem)
                                    end
                                end

                                equippedGun = LocalPlayer.Character and (LocalPlayer.Character:FindFirstChild("Gun") or LocalPlayer.Character:FindFirstChild("Revolver"))
                                if equippedGun then
                                    local shootRemote = equippedGun:FindFirstChild("Shoot") or equippedGun:FindFirstChild("Fire") or equippedGun:FindFirstChild("KnifeServer")
                                    if not shootRemote then
                                        for _, r in ipairs(equippedGun:GetDescendants()) do
                                            if r:IsA("RemoteEvent") or r:IsA("RemoteFunction") then
                                                shootRemote = r
                                                break
                                            end
                                        end
                                    end
                                    if not shootRemote then
                                        local re = game:GetService("ReplicatedStorage"):FindFirstChild("Remotes")
                                        if re then
                                            shootRemote = re:FindFirstChild("Gameplay") and re.Gameplay:FindFirstChild("Shoot") or re:FindFirstChild("Shoot")
                                        end
                                    end

                                    if shootRemote then
                                        if shootRemote:IsA("RemoteEvent") then
                                            shootRemote:FireServer(targetPart.Position)
                                        elseif shootRemote:IsA("RemoteFunction") then
                                            shootRemote:InvokeServer(targetPart.Position)
                                        end
                                    end
                                end
                            end)
                        end
                    end
                end
                break
            end
        end
    end
end)

-- Aimbot для Мардера
RunService.RenderStepped:Connect(function()
    if getgenv().murdererAimbotEnabled then
        if getPlayerRole(LocalPlayer) == "Murderer" then
            local closestTarget = nil
            local shortestDist = math.huge
            local myChar = LocalPlayer.Character
            if not myChar or not myChar:FindFirstChild("HumanoidRootPart") then return end
            local myRoot = myChar.HumanoidRootPart

            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                    local hum = player.Character:FindFirstChildOfClass("Humanoid")
                    if hum and hum.Health > 0 then
                        local dist = (myRoot.Position - player.Character.HumanoidRootPart.Position).Magnitude
                        if dist < shortestDist then
                            shortestDist = dist
                            closestTarget = player.Character.HumanoidRootPart
                        end
                    end
                end
            end

            if closestTarget then
                local currentCFrame = Camera.CFrame
                Camera.CFrame = currentCFrame:Lerp(CFrame.new(currentCFrame.Position, closestTarget.Position), 0.4)

                pcall(function()
                    local backpack = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Backpack") or LocalPlayer:FindFirstChild("Backpack")
                    local equippedKnife = myChar:FindFirstChild("Knife") or myChar:FindFirstChild("CKnife")
                    
                    if not equippedKnife and backpack then
                        local knifeItem = backpack:FindFirstChild("Knife") or backpack:FindFirstChild("CKnife")
                        if knifeItem and myChar:FindFirstChildOfClass("Humanoid") then
                            myChar.Humanoid:EquipTool(knifeItem)
                        end
                    end

                    equippedKnife = myChar:FindFirstChild("Knife") or myChar:FindFirstChild("CKnife")
                    if equippedKnife and shortestDist <= 15 then
                        local stabRemote = equippedKnife:FindFirstChild("KnifeServer") or equippedKnife:FindFirstChild("Stab") or equippedKnife:FindFirstChild("RemoteEvent")
                        if not stabRemote then
                            for _, r in ipairs(equippedKnife:GetDescendants()) do
                                if r:IsA("RemoteEvent") or r:IsA("RemoteFunction") then
                                    stabRemote = r
                                    break
                                end
                            end
                        end
                        if stabRemote then
                            if stabRemote:IsA("RemoteEvent") then
                                stabRemote:FireServer()
                            elseif stabRemote:IsA("RemoteFunction") then
                                stabRemote:InvokeServer()
                            end
                        end
                    end
                end)
            end
        end
    end
end)

task.spawn(function()
    while true do
        task.wait(0.2)
        if getgenv().killAllMurdererEnabled then
            pcall(function()
                if getPlayerRole(LocalPlayer) == "Murderer" then
                    local character = LocalPlayer.Character
                    if character and character:FindFirstChild("HumanoidRootPart") then
                        local rootPart = character.HumanoidRootPart
                        local backpack = LocalPlayer:FindFirstChild("Backpack")
                        local equippedKnife = character:FindFirstChild("Knife") or character:FindFirstChild("CKnife")
                        if not equippedKnife and backpack then
                            local knifeItem = backpack:FindFirstChild("Knife") or backpack:FindFirstChild("CKnife")
                            if knifeItem then
                                character.Humanoid:EquipTool(knifeItem)
                                equippedKnife = knifeItem
                            end
                        end
                        
                        for _, player in ipairs(Players:GetPlayers()) do
                            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                                local targetHumanoid = player.Character:FindFirstChildOfClass("Humanoid")
                                if targetHumanoid and targetHumanoid.Health > 0 then
                                    local targetRoot = player.Character.HumanoidRootPart
                                    rootPart.CFrame = targetRoot.CFrame * CFrame.new(0, 0, 1.5)
                                    
                                    local activeKnife = character:FindFirstChild("Knife") or character:FindFirstChild("CKnife")
                                    if activeKnife then
                                        local stabRemote = activeKnife:FindFirstChild("KnifeServer") or activeKnife:FindFirstChild("Stab") or activeKnife:FindFirstChild("RemoteEvent")
                                        if not stabRemote then
                                            for _, r in ipairs(activeKnife:GetDescendants()) do
                                                if r:IsA("RemoteEvent") or r:IsA("RemoteFunction") then
                                                    stabRemote = r
                                                    break
                                                end
                                            end
                                        end
                                        if not stabRemote then
                                            local re = game:GetService("ReplicatedStorage"):FindFirstChild("Remotes")
                                            if re then
                                                stabRemote = re:FindFirstChild("Gameplay") and re.Gameplay:FindFirstChild("Knife") or re:FindFirstChild("Stab")
                                            end
                                        end
                                        
                                        if stabRemote then
                                            if stabRemote:IsA("RemoteEvent") then
                                                stabRemote:FireServer()
                                            elseif stabRemote:IsA("RemoteFunction") then
                                                stabRemote:InvokeServer()
                                            end
                                        end
                                    end
                                    task.wait(0.15)
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)

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
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveDir = moveDir + camCFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveDir = moveDir - camCFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveDir = moveDir - camCFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveDir = moveDir + camCFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) or movingUp then moveDir = moveDir + Vector3.new(0, 1, 0) end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) or movingDown then moveDir = moveDir - Vector3.new(0, 1, 0) end

        if humanoid.MoveDirection.Magnitude > 0 then
            local flatMove = Vector3.new(camCFrame.LookVector.X, 0, camCFrame.LookVector.Z).Unit
            local flatRight = Vector3.new(camCFrame.RightVector.X, 0, camCFrame.RightVector.Z).Unit
            moveDir = moveDir + (flatMove * humanoid.MoveDirection.Z) + (flatRight * humanoid.MoveDirection.X)
        end
        if moveDir.Magnitude > 0 then moveDir = moveDir.Unit end
        local speed = 50
        rootPart.Velocity = moveDir * speed
        rootPart.CFrame = CFrame.new(rootPart.Position + (moveDir * speed * dt), rootPart.Position + camCFrame.LookVector * 10)
    else
        if humanoid.PlatformStand and not getgenv().swimWalkEnabled then humanoid.PlatformStand = false end
        movingUp, movingDown = false, false
    end
end)

RunService.RenderStepped:Connect(function()
    if getgenv().spinbotEnabled then
        local character = LocalPlayer.Character
        if character and character:FindFirstChild("HumanoidRootPart") then
            local rootPart = character.HumanoidRootPart
            rootPart.CFrame = rootPart.CFrame * CFrame.Angles(0, math.rad(35), 0)
        end
    end
end)

RunService.Heartbeat:Connect(function()
    local character = LocalPlayer.Character
    if not character then return end
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    if not humanoid or not rootPart then return end

    if getgenv().swimWalkEnabled then
        humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
        local camCFrame = Camera.CFrame
        local moveDir = Vector3.new()
        
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveDir = moveDir + camCFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveDir = moveDir - camCFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveDir = moveDir - camCFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveDir = moveDir + camCFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then moveDir = moveDir + Vector3.new(0, 1, 0) end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then moveDir = moveDir - Vector3.new(0, 1, 0) end

        if moveDir.Magnitude > 0 then
            moveDir = moveDir.Unit
            rootPart.Velocity = moveDir * 50
            rootPart.CFrame = CFrame.new(rootPart.Position, rootPart.Position + camCFrame.LookVector)
        else
            rootPart.Velocity = Vector3.new(0, 1, 0)
        end
    end
end)

local function runFling(targetRole)
    local localChar = LocalPlayer.Character
    if not localChar or not localChar:FindFirstChild("HumanoidRootPart") or not localChar:FindFirstChildOfClass("Humanoid") then return end
    local myRoot = localChar.HumanoidRootPart
    local humanoid = localChar:FindFirstChildOfClass("Humanoid")
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and getPlayerRole(player) == targetRole then
            local char = player.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                humanoid.PlatformStand = true
                myRoot.CFrame = char.HumanoidRootPart.CFrame + Vector3.new(math.random(-2,2), math.random(1,3), math.random(-2,2))
                myRoot.AssemblyLinearVelocity = Vector3.new(99999, 99999, 99999)
                myRoot.AssemblyAngularVelocity = Vector3.new(99999, 99999, 99999)
            end
            break
        end
    end
end

local function runTargetFling()
    if not getgenv().targetFlingEnabled or getgenv().selectedTargetName == "" then return end
    local localChar = LocalPlayer.Character
    if not localChar or not localChar:FindFirstChild("HumanoidRootPart") or not localChar:FindFirstChildOfClass("Humanoid") then return end
    local myRoot = localChar.HumanoidRootPart
    local humanoid = localChar:FindFirstChildOfClass("Humanoid")
    
    local targetPlayer = Players:FindFirstChild(getgenv().selectedTargetName)
    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
        humanoid.PlatformStand = true
        myRoot.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(math.random(-2,2), math.random(1,3), math.random(-2,2))
        myRoot.AssemblyLinearVelocity = Vector3.new(99999, 99999, 99999)
        myRoot.AssemblyAngularVelocity = Vector3.new(99999, 99999, 99999)
    end
end

RunService.Heartbeat:Connect(function()
    if getgenv().flingMurdererEnabled then runFling("Murderer") end
    if getgenv().flingSheriffEnabled then runFling("Sheriff") end
    if getgenv().targetFlingEnabled then runTargetFling() end
end)

RunService.Stepped:Connect(function()
    local character = LocalPlayer.Character
    if not character then return end
    if getgenv().noclipEnabled then
        for _, part in ipairs(character:GetDescendants()) do
            if part:IsA("BasePart") then part.CanCollide = false end
        end
    end
end)

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

RunService.Stepped:Connect(function()
    if not getgenv().tpGunEnabled then return end
    local character = LocalPlayer.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") then return end
    local rootPart = character.HumanoidRootPart

    pcall(function()
        for _, obj in ipairs(workspace:GetChildren()) do
            if obj.Name == "GunDrop" and obj:IsA("BasePart") then
                rootPart.CFrame = obj.CFrame + Vector3.new(0, 3, 0)
                break
            end
        end
        for _, desc in ipairs(workspace:GetDescendants()) do
            if desc.Name == "GunDrop" then
                local targetPart = desc:IsA("Model") and desc.PrimaryPart or desc
                if targetPart and targetPart:IsA("BasePart") then
                    rootPart.CFrame = targetPart.CFrame + Vector3.new(0, 3, 0)
                    break
                end
            end
        end
    end)
end)

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
                    local ok, children = pcall(function() return mapChild:GetDescendants() end)
                    if ok and children then
                        for _, coin in ipairs(children) do
                            if coin:IsA("BasePart") then
                                local dist = (rootPart.Position - coin.Position).Magnitude
                                if dist < shortestDist then shortestDist = dist; closestCoin = coin end
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
