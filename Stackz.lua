--[[ Stackzsavo01 v3 - Red Theme | Skeleton ESP | Smooth Aimbot | Teleport | PC + Mobile + Controller ]]

if not game:IsLoaded() then game.Loaded:Wait() end
task.wait(0.3)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local WS = game:GetService("Workspace")
local Camera = WS.CurrentCamera

local LP = Players.LocalPlayer
local PG = LP:WaitForChild("PlayerGui")

if PG:FindFirstChild("Stackzsavo01") then PG.Stackzsavo01:Destroy() end

local IsMobile = UIS.TouchEnabled and not UIS.KeyboardEnabled

local S = {
    Fly=false, Noclip=false, InfJump=false, ESP=false, Aimbot=false, WSOn=false,
    FlySpeed=60, WSVal=16, FOV=250, Smooth=0.15, ShowTools=true,
    FlyConn=nil, NoclipConn=nil, JumpConn=nil,
    ESPData={},
    Mobile = { W=false, A=false, S=false, D=false, Up=false, Down=false },
}

local RED     = Color3.fromRGB(220,35,45)
local REDB    = Color3.fromRGB(255,70,80)
local BG      = Color3.fromRGB(14,14,18)
local BG2     = Color3.fromRGB(22,22,28)
local BG3     = Color3.fromRGB(34,34,42)
local TXT     = Color3.fromRGB(238,238,242)
local TXTD    = Color3.fromRGB(150,150,158)
local GREEN   = Color3.fromRGB(60,220,90)
local BLUE    = Color3.fromRGB(70,150,255)

local Gui = Instance.new("ScreenGui")
Gui.Name = "Stackzsavo01"
Gui.ResetOnSpawn = false
Gui.IgnoreGuiInset = true
Gui.DisplayOrder = 999
Gui.Parent = PG

local Main = Instance.new("Frame")
Main.Size = UDim2.new(0,360,0,460)
Main.Position = UDim2.new(0.5,-180,0.2,0)
Main.BackgroundColor3 = BG
Main.BorderSizePixel = 0
Main.Active = true
Main.Parent = Gui

local MC = Instance.new("UICorner") MC.CornerRadius = UDim.new(0,10) MC.Parent = Main
local MS = Instance.new("UIStroke") MS.Color = RED MS.Thickness = 2 MS.Parent = Main

local Top = Instance.new("Frame")
Top.Size = UDim2.new(1,0,0,44)
Top.BackgroundColor3 = BG2
Top.BorderSizePixel = 0
Top.Parent = Main
local TC = Instance.new("UICorner") TC.CornerRadius = UDim.new(0,10) TC.Parent = Top
local TF = Instance.new("Frame")
TF.Size = UDim2.new(1,0,0,12) TF.Position = UDim2.new(0,0,1,-12)
TF.BackgroundColor3 = BG2 TF.BorderSizePixel = 0 TF.Parent = Top
local TG = Instance.new("UIGradient")
TG.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(45,20,25)),
    ColorSequenceKeypoint.new(1, BG2)
}
TG.Parent = Top

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1,-100,1,0) Title.Position = UDim2.new(0,16,0,0)
Title.BackgroundTransparency = 1
Title.Text = "◆ STACKZSAVO01"
Title.TextColor3 = REDB
Title.TextSize = 20
Title.Font = Enum.Font.GothamBlack
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Top

local Min = Instance.new("TextButton")
Min.Size = UDim2.new(0,30,0,30) Min.Position = UDim2.new(1,-76,0,7)
Min.BackgroundColor3 = BG3 Min.Text = "—"
Min.TextColor3 = TXT Min.TextSize = 18
Min.Font = Enum.Font.GothamBold Min.Parent = Top
local MinC = Instance.new("UICorner") MinC.CornerRadius = UDim.new(0,6) MinC.Parent = Min

local Close = Instance.new("TextButton")
Close.Size = UDim2.new(0,30,0,30) Close.Position = UDim2.new(1,-40,0,7)
Close.BackgroundColor3 = RED Close.Text = "✕"
Close.TextColor3 = Color3.new(1,1,1) Close.TextSize = 16
Close.Font = Enum.Font.GothamBold Close.Parent = Top
local CC = Instance.new("UICorner") CC.CornerRadius = UDim.new(0,6) CC.Parent = Close

