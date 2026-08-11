-- ==========================================================
-- MM2 Modern UI Script (Tracers Color Picker, Fixed Noclip, Touch Fling, Theme Customizer)
-- ==========================================================
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

getgenv().espEnabled = getgenv().espEnabled or false
getgenv().sheriffAimbotEnabled = getgenv().sheriffAimbotEnabled or false
getgenv().flightEnabled = getgenv().flightEnabled or false
getgenv().killAllMurdererEnabled = getgenv().killAllMurdererEnabled or false
getgenv().flingMurdererEnabled = getgenv().flingMurdererEnabled or false
getgenv().flingSheriffEnabled = getgenv().flingSheriffEnabled or false
getgenv().targetFlingEnabled = getgenv().targetFlingEnabled or false
getgenv().touchFlingEnabled = getgenv().touchFlingEnabled or false
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

-- Bunny Hop variables
getgenv().bhopEnabled = getgenv().bhopEnabled or false
getgenv().bhopSpeed = getgenv().bhopSpeed or 24

-- Skin Changer variables
getgenv().skinChangerActive = getgenv().skinChangerActive or false
getgenv().selectedKnifeMesh = getgenv().selectedKnifeMesh or ""
getgenv().selectedGunMesh = getgenv().selectedGunMesh or ""

-- Bullet Tracers variables
getgenv().bulletTracersEnabled = getgenv().bulletTracersEnabled or false
getgenv().tracerColorType = getgenv().tracerColorType or "Синий"

-- Theme Accent Customizer variables
getgenv().uiAccentColor = getgenv().uiAccentColor or Color3.fromRGB(114, 137, 218)
getgenv().btnAccentColor = getgenv().btnAccentColor or Color3.fromRGB(40, 40, 55)

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
ToggleStroke.Color = getgenv().uiAccentColor
ToggleStroke.Thickness = 2
ToggleStroke.Parent = ToggleButton

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 480, 0, 340)
MainFrame.Position = UDim2.new(0.5, -240, 0.5, -170)
MainFrame.BackgroundColor3 = Color3.fromRGB(16, 16, 22)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(45, 45, 60)
MainStroke.Thickness = 1.5
MainStroke.Parent = MainFrame

local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 45)
Header.BackgroundColor3 = Color3.fromRGB(22, 22, 30)
Header.BorderSizePixel = 0
Header.Parent = MainFrame

local HeaderCorner = Instance.new("UICorner")
HeaderCorner.CornerRadius = UDim.new(0, 12)
HeaderCorner.Parent = Header

local HeaderCover = Instance.new("Frame")
HeaderCover.Size = UDim2.new(1, 0, 0, 12)
HeaderCover.Position = UDim2.new(0, 0, 1, -12)
HeaderCover.BackgroundColor3 = Color3.fromRGB(22, 22, 30)
HeaderCover.BorderSizePixel = 0
HeaderCover.Parent = Header

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0, 300, 1, 0)
Title.Position = UDim2.new(0, 15, 0, 0)
Title.BackgroundTransparency = 1
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 15
Title.Font = Enum.Font.GothamBold
Title.Text = "MM2 Hub <font color='#7289da'>v5.0 Ultimate</font>"
Title.RichText = true
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Header

local TabContainer = Instance.new("Frame")
TabContainer.Size = UDim2.new(0, 130, 1, -50)
TabContainer.Position = UDim2.new(0, 0, 0, 48)
TabContainer.BackgroundColor3 = Color3.fromRGB(20, 20, 26)
TabContainer.BorderSizePixel = 0
TabContainer.Parent = MainFrame

local TabListLayout = Instance.new("UIListLayout")
TabListLayout.SortOrder = Enum.SortOrder.LayoutOrder
TabListLayout.Padding = UDim.new(0, 5)
TabListLayout.Parent = TabContainer

local TabPadding = Instance.new("UIPadding")
TabPadding.PaddingTop = UDim.new(0, 8)
TabPadding.PaddingLeft = UDim.new(0, 8)
TabPadding.PaddingRight = UDim.new(0, 8)
TabPadding.Parent = TabContainer