-- TAB BAR
local TabBar = Instance.new("Frame")
TabBar.Size = UDim2.new(1,-20,0,34)
TabBar.Position = UDim2.new(0,10,0,50)
TabBar.BackgroundColor3 = BG2
TabBar.BorderSizePixel = 0
TabBar.Parent = Main
local TabBarC = Instance.new("UICorner") TabBarC.CornerRadius = UDim.new(0,8) TabBarC.Parent = TabBar
local TabBarL = Instance.new("UIListLayout")
TabBarL.FillDirection = Enum.FillDirection.Horizontal
TabBarL.Padding = UDim.new(0,4)
TabBarL.HorizontalAlignment = Enum.HorizontalAlignment.Center
TabBarL.VerticalAlignment = Enum.VerticalAlignment.Center
TabBarL.Parent = TabBar

local Content = Instance.new("ScrollingFrame")
Content.Size = UDim2.new(1,-20,1,-100)
Content.Position = UDim2.new(0,10,0,92)
Content.BackgroundTransparency = 1
Content.BorderSizePixel = 0
Content.ScrollBarThickness = 5
Content.ScrollBarImageColor3 = RED
Content.CanvasSize = UDim2.new(0,0,0,0)
Content.AutomaticCanvasSize = Enum.AutomaticSize.Y
Content.Parent = Main

local Layout = Instance.new("UIListLayout")
Layout.Padding = UDim.new(0,7)
Layout.SortOrder = Enum.SortOrder.LayoutOrder
Layout.Parent = Content

local Tabs = {}
local CurrentTab = nil

local function makeTab(name)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0,78,0,24)
    b.BackgroundColor3 = BG3
    b.Text = name
    b.TextColor3 = TXTD
    b.TextSize = 12
    b.Font = Enum.Font.GothamBold
    b.AutoButtonColor = false
    b.Parent = TabBar
    local c = Instance.new("UICorner") c.CornerRadius = UDim.new(0,6) c.Parent = b
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1,0,0,0)
    frame.AutomaticSize = Enum.AutomaticSize.Y
    frame.BackgroundTransparency = 1
    frame.Visible = false
    frame.Parent = Content
    local l = Instance.new("UIListLayout")
    l.Padding = UDim.new(0,7)
    l.SortOrder = Enum.SortOrder.LayoutOrder
    l.Parent = frame
    Tabs[name] = { btn = b, frame = frame }
    b.MouseButton1Click:Connect(function()
        for _, tab in pairs(Tabs) do
            tab.frame.Visible = false
            tab.btn.BackgroundColor3 = BG3
            tab.btn.TextColor3 = TXTD
        end
        frame.Visible = true
        b.BackgroundColor3 = RED
        b.TextColor3 = Color3.new(1,1,1)
    end)
    return frame, l
end

local function drag(frame, handle)
    local d, ds, sp
    handle.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
            d = true ds = i.Position sp = frame.Position
        end
    end)
    handle.InputEnded:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
            d = false
        end
    end)
    UIS.InputChanged:Connect(function(i)
        if not d then return end
        if i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch then
            local dd = i.Position - ds
            frame.Position = UDim2.new(sp.X.Scale, sp.X.Offset+dd.X, sp.Y.Scale, sp.Y.Offset+dd.Y)
        end
    end)
end
drag(Main, Top)