local PagesContainer = Instance.new("Frame")
PagesContainer.Size = UDim2.new(1, -140, 1, -55)
PagesContainer.Position = UDim2.new(0, 135, 0, 50)
PagesContainer.BackgroundTransparency = 1
PagesContainer.Parent = MainFrame

local Tabs = {}
local registeredButtons = {}
local registeredToggles = {}

local function createTab(name, order)
    local TabButton = Instance.new("TextButton")
    TabButton.Size = UDim2.new(1, 0, 0, 30)
    TabButton.BackgroundColor3 = Color3.fromRGB(28, 28, 38)
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
    table.insert(registeredButtons, TabButton)
    return TabButton, Page
end

local tab1Btn, tab1Page = createTab("Главная", 1)
local tab2Btn, tab2Page = createTab("Фарм & ТП", 2)
local tab3Btn, tab3Page = createTab("Игроки", 3)
local tab4Btn, tab4Page = createTab("Скинченджер", 4)
local tab5Btn, tab5Page = createTab("Тема гуи", 5)
local tab6Btn, tab6Page = createTab("Авторы", 6)

local function updateThemeColors()
    ToggleStroke.Color = getgenv().uiAccentColor
    for _, btn in ipairs(registeredButtons) do
        -- Check if it's currently selected tab button
        local isSelected = false
        for _, t in ipairs(Tabs) do
            if t.Button == btn and t.Page.Visible then
                isSelected = true
                break
            end
        end
        if isSelected then
            btn.BackgroundColor3 = getgenv().uiAccentColor
            btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        else
            btn.BackgroundColor3 = Color3.fromRGB(28, 28, 38)
            btn.TextColor3 = Color3.fromRGB(160, 160, 180)
        end
    end
    for _, item in ipairs(registeredToggles) do
        if item.IsActive() then
            item.Indicator.BackgroundColor3 = getgenv().uiAccentColor
        else
            item.Indicator.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
        end
        item.Frame.BackgroundColor3 = getgenv().btnAccentColor
    end
end

local function switchTab(selectedTab)
    for _, tab in ipairs(Tabs) do
        if tab.Page == selectedTab then
            tab.Page.Visible = true
            TweenService:Create(tab.Button, TweenInfo.new(0.2), {BackgroundColor3 = getgenv().uiAccentColor, TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
        else
            tab.Page.Visible = false
            TweenService:Create(tab.Button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(28, 28, 38), TextColor3 = Color3.fromRGB(160, 160, 180)}):Play()
        end
    end
end

tab1Btn.MouseButton1Click:Connect(function() switchTab(tab1Page) end)
tab2Btn.MouseButton1Click:Connect(function() switchTab(tab2Page) end)
tab3Btn.MouseButton1Click:Connect(function() switchTab(tab3Page) end)
tab4Btn.MouseButton1Click:Connect(function() switchTab(tab4Page) end)
tab5Btn.MouseButton1Click:Connect(function() switchTab(tab5Page) end)
tab6Btn.MouseButton1Click:Connect(function() switchTab(tab6Page) end)
switchTab(tab1Page)

local function createToggle(parent, text, initialState, callback)
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(1, 0, 0, 36)
    Button.BackgroundColor3 = getgenv().btnAccentColor
    Button.TextColor3 = Color3.fromRGB(220, 220, 240)
    Button.TextSize = 13
    Button.Font = Enum.Font.GothamMedium
    Button.Text = "  " .. text
    Button.TextXAlignment = Enum.TextXAlignment.Left
    Button.Parent = parent

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 6)
    Corner.Parent = Button

    local state = initialState
    local Indicator = Instance.new("Frame")
    Indicator.Size = UDim2.new(0, 12, 0, 12)
    Indicator.Position = UDim2.new(1, -24, 0.5, -6)
    Indicator.BackgroundColor3 = state and getgenv().uiAccentColor or Color3.fromRGB(200, 60, 60)
    Indicator.Parent = Button

    local IndCorner = Instance.new("UICorner")
    IndCorner.CornerRadius = UDim.new(1, 0)
    IndCorner.Parent = Indicator

    table.insert(registeredToggles, {
        Frame = Button,
        Indicator = Indicator,
        IsActive = function() return state end
    })

    Button.MouseButton1Click:Connect(function()
        state = not state
        Indicator.BackgroundColor3 = state and getgenv().uiAccentColor or Color3.fromRGB(200, 60, 60)
        callback(state)
    end)

    return Button
end

local function createSpeedInput(parent, text, defaultVal, callback)
    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(1, 0, 0, 46)
    Frame.BackgroundColor3 = getgenv().btnAccentColor
    Frame.Parent = parent
    table.insert(registeredToggles, {Frame = Frame, Indicator = {BackgroundColor3 = Color3.new()}, IsActive = function() return false end})

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 6)
    Corner.Parent = Frame

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(0.5, 0, 1, 0)
    Label.Position = UDim2.new(0, 10, 0, 0)
    Label.BackgroundTransparency = 1
    Label.TextColor3 = Color3.fromRGB(220, 220, 240)
    Label.TextSize = 12
    Label.Font = Enum.Font.GothamMedium
    Label.Text = text
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Frame

    local TextBox = Instance.new("TextBox")
    TextBox.Size = UDim2.new(0.4, 0, 0, 26)
    TextBox.Position = UDim2.new(0.57, 0, 0.5, -13)
    TextBox.BackgroundColor3 = Color3.fromRGB(35, 35, 48)
    TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextBox.TextSize = 11
    TextBox.Font = Enum.Font.GothamBold
    TextBox.Text = tostring(defaultVal)
    TextBox.Parent = Frame

    local BoxCorner = Instance.new("UICorner")
    BoxCorner.CornerRadius = UDim.new(0, 4)
    BoxCorner.Parent = TextBox

    TextBox.FocusLost:Connect(function()
        callback(TextBox.Text)
    end)
end

local function createDropdown(parent, text, options, currentOption, callback)
    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(1, 0, 0, 46)
    Frame.BackgroundColor3 = getgenv().btnAccentColor
    Frame.Parent = parent
    table.insert(registeredToggles, {Frame = Frame, Indicator = {BackgroundColor3 = Color3.new()}, IsActive = function() return false end})

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 6)
    Corner.Parent = Frame

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(0.5, 0, 1, 0)
    Label.Position = UDim2.new(0, 10, 0, 0)
    Label.BackgroundTransparency = 1
    Label.TextColor3 = Color3.fromRGB(220, 220, 240)
    Label.TextSize = 12
    Label.Font = Enum.Font.GothamMedium
    Label.Text = text
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Frame

    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(0.4, 0, 0, 26)
    Button.Position = UDim2.new(0.57, 0, 0.5, -13)
    Button.BackgroundColor3 = Color3.fromRGB(35, 35, 48)
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.TextSize = 11
    Button.Font = Enum.Font.GothamBold
    Button.Text = currentOption
    Button.Parent = Frame

    local BoxCorner = Instance.new("UICorner")
    BoxCorner.CornerRadius = UDim.new(0, 4)
    BoxCorner.Parent = Button

    local idx = 1
    for i, opt in ipairs(options) do
        if opt == currentOption then idx = i break end
    end

    Button.MouseButton1Click:Connect(function()
        idx = idx + 1
        if idx > #options then idx = 1 end
        local chosen = options[idx]
        Button.Text = chosen
        callback(chosen)
    end)
end