local function toggle(parent, name, cb)
    local B = Instance.new("TextButton")
    B.Size = UDim2.new(1,-4,0,46)
    B.BackgroundColor3 = BG2
    B.Text = ""
    B.AutoButtonColor = false
    B.Parent = parent
    local c = Instance.new("UICorner") c.CornerRadius = UDim.new(0,8) c.Parent = B
    local s = Instance.new("UIStroke") s.Color = BG3 s.Thickness = 1 s.Parent = B

    local L = Instance.new("TextLabel")
    L.Size = UDim2.new(1,-90,1,0) L.Position = UDim2.new(0,18,0,0)
    L.BackgroundTransparency = 1 L.Text = name
    L.TextColor3 = TXT L.TextSize = 15
    L.Font = Enum.Font.GothamBold
    L.TextXAlignment = Enum.TextXAlignment.Left
    L.Parent = B

    local Ind = Instance.new("Frame")
    Ind.Size = UDim2.new(0,56,0,26) Ind.Position = UDim2.new(1,-70,0.5,-13)
    Ind.BackgroundColor3 = BG3 Ind.Parent = B
    local ic = Instance.new("UICorner") ic.CornerRadius = UDim.new(1,0) ic.Parent = Ind

    local Dot = Instance.new("Frame")
    Dot.Size = UDim2.new(0,20,0,20) Dot.Position = UDim2.new(0,3,0.5,-10)
    Dot.BackgroundColor3 = TXTD Dot.Parent = Ind
    local dc = Instance.new("UICorner") dc.CornerRadius = UDim.new(1,0) dc.Parent = Dot

    local on = false
    B.MouseButton1Click:Connect(function()
        on = not on
        if on then
            Ind.BackgroundColor3 = RED Dot.BackgroundColor3 = Color3.new(1,1,1)
            Dot:TweenPosition(UDim2.new(1,-23,0.5,-10),"Out","Quad",0.15,true)
            s.Color = RED
        else
            Ind.BackgroundColor3 = BG3 Dot.BackgroundColor3 = TXTD
            Dot:TweenPosition(UDim2.new(0,3,0.5,-10),"Out","Quad",0.15,true)
            s.Color = BG3
        end
        cb(on)
    end)
    return B
end

local function slider(parent, name, mn, mx, def, cb)
    local F = Instance.new("Frame")
    F.Size = UDim2.new(1,-4,0,64)
    F.BackgroundColor3 = BG2
    F.Parent = parent
    local c = Instance.new("UICorner") c.CornerRadius = UDim.new(0,8) c.Parent = F
    local s = Instance.new("UIStroke") s.Color = BG3 s.Thickness = 1 s.Parent = F

    local L = Instance.new("TextLabel")
    L.Size = UDim2.new(1,-70,0,22) L.Position = UDim2.new(0,14,0,6)
    L.BackgroundTransparency = 1
    L.Text = name L.TextColor3 = TXT L.TextSize = 14
    L.Font = Enum.Font.GothamBold
    L.TextXAlignment = Enum.TextXAlignment.Left
    L.Parent = F

    local Val = Instance.new("TextLabel")
    Val.Size = UDim2.new(0,60,0,22) Val.Position = UDim2.new(1,-70,0,6)
    Val.BackgroundTransparency = 1
    Val.Text = tostring(def) Val.TextColor3 = REDB Val.TextSize = 14
    Val.Font = Enum.Font.GothamBlack
    Val.TextXAlignment = Enum.TextXAlignment.Right
    Val.Parent = F

    local Bar = Instance.new("Frame")
    Bar.Size = UDim2.new(1,-28,0,7) Bar.Position = UDim2.new(0,14,0,42)
    Bar.BackgroundColor3 = BG3 Bar.Parent = F
    local bc = Instance.new("UICorner") bc.CornerRadius = UDim.new(1,0) bc.Parent = Bar

    local Fill = Instance.new("Frame")
    Fill.Size = UDim2.new((def-mn)/(mx-mn),0,1,0)
    Fill.BackgroundColor3 = RED Fill.Parent = Bar
    local fc = Instance.new("UICorner") fc.CornerRadius = UDim.new(1,0) fc.Parent = Fill

    local Hit = Instance.new("TextButton")
    Hit.Size = UDim2.new(1,0,0,34) Hit.Position = UDim2.new(0,0,0,30)
    Hit.BackgroundTransparency = 1 Hit.Text = "" Hit.Parent = F

    local dr = false
    local function upd(i)
        local p = math.clamp((i.Position.X - Bar.AbsolutePosition.X)/Bar.AbsoluteSize.X,0,1)
        local v = math.floor(mn+(mx-mn)*p)
        Fill.Size = UDim2.new(p,0,1,0)
        Val.Text = tostring(v)
        cb(v)
    end
    Hit.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
            dr = true upd(i)
        end
    end)
    Hit.InputEnded:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
            dr = false
        end
    end)
    UIS.InputChanged:Connect(function(i)
        if dr and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then
            upd(i)
        end
    end)
end