createToggle(tab1Page, "Chams ESP (Модельки игроков)", getgenv().espEnabled, function(state) getgenv().espEnabled = state end)
createToggle(tab1Page, "Аимбот на Мардера (для Шерифа)", getgenv().sheriffAimbotEnabled, function(state) getgenv().sheriffAimbotEnabled = state end)
createToggle(tab1Page, "Трейсеры пуль (Bullet Tracers)", getgenv().bulletTracersEnabled, function(state) getgenv().bulletTracersEnabled = state end)
createDropdown(tab1Page, "Цвет Трейсеров Пуль", {"Синий", "Красный", "Зеленый", "Радужный"}, getgenv().tracerColorType, function(val) getgenv().tracerColorType = val end)
createToggle(tab1Page, "Убить всех (Авто-телепорт для Мардера)", getgenv().killAllMurdererEnabled, function(state) getgenv().killAllMurdererEnabled = state end)
createToggle(tab1Page, "Flight (Полет по камере)", getgenv().flightEnabled, function(state)
    getgenv().flightEnabled = state
    if MobileFlightGui then MobileFlightGui.Enabled = state end
end)
createToggle(tab1Page, "Infinite Jump", getgenv().infiniteJumpEnabled, function(state) getgenv().infiniteJumpEnabled = state end)
createToggle(tab1Page, "Bunny Hop (Автопрыжок)", getgenv().bhopEnabled, function(state) getgenv().bhopEnabled = state end)
createSpeedInput(tab1Page, "Скорость Bunny Hop", getgenv().bhopSpeed, function(val) getgenv().bhopSpeed = tonumber(val) or 24 end)
createToggle(tab1Page, "Noclip", getgenv().noclipEnabled, function(state) 
    getgenv().noclipEnabled = state 
end)
createToggle(tab1Page, "Touch Fling (Флинг при касании)", getgenv().touchFlingEnabled, function(state) getgenv().touchFlingEnabled = state end)
createToggle(tab1Page, "Spinbot (Крутиться)", getgenv().spinbotEnabled, function(state) getgenv().spinbotEnabled = state end)
createToggle(tab1Page, "Свим-Флай (Плавание с полетом)", getgenv().swimWalkEnabled, function(state) getgenv().swimWalkEnabled = state end)
createToggle(tab1Page, "Спидхак (Ходьба)", getgenv().walkSpeedEnabled, function(state) getgenv().walkSpeedEnabled = state end)
createSpeedInput(tab1Page, "Скорость ходьбы", getgenv().walkSpeedValue, function(val) getgenv().walkSpeedValue = tonumber(val) or 24 end)

createToggle(tab2Page, "Auto Coin Farm", getgenv().autoFarmEnabled, function(state) getgenv().autoFarmEnabled = state end)
createSpeedInput(tab2Page, "Скорость Фарма", getgenv().customSpeed, function(val) getgenv().customSpeed = tonumber(val) or 32 end)
createToggle(tab2Page, "ТП к упавшему пистолету", getgenv().tpGunEnabled, function(state) getgenv().tpGunEnabled = state end)
createToggle(tab2Page, "Fling Murderer", getgenv().flingMurdererEnabled, function(state) getgenv().flingMurdererEnabled = state end)
createToggle(tab2Page, "Fling Sheriff", getgenv().flingSheriffEnabled, function(state) getgenv().flingSheriffEnabled = state end)

createToggle(tab4Page, "Включить Визуальный Скинченджер", getgenv().skinChangerActive, function(state) 
    getgenv().skinChangerActive = state 
end)
createSpeedInput(tab4Page, "Texture ID Ножа", getgenv().selectedKnifeMesh, function(val) getgenv().selectedKnifeMesh = val end)
createSpeedInput(tab4Page, "Texture ID Пистолета", getgenv().selectedGunMesh, function(val) getgenv().selectedGunMesh = val end)

-- TAB 5: THEME CUSTOMIZER (Выбор цвета ГУИ и кнопок)
local function createThemeColorButton(parent, text, accentColor, btnColor)
    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(1, 0, 0, 38)
    Btn.BackgroundColor3 = btnColor
    Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    Btn.TextSize = 13
    Btn.Font = Enum.Font.GothamBold
    Btn.Text = text
    Btn.Parent = parent
    Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 6)

    local stroke = Instance.new("UIStroke")
    stroke.Color = accentColor
    stroke.Thickness = 1.5
    stroke.Parent = Btn

    Btn.MouseButton1Click:Connect(function()
        getgenv().uiAccentColor = accentColor
        getgenv().btnAccentColor = btnColor
        updateThemeColors()
    end)
end