local function button(parent, name, cb)
    local B = Instance.new("TextButton")
    B.Size = UDim2.new(1,-4,0,38)
    B.BackgroundColor3 = BG2
    B.Text = name
    B.TextColor3 = TXT
    B.TextSize = 14
    B.Font = Enum.Font.GothamBold
    B.AutoButtonColor = false
    B.Parent = parent
    local c = Instance.new("UICorner") c.CornerRadius = UDim.new(0,8) c.Parent = B
    local s = Instance.new("UIStroke") s.Color = BG3 s.Thickness = 1 s.Parent = B
    B.MouseButton1Click:Connect(function()
        s.Color = RED
        B.BackgroundColor3 = BG3
        task.wait(0.1)
        B.BackgroundColor3 = BG2
        cb()
    end)
    return B
end

local function textbox(parent, placeholder, cb)
    local F = Instance.new("Frame")
    F.Size = UDim2.new(1,-4,0,40)
    F.BackgroundColor3 = BG2
    F.Parent = parent
    local c = Instance.new("UICorner") c.CornerRadius = UDim.new(0,8) c.Parent = F
    local s = Instance.new("UIStroke") s.Color = BG3 s.Thickness = 1 s.Parent = F
    local tb = Instance.new("TextBox")
    tb.Size = UDim2.new(1,-20,1,0) tb.Position = UDim2.new(0,10,0,0)
    tb.BackgroundTransparency = 1
    tb.Text = ""
    tb.PlaceholderText = placeholder
    tb.PlaceholderColor3 = TXTD
    tb.TextColor3 = TXT
    tb.TextSize = 13
    tb.Font = Enum.Font.GothamMedium
    tb.TextXAlignment = Enum.TextXAlignment.Left
    tb.ClearTextOnFocus = false
    tb.Parent = F
    tb.FocusLost:Connect(function() cb(tb.Text) end)
    return tb
end

-- ============ TABS ============
local MainTabF = makeTab("MAIN")
local ESPTabF = makeTab("ESP")
local AimTabF = makeTab("AIM")
local TPTabF = makeTab("TP")
local MiscTabF = makeTab("MISC")

-- Show MAIN by default
Tabs["MAIN"].frame.Visible = true
Tabs["MAIN"].btn.BackgroundColor3 = RED
Tabs["MAIN"].btn.TextColor3 = Color3.new(1,1,1)

-- ============ ESP ============
local function createESP(plr)
    if plr == LP then return end
    if S.ESPData[plr] then return end

    local data = { lines = {}, labels = {}, healthFill = nil, conns = {} }
    S.ESPData[plr] = data

    local bones = {
        {"Head","UpperTorso"}, {"UpperTorso","LowerTorso"},
        {"UpperTorso","LeftUpperArm"}, {"LeftUpperArm","LeftLowerArm"}, {"LeftLowerArm","LeftHand"},
        {"UpperTorso","RightUpperArm"}, {"RightUpperArm","RightLowerArm"}, {"RightLowerArm","RightHand"},
        {"LowerTorso","LeftUpperLeg"}, {"LeftUpperLeg","LeftLowerLeg"}, {"LeftLowerLeg","LeftFoot"},
        {"LowerTorso","RightUpperLeg"}, {"RightUpperLeg","RightLowerLeg"}, {"RightLowerLeg","RightFoot"},
    }

    for i = 1, #bones do
        local line = Instance.new("LineHandleAdornment")
        line.Thickness = 2
        line.Color3 = REDB
        line.AlwaysOnTop = true
        line.ZIndex = 5
        line.Parent = PG
        data.lines[i] = line
    end

    local tag = Instance.new("BillboardGui")
    tag.Size = UDim2.new(0,220,0,70)
    tag.StudsOffset = Vector3.new(0,3.5,0)
    tag.AlwaysOnTop = true
    tag.Parent = PG
    data.labels.tag = tag

    local nameLbl = Instance.new("TextLabel")
    nameLbl.Size = UDim2.new(1,0,0,20)
    nameLbl.BackgroundTransparency = 1
    nameLbl.Text = plr.Name
    nameLbl.TextColor3 = REDB
    nameLbl.TextSize = 14
    nameLbl.Font = Enum.Font.GothamBold
    nameLbl.TextStrokeTransparency = 0.3
    nameLbl.Parent = tag

    local distLbl = Instance.new("TextLabel")
    distLbl.Size = UDim2.new(1,0,0,16)
    distLbl.Position = UDim2.new(0,0,0,20)
    distLbl.BackgroundTransparency = 1
    distLbl.TextColor3 = Color3.fromRGB(220,220,220)
    distLbl.TextSize = 12
    distLbl.Font = Enum.Font.Gotham
    distLbl.TextStrokeTransparency = 0.3
    distLbl.Parent = tag
    data.labels.distLbl = distLbl

    local hb = Instance.new("Frame")
    hb.Size = UDim2.new(1,0,0,6)
    hb.Position = UDim2.new(0,0,0,40)
    hb.BackgroundColor3 = Color3.fromRGB(40,40,40)
    hb.BorderSizePixel = 0
    hb.Parent = tag
    local hbc = Instance.new("UICorner") hbc.CornerRadius = UDim.new(1,0) hbc.Parent = hb

    local hf = Instance.new("Frame")
    hf.Size = UDim2.new(1,0,1,0)
    hf.BackgroundColor3 = GREEN
    hf.BorderSizePixel = 0
    hf.Parent = hb
    local hfc = Instance.new("UICorner") hfc.CornerRadius = UDim.new(1,0) hfc.Parent = hf
    data.healthFill = hf

    local toolLbl = Instance.new("TextLabel")
    toolLbl.Size = UDim2.new(1,0,0,16)
    toolLbl.Position = UDim2.new(0,0,0,48)
    toolLbl.BackgroundTransparency = 1
    toolLbl.TextColor3 = Color3.fromRGB(255,220,100)
    toolLbl.TextSize = 12
    toolLbl.Font = Enum.Font.GothamBold
    toolLbl.TextStrokeTransparency = 0.3
    toolLbl.Parent = tag
    data.labels.toolLbl = toolLbl

    data.boneDefs = bones