createThemeColorButton(tab5Page, "🌙 Классический Синий (Discord)", Color3.fromRGB(114, 137, 218), Color3.fromRGB(26, 26, 36))
createThemeColorButton(tab5Page, "🔥 Киберпанк (Неоновый Красный)", Color3.fromRGB(255, 50, 50), Color3.fromRGB(32, 20, 24))
createThemeColorButton(tab5Page, "🌿 Изумрудный (Зеленый Акцент)", Color3.fromRGB(50, 220, 120), Color3.fromRGB(20, 30, 24))
createThemeColorButton(tab5Page, "⚡ Фиолетовый Неон (Dark Purple)", Color3.fromRGB(170, 60, 255), Color3.fromRGB(28, 20, 36))
createThemeColorButton(tab5Page, "☀️ Золотой / Желтый Люкс", Color3.fromRGB(255, 200, 50), Color3.fromRGB(32, 28, 20))

-- Bullet Tracers Color logic
local function getTracerColor()
    local cType = getgenv().tracerColorType
    if cType == "Красный" then
        return Color3.fromRGB(255, 50, 50)
    elseif cType == "Зеленый" then
        return Color3.fromRGB(50, 255, 50)
    elseif cType == "Радужный" then
        return Color3.fromHSV(tick() % 5 / 5, 1, 1)
    else
        return Color3.fromRGB(60, 160, 255)
    end
end

local function createTracerBeam(startPos, endPos)
    if not getgenv().bulletTracersEnabled then return end
    pcall(function()
        local part = Instance.new("Part")
        part.Name = "BulletTracerLine"
        part.Anchored = true
        part.CanCollide = false
        part.Material = Enum.Material.Neon
        part.Color = getTracerColor()
        part.Transparency = 0.1
        
        local distance = (startPos - endPos).Magnitude
        part.Size = Vector3.new(0.12, 0.12, distance)
        part.CFrame = CFrame.new(startPos, endPos) * CFrame.new(0, 0, -distance / 2)
        part.Parent = workspace
        
        TweenService:Create(part, TweenInfo.new(0.35), {Transparency = 1, Size = Vector3.new(0, 0, distance)}):Play()
        task.delay(0.35, function()
            if part and part.Parent then part:Destroy() end
        end)
    end)
end

local function monitorCharacterGun(char)
    char.ChildAdded:Connect(function(tool)
        if tool:IsA("Tool") and (tool.Name == "Gun" or tool.Name == "Revolver" or tool.Name == "CGun") then
            tool.Activated:Connect(function()
                if getgenv().bulletTracersEnabled and char:FindFirstChild("HumanoidRootPart") then
                    local hrp = char.HumanoidRootPart
                    local origin = hrp.Position
                    local targetPos = origin + (Camera.CFrame.LookVector * 300)
                    
                    local raycastParams = RaycastParams.new()
                    raycastParams.FilterDescendantsInstances = {char, Camera}
                    raycastParams.FilterType = RaycastFilterType.Exclude
                    local result = workspace:Raycast(origin, Camera.CFrame.LookVector * 300, raycastParams)
                    if result then
                        targetPos = result.Position
                    end
                    
                    createTracerBeam(origin, targetPos)
                end
            end)
        end
    end)
end

LocalPlayer.CharacterAdded:Connect(monitorCharacterGun)
if LocalPlayer.Character then task.spawn(function() monitorCharacterGun(LocalPlayer.Character) end) end

for _, player in ipairs(Players:GetPlayers()) do
    player.CharacterAdded:Connect(function(char)
        monitorCharacterGun(char)
    end)
    if player.Character then task.spawn(function() monitorCharacterGun(player.Character) end) end
end

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(char)
        monitorCharacterGun(char)
    end)
end)