end

local function removeESP(plr)
    local data = S.ESPData[plr]
    if not data then return end
    for _, line in pairs(data.lines) do line:Destroy() end
    if data.labels.tag then data.labels.tag:Destroy() end
    S.ESPData[plr] = nil
end

local function updateESP()
    for plr, data in pairs(S.ESPData) do
        local char = plr.Character
        if char then
            local hum = char:FindFirstChildOfClass("Humanoid")
            for i, bonePair in ipairs(data.boneDefs) do
                local p1 = char:FindFirstChild(bonePair[1])
                local p2 = char:FindFirstChild(bonePair[2])
                local line = data.lines[i]
                if p1 and p2 then
                    local dir = p2.Position - p1.Position
                    line.Length = dir.Magnitude
                    line.CFrame = CFrame.new(p1.Position, p2.Position) * CFrame.new(0, 0, -dir.Magnitude/2)
                    line.Adornee = workspace.Terrain
                    line.Visible = true
                else
                    line.Visible = false
                end
            end

            local head = char:FindFirstChild("Head")
            if head then
                data.labels.tag.Adornee = head
                local dist = math.floor((Camera.CFrame.Position - head.Position).Magnitude)
                data.labels.distLbl.Text = dist .. " studs"
            end

            if hum then
                local hp = math.clamp(hum.Health / hum.MaxHealth, 0, 1)
                data.healthFill.Size = UDim2.new(hp, 0, 1, 0)
                if hp > 0.6 then
                    data.healthFill.BackgroundColor3 = GREEN
                elseif hp > 0.3 then
                    data.healthFill.BackgroundColor3 = Color3.fromRGB(255,200,60)
                else
                    data.healthFill.BackgroundColor3 = RED
                end
            end

            if S.ShowTools then
                local tool = char:FindFirstChildOfClass("Tool")
                data.labels.toolLbl.Text = tool and ("⚔ "..tool.Name) or ""
            else
                data.labels.toolLbl.Text = ""
            end
        else
            for _, line in pairs(data.lines) do line.Visible = false end
            data.labels.tag.Adornee = nil
        end
    end
end

-- ============ AIMBOT ============
local function getClosestToFOV()
    local center = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
    local closest, shortest = nil, math.huge
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LP and p.Character then
            local head = p.Character:FindFirstChild("Head")
            if head then
                local sp, on = Camera:WorldToViewportPoint(head.Position)
                if on then
                    local d = (Vector2.new(sp.X, sp.Y) - center).Magnitude
                    if d < S.FOV and d < shortest then
                        shortest = d
                        closest = p
                    end
                end
            end
        end
    end
    return closest