RunService.RenderStepped:Connect(function()
    if not getgenv().skinChangerActive then return end
    local char = LocalPlayer.Character
    if not char then return end
    
    pcall(function()
        local knife = char:FindFirstChild("Knife") or char:FindFirstChild("CKnife")
        if knife and getgenv().selectedKnifeMesh ~= "" then
            for _, desc in ipairs(knife:GetDescendants()) do
                if desc:IsA("SpecialMesh") or desc:IsA("FileMesh") then
                    if not desc:GetAttribute("OriginalTexture") then
                        desc:SetAttribute("OriginalTexture", desc.TextureId)
                    end
                    desc.TextureId = getgenv().selectedKnifeMesh
                elseif desc:IsA("MeshPart") then
                    if not desc:GetAttribute("OriginalTextureID") then
                        desc:SetAttribute("OriginalTextureID", desc.TextureID)
                    end
                    desc.TextureID = getgenv().selectedKnifeMesh
                end
            end
        end

        local gun = char:FindFirstChild("Gun") or char:FindFirstChild("Revolver") or char:FindFirstChild("CGun")
        if gun and getgenv().selectedGunMesh ~= "" then
            for _, desc in ipairs(gun:GetDescendants()) do
                if desc:IsA("SpecialMesh") or desc:IsA("FileMesh") then
                    if not desc:GetAttribute("OriginalTexture") then
                        desc:SetAttribute("OriginalTexture", desc.TextureId)
                    end
                    desc.TextureId = getgenv().selectedGunMesh
                elseif desc:IsA("MeshPart") then
                    if not desc:GetAttribute("OriginalTextureID") then
                        desc:SetAttribute("OriginalTextureID", desc.TextureID)
                    end
                    desc.TextureID = getgenv().selectedGunMesh
                end
            end
        end
    end)
end)

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
            pFrame.BackgroundColor3 = getgenv().btnAccentColor
            pFrame.Parent = TargetListContainer
            Instance.new("UICorner", pFrame).CornerRadius = UDim.new(0, 6)
            table.insert(registeredToggles, {Frame = pFrame, Indicator = {BackgroundColor3 = Color3.new()}, IsActive = function() return false end})

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
            pFlingBtn.BackgroundColor3 = getgenv().selectedTargetName == player.Name and Color3.fromRGB(50, 200, 100) or getgenv().uiAccentColor
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

local function createVerifiedAuthor(parent, nameText)
    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(1, 0, 0, 42)
    Frame.BackgroundColor3 = getgenv().btnAccentColor
    Frame.Parent = parent
    Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 6)
    table.insert(registeredToggles, {Frame = Frame, Indicator = {BackgroundColor3 = Color3.new()}, IsActive = function() return false end})

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, -20, 1, 0)
    Label.Position = UDim2.new(0, 10, 0, 0)
    Label.BackgroundTransparency = 1
    Label.TextColor3 = Color3.fromRGB(220, 220, 240)
    Label.TextSize = 13
    Label.Font = Enum.Font.GothamMedium
    Label.Text = nameText .. " <font color='#1da1f2'>🅲</font>"
    Label.RichText = true
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Frame
end

createVerifiedAuthor(tab6Page, "sanonaprivate")
createVerifiedAuthor(tab6Page, "Darynlox32")

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