end

RunService.RenderStepped:Connect(function()
    if S.ESP then updateESP() end
    if S.Aimbot then
        local target = getClosestToFOV()
        if target and target.Character then
            local head = target.Character:FindFirstChild("Head")
            if head then
                local targetCF = CFrame.new(Camera.CFrame.Position, head.Position)
                Camera.CFrame = Camera.CFrame:Lerp(targetCF, math.clamp(S.Smooth, 0.02, 1))
            end
        end
    end
end)

-- ============ FEATURES ============
local function applyWS(v)
    local c = LP.Character
    if c then
        local h = c:FindFirstChildOfClass("Humanoid")
        if h then h.WalkSpeed = v end
    end
end

local function inputF() return UIS:IsKeyDown(Enum.KeyCode.W) or S.Mobile.W end
local function inputB() return UIS:IsKeyDown(Enum.KeyCode.S) or S.Mobile.S end
local function inputL() return UIS:IsKeyDown(Enum.KeyCode.A) or S.Mobile.A end
local function inputR() return UIS:IsKeyDown(Enum.KeyCode.D) or S.Mobile.D end
local function inputU() return UIS:IsKeyDown(Enum.KeyCode.Space) or S.Mobile.Up end
local function inputD() return UIS:IsKeyDown(Enum.KeyCode.LeftControl) or S.Mobile.Down end

local function startFly()
    local c = LP.Character
    if not c then return end
    local hrp = c:FindFirstChild("HumanoidRootPart")
    local hum = c:FindFirstChildOfClass("Humanoid")
    if not hrp or not hum then return end
    hum.PlatformStand = true
    local att = Instance.new("Attachment") att.Parent = hrp
    local lv = Instance.new("LinearVelocity")
    lv.Attachment0 = att
    lv.MaxForce = math.huge
    lv.VelocityConstraintMode = Enum.VelocityConstraintMode.Vector
    lv.RelativeTo = Enum.ActuatorRelativeTo.World
    lv.Parent = hrp
    local gy = Instance.new("BodyGyro")
    gy.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
    gy.P = 20000 gy.D = 500 gy.CFrame = hrp.CFrame gy.Parent = hrp
    if S.FlyConn then S.FlyConn:Disconnect() end
    S.FlyConn = RunService.RenderStepped:Connect(function()
        if not hrp.Parent then return end
        local cf = Camera.CFrame
        local md = Vector3.zero
        if inputF() then md = md + cf.LookVector end
        if inputB() then md = md - cf.LookVector end
        if inputL() then md = md - cf.RightVector end
        if inputR() then md = md + cf.RightVector end
        if inputU() then md = md + Vector3.new(0,1,0) end
        if inputD() then md = md - Vector3.new(0,1,0) end
        lv.VectorVelocity = md.Magnitude > 0 and md.Unit * S.FlySpeed or Vector3.zero
        local ld = cf.LookVector
        gy.CFrame = CFrame.new(hrp.Position, hrp.Position + Vector3.new(ld.X,0,ld.Z))
    end)
end

local function stopFly()
    if S.FlyConn then S.FlyConn:Disconnect() S.FlyConn = nil end
    for k in pairs(S.Mobile) do S.Mobile[k] = false end
    local c = LP.Character
    if c then
        local hrp = c:FindFirstChild("HumanoidRootPart")
        local hum = c:FindFirstChildOfClass("Humanoid")
        if hum then hum.PlatformStand = false end
        if hrp then
            for _, v in ipairs(hrp:GetChildren()) do
                if v:IsA("LinearVelocity") or v:IsA("BodyGyro") or v:IsA("Attachment") then v:Destroy() end
            end
        end
    end
end

-- ============ TELEPORT ============
local function tpTo(x, y, z)
    local c = LP.Character
    if not c then return end
    local hrp = c:FindFirstChild("HumanoidRootPart")
    if hrp then
        hrp.CFrame = CFrame.new(x, y, z)
    end
end