RunService.Heartbeat:Connect(function()
    if not getgenv().bhopEnabled then return end
    local character = LocalPlayer.Character
    if not character then return end
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    if not humanoid or not rootPart then return end

    if humanoid.MoveDirection.Magnitude > 0 then
        if humanoid:GetState() == Enum.HumanoidStateType.Running or humanoid:GetState() == Enum.HumanoidStateType.RunningNoPhysics then
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
        humanoid.WalkSpeed = getgenv().bhopSpeed or 24
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

local function createChams(player)
    if player == LocalPlayer then return end

    local function setupChams(char)
        if char:FindFirstChild("MM2_ChamsFolder") then char.MM2_ChamsFolder:Destroy() end

        local folder = Instance.new("Folder")
        folder.Name = "MM2_ChamsFolder"
        folder.Parent = char

        local connection
        connection = RunService.RenderStepped:Connect(function()
            if not getgenv().espEnabled or not char or not char.Parent then
                folder:ClearAllChildren()
                if not char or not char.Parent then
                    if connection then connection:Disconnect() end
                end
                return
            end

            local roleColor = getPlayerRoleColor(player)

            for _, part in ipairs(char:GetChildren()) do
                if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                    local boxName = "Chams_" .. part.Name
                    local highlightBox = folder:FindFirstChild(boxName)
                    
                    if not highlightBox then
                        highlightBox = Instance.new("BoxHandleAdornment")
                        highlightBox.Name = boxName
                        highlightBox.Adornee = part
                        highlightBox.AlwaysOnTop = true
                        highlightBox.ZIndex = 5
                        highlightBox.Size = part.Size + Vector3.new(0.05, 0.05, 0.05)
                        highlightBox.Parent = folder
                    end
                    
                    highlightBox.Color3 = roleColor
                    highlightBox.Transparency = 0.4
                end
            end
        end)
    end

    player.CharacterAdded:Connect(setupChams)
    if player.Character then
        task.spawn(function() setupChams(player.Character) end)
    end
end

for _, player in ipairs(Players:GetPlayers()) do
    if player ~= LocalPlayer then task.spawn(function() createChams(player) end) end
end
Players.PlayerAdded:Connect(function(player)
    if player ~= LocalPlayer then task.spawn(function() createChams(player) end) end
end)

RunService.RenderStepped:Connect(function()
    if not getgenv().sheriffAimbotEnabled then return end
    if getPlayerRole(LocalPlayer) ~= "Sheriff" then return end

    local char = LocalPlayer.Character
    if not char then return end
    local gun = char:FindFirstChild("Gun") or char:FindFirstChild("Revolver") or char:FindFirstChild("CGun")
    if not gun then return end

    local targetPlayer = nil
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and getPlayerRole(player) == "Murderer" then
            local tChar = player.Character
            if tChar and tChar:FindFirstChild("HumanoidRootPart") then
                local hum = tChar:FindFirstChildOfClass("Humanoid")
                if hum and hum.Health > 0 then
                    targetPlayer = player
                    break
                end
            end
        end
    end

    if targetPlayer and targetPlayer.Character then
        local targetPart = targetPlayer.Character:FindFirstChild("HumanoidRootPart") or targetPlayer.Character:FindFirstChild("Head")
        if targetPart then
            Camera.CFrame = CFrame.new(Camera.CFrame.Position, targetPart.Position)
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
                                            local re = ReplicatedStorage:FindFirstChild("Remotes")
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
                                        task.wait(0.15)
                                    end
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
            rootPart.CFrame = rootPart.CFrame * CFrame.Angles(0, math.rad(45), 0)
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

local function runTouchFling()
    if not getgenv().touchFlingEnabled then return end
    local localChar = LocalPlayer.Character
    if not localChar or not localChar:FindFirstChild("HumanoidRootPart") or not localChar:FindFirstChildOfClass("Humanoid") then return end
    local myRoot = localChar.HumanoidRootPart
    local humanoid = localChar:FindFirstChildOfClass("Humanoid")

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local tRoot = player.Character.HumanoidRootPart
            local dist = (myRoot.Position - tRoot.Position).Magnitude
            if dist < 6 then
                humanoid.PlatformStand = true
                myRoot.CFrame = tRoot.CFrame + Vector3.new(math.random(-2, 2), math.random(1, 3), math.random(-2, 2))
                myRoot.AssemblyLinearVelocity = Vector3.new(99999, 99999, 99999)
                myRoot.AssemblyAngularVelocity = Vector3.new(99999, 99999, 99999)
                break
            end
        end
    end
end

RunService.Heartbeat:Connect(function()
    if getgenv().flingMurdererEnabled then runFling("Murderer") end
    if getgenv().flingSheriffEnabled then runFling("Sheriff") end
    if getgenv().targetFlingEnabled then runTargetFling() end
    if getgenv().touchFlingEnabled then runTouchFling() end
end)

RunService.Stepped:Connect(function()
    local character = LocalPlayer.Character
    if not character then return end
    if getgenv().noclipEnabled then
        for _, part in ipairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                if not part:GetAttribute("OriginalCanCollide") then
                    part:SetAttribute("OriginalCanCollide", part.CanCollide)
                end
                part.CanCollide = false
            end
        end
    else
        for _, part in ipairs(character:GetDescendants()) do
            if part:IsA("BasePart") and part:GetAttribute("OriginalCanCollide") ~= nil then
                part.CanCollide = part:GetAttribute("OriginalCanCollide")
            end
        end
    end
end)

RunService.Heartbeat:Connect(function()
    local character = LocalPlayer.Character
    if not character then return end
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not humanoid then return end
    if not getgenv().autoFarmEnabled and not getgenv().bhopEnabled then
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
                val = desc:IsA("Model") and desc.PrimaryPart or desc
                if val and val:IsA("BasePart") then
                    rootPart.CFrame = val.CFrame + Vector3.new(0, 3, 0)
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