local function tpToPlayer(name)
    local target = Players:FindFirstChild(name)
    if target and target.Character then
        local hrp = target.Character:FindFirstChild("HumanoidRootPart")
        local myHrp = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
        if hrp and myHrp then
            myHrp.CFrame = hrp.CFrame + Vector3.new(0, 3, 0)
        end
    end
end

-- ============ MAIN TAB ============
toggle(MainTabF, "FLY", function(v)
    S.Fly = v
    if v then startFly() if FlyPad then FlyPad.Visible = true end else stopFly() end
end)

toggle(MainTabF, "NOCLIP", function(v)
    S.Noclip = v
    if v then
        S.NoclipConn = RunService.Stepped:Connect(function()
            local c = LP.Character
            if not c then return end
            for _,p in ipairs(c:GetDescendants()) do
                if p:IsA("BasePart") then p.CanCollide = false end
            end
        end)
    else
        if S.NoclipConn then S.NoclipConn:Disconnect() S.NoclipConn = nil end
        local c = LP.Character
        if c then
            for _,p in ipairs(c:GetDescendants()) do
                if p:IsA("BasePart") then p.CanCollide = true end
            end
        end
    end
end)

toggle(MainTabF, "INF JUMP", function(v)
    S.InfJump = v
    if v and not S.JumpConn then
        S.JumpConn = UIS.JumpRequest:Connect(function()
            if S.InfJump then
                local c = LP.Character
                if c then
                    local h = c:FindFirstChildOfClass("Humanoid")
                    if h then h:ChangeState(Enum.HumanoidStateType.Jumping) end
                end
            end
        end)
    end
end)

toggle(MainTabF, "WALKSPEED", function(v)
    S.WSOn = v
    if v then applyWS(S.WSVal) else applyWS(16) end
end)

slider(MainTabF, "Fly Speed", 10, 500, 60, function(v) S.FlySpeed = v end)
slider(MainTabF, "Walk Speed", 16, 300, 16, function(v)
    S.WSVal = v
    if S.WSOn then applyWS(v) end
end)

-- ============ ESP TAB ============
toggle(ESPTabF, "SKELETON ESP", function(v)
    S.ESP = v
    if v then
        for _,p in ipairs(Players:GetPlayers()) do createESP(p) end
        Players.PlayerAdded:Connect(function(p) if S.ESP then createESP(p) end end)
        Players.PlayerRemoving:Connect(function(p) removeESP(p) end)
    else
        for p in pairs(S.ESPData) do removeESP(p) end
        S.ESPData = {}
    end
end)

toggle(ESPTabF, "SHOW TOOLS", function(v) S.ShowTools = v end)

-- ============ AIM TAB ============
toggle(AimTabF, "AIMBOT", function(v) S.Aimbot = v end)
slider(AimTabF, "Aim FOV", 50, 600, 250, function(v) S.FOV = v end)
slider(AimTabF, "Aim Smooth", 1, 100, 15, function(v) S.Smooth = v/100 end)

-- ============ TP TAB ============
local coordBoxes = {}
local function makeCoordRow(label, key)
    local F = Instance.new("Frame")
    F.Size = UDim2.new(1,-4,0,40)
    F.BackgroundColor3 = BG2
    F.Parent = TPTabF
    local c = Instance.new("UICorner") c.CornerRadius = UDim.new(0,8) c.Parent = F
    local s = Instance.new("UIStroke") s.Color = BG3 s.Thickness = 1 s.Parent = F
    local L = Instance.new("TextLabel")
    L.Size = UDim2.new(0,60,1,0) L.Position = UDim2.new(0,10,0,0)
    L.BackgroundTransparency = 1 L.Text = label
    L.TextColor3 = REDB L.TextSize = 13
    L.Font = Enum.Font.GothamBold
    L.TextXAlignment = Enum.TextXAlignment.Left
    L.Parent = F
    local T = Instance.new("TextBox")
    T.Size = UDim2.new(1,-80,1,0) T.Position = UDim2.new(0,70,0,0)
    T.BackgroundTransparency = 1
    T.Text = ""
    T.PlaceholderText = "0"
    T.PlaceholderColor3 = TXTD
    T.TextColor3 = TXT
    T.TextSize = 13
    T.Font = Enum.Font.GothamMedium
    T.TextXAlignment = Enum
