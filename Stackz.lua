--[[ Stackzsavo01 - Universal Script | Red Theme | PC + Mobile + Controller ]]

if not game:IsLoaded() then game.Loaded:Wait() end
task.wait(0.3)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local WS = game:GetService("Workspace")

local LP = Players.LocalPlayer
local Cam = WS.CurrentCamera
local PG = LP:WaitForChild("PlayerGui")

if PG:FindFirstChild("Stackzsavo01") then PG.Stackzsavo01:Destroy() end

local IsMobile = UIS.TouchEnabled and not UIS.KeyboardEnabled
local HasGamepad = UIS.GamepadEnabled

local S = {
    Fly=false, Noclip=false, InfJump=false, ESP=false, Aimbot=false, WSOn=false,
    FlySpeed=60, WSVal=16,
    FlyConn=nil, NoclipConn=nil, JumpConn=nil,
    ESPTab={},
    Mobile = { W=false, A=false, S=false, D=false, Up=false, Down=false },
    Gamepad = { FlyToggle=false },
}

-- Colors
local RED = Color3.fromRGB(220,35,45)
local REDB = Color3.fromRGB(255,70,80)
local BG = Color3.fromRGB(15,15,18)
local BG2 = Color3.fromRGB(22,22,26)
local BG3 = Color3.fromRGB(32,32,38)
local TXT = Color3.fromRGB(235,235,240)
local TXTD = Color3.fromRGB(150,150,155)

-- GUI
local Gui = Instance.new("ScreenGui")
Gui.Name = "Stackzsavo01"
Gui.ResetOnSpawn = false
Gui.IgnoreGuiInset = true
Gui.DisplayOrder = 999
Gui.Parent = PG

local Main = Instance.new("Frame")
Main.Size = UDim2.new(0,290,0,340)
Main.Position = UDim2.new(0.5,-145,0.3,0)
Main.BackgroundColor3 = BG
Main.BorderSizePixel = 0
Main.Active = true
Main.Parent = Gui

local MC = Instance.new("UICorner") MC.CornerRadius = UDim.new(0,8) MC.Parent = Main
local MS = Instance.new("UIStroke") MS.Color = RED MS.Thickness = 1.5 MS.Parent = Main

-- Topbar
local Top = Instance.new("Frame")
Top.Size = UDim2.new(1,0,0,38)
Top.BackgroundColor3 = BG2
Top.BorderSizePixel = 0
Top.Parent = Main

local TC = Instance.new("UICorner") TC.CornerRadius = UDim.new(0,8) TC.Parent = Top
local TF = Instance.new("Frame")
TF.Size = UDim2.new(1,0,0,10) TF.Position = UDim2.new(0,0,1,-10)
TF.BackgroundColor3 = BG2 TF.BorderSizePixel = 0 TF.Parent = Top

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1,-90,1,0) Title.Position = UDim2.new(0,15,0,0)
Title.BackgroundTransparency = 1
Title.Text = "STACKZSAVO01"
Title.TextColor3 = REDB
Title.TextSize = 18
Title.Font = Enum.Font.GothamBlack
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Top

local Min = Instance.new("TextButton")
Min.Size = UDim2.new(0,30,0,30) Min.Position = UDim2.new(1,-70,0,4)
Min.BackgroundColor3 = BG3 Min.Text = "—"
Min.TextColor3 = TXT Min.TextSize = 18
Min.Font = Enum.Font.GothamBold Min.Parent = Top
local MinC = Instance.new("UICorner") MinC.CornerRadius = UDim.new(0,5) MinC.Parent = Min

local Close = Instance.new("TextButton")
Close.Size = UDim2.new(0,30,0,30) Close.Position = UDim2.new(1,-36,0,4)
Close.BackgroundColor3 = RED Close.Text = "×"
Close.TextColor3 = Color3.new(1,1,1) Close.TextSize = 20
Close.Font = Enum.Font.GothamBold Close.Parent = Top
local CC = Instance.new("UICorner") CC.CornerRadius = UDim.new(0,5) CC.Parent = Close

-- Content
local Content = Instance.new("ScrollingFrame")
Content.Size = UDim2.new(1,-16,1,-50)
Content.Position = UDim2.new(0,8,0,44)
Content.BackgroundTransparency = 1
Content.BorderSizePixel = 0
Content.ScrollBarThickness = 4
Content.ScrollBarImageColor3 = RED
Content.CanvasSize = UDim2.new(0,0,0,0)
Content.AutomaticCanvasSize = Enum.AutomaticSize.Y
Content.Parent = Main

local Layout = Instance.new("UIListLayout")
Layout.Padding = UDim.new(0,6)
Layout.SortOrder = Enum.SortOrder.LayoutOrder
Layout.Parent = Content

-- Draggable (mouse + touch)
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

-- Toggle factory
local function toggle(name, cb)
    local B = Instance.new("TextButton")
    B.Size = UDim2.new(1,-4,0,44)
    B.BackgroundColor3 = BG2
    B.Text = ""
    B.AutoButtonColor = false
    B.Parent = Content
    local c = Instance.new("UICorner") c.CornerRadius = UDim.new(0,6) c.Parent = B
    local s = Instance.new("UIStroke") s.Color = BG3 s.Thickness = 1 s.Parent = B

    local L = Instance.new("TextLabel")
    L.Size = UDim2.new(1,-80,1,0) L.Position = UDim2.new(0,15,0,0)
    L.BackgroundTransparency = 1 L.Text = name
    L.TextColor3 = TXT L.TextSize = 15
    L.Font = Enum.Font.GothamMedium
    L.TextXAlignment = Enum.TextXAlignment.Left
    L.Parent = B

    local Ind = Instance.new("Frame")
    Ind.Size = UDim2.new(0,50,0,24) Ind.Position = UDim2.new(1,-62,0.5,-12)
    Ind.BackgroundColor3 = BG3 Ind.Parent = B
    local ic = Instance.new("UICorner") ic.CornerRadius = UDim.new(1,0) ic.Parent = Ind

    local Dot = Instance.new("Frame")
    Dot.Size = UDim2.new(0,18,0,18) Dot.Position = UDim2.new(0,3,0.5,-9)
    Dot.BackgroundColor3 = TXTD Dot.Parent = Ind
    local dc = Instance.new("UICorner") dc.CornerRadius = UDim.new(1,0) dc.Parent = Dot

    local on = false
    B.MouseButton1Click:Connect(function()
        on = not on
        if on then
            Ind.BackgroundColor3 = RED Dot.BackgroundColor3 = Color3.new(1,1,1)
            Dot:TweenPosition(UDim2.new(1,-21,0.5,-9),"Out","Quad",0.12,true)
        else
            Ind.BackgroundColor3 = BG3 Dot.BackgroundColor3 = TXTD
            Dot:TweenPosition(UDim2.new(0,3,0.5,-9),"Out","Quad",0.12,true)
        end
        cb(on)
    end)
    return B
end

-- Slider factory (bigger hitbox for touch)
local function slider(name, mn, mx, def, cb)
    local F = Instance.new("Frame")
    F.Size = UDim2.new(1,-4,0,60)
    F.BackgroundColor3 = BG2
    F.Parent = Content
    local c = Instance.new("UICorner") c.CornerRadius = UDim.new(0,6) c.Parent = F
    local s = Instance.new("UIStroke") s.Color = BG3 s.Thickness = 1 s.Parent = F

    local L = Instance.new("TextLabel")
    L.Size = UDim2.new(1,-20,0,22) L.Position = UDim2.new(0,12,0,4)
    L.BackgroundTransparency = 1
    L.Text = name..": "..def L.TextColor3 = TXT L.TextSize = 14
    L.Font = Enum.Font.GothamMedium
    L.TextXAlignment = Enum.TextXAlignment.Left
    L.Parent = F

    local Bar = Instance.new("Frame")
    Bar.Size = UDim2.new(1,-24,0,6) Bar.Position = UDim2.new(0,12,0,40)
    Bar.BackgroundColor3 = BG3 Bar.Parent = F
    local bc = Instance.new("UICorner") bc.CornerRadius = UDim.new(1,0) bc.Parent = Bar

    local Fill = Instance.new("Frame")
    Fill.Size = UDim2.new((def-mn)/(mx-mn),0,1,0)
    Fill.BackgroundColor3 = RED Fill.Parent = Bar
    local fc = Instance.new("UICorner") fc.CornerRadius = UDim.new(1,0) fc.Parent = Fill

    -- Big touch hitbox over the slider
    local Hit = Instance.new("TextButton")
    Hit.Size = UDim2.new(1,0,0,32) Hit.Position = UDim2.new(0,0,0,26)
    Hit.BackgroundTransparency = 1 Hit.Text = "" Hit.Parent = F

    local dr = false
    local function upd(i)
        local p = math.clamp((i.Position.X - Bar.AbsolutePosition.X)/Bar.AbsoluteSize.X,0,1)
        local v = math.floor(mn+(mx-mn)*p)
        Fill.Size = UDim2.new(p,0,1,0)
        L.Text = name..": "..v
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

-- INPUT HELPERS (unified for PC / Mobile / Controller)
local function inputForward()
    return UIS:IsKeyDown(Enum.KeyCode.W)
        or UIS:IsKeyDown(Enum.KeyCode.Up)
        or S.Mobile.W
        or (UIS:GetGamepadState(Enum.UserInputType.Gamepad1)[Enum.KeyCode.Thumbstick1].Position.Y or 0) > 0.15
end
local function inputBack()
    return UIS:IsKeyDown(Enum.KeyCode.S)
        or UIS:IsKeyDown(Enum.KeyCode.Down)
        or S.Mobile.S
        or (UIS:GetGamepadState(Enum.UserInputType.Gamepad1)[Enum.KeyCode.Thumbstick1].Position.Y or 0) < -0.15
end
local function inputLeft()
    return UIS:IsKeyDown(Enum.KeyCode.A)
        or UIS:IsKeyDown(Enum.KeyCode.Left)
        or S.Mobile.A
        or (UIS:GetGamepadState(Enum.UserInputType.Gamepad1)[Enum.KeyCode.Thumbstick1].Position.X or 0) < -0.15
end
local function inputRight()
    return UIS:IsKeyDown(Enum.KeyCode.D)
        or UIS:IsKeyDown(Enum.KeyCode.Right)
        or S.Mobile.D
        or (UIS:GetGamepadState(Enum.UserInputType.Gamepad1)[Enum.KeyCode.Thumbstick1].Position.X or 0) > 0.15
end
local function inputUp()
    return UIS:IsKeyDown(Enum.KeyCode.Space)
        or UIS:IsKeyDown(Enum.KeyCode.Q)
        or S.Mobile.Up
        or UIS:IsKeyDown(Enum.KeyCode.ButtonR1)
end
local function inputDown()
    return UIS:IsKeyDown(Enum.KeyCode.LeftControl)
        or UIS:IsKeyDown(Enum.KeyCode.C)
        or UIS:IsKeyDown(Enum.KeyCode.E)
        or S.Mobile.Down
        or UIS:IsKeyDown(Enum.KeyCode.ButtonL1)
end

-- FEATURES
local function applyWS(v)
    local c = LP.Character
    if c then
        local h = c:FindFirstChildOfClass("Humanoid")
        if h then h.WalkSpeed = v end
    end
end

local function startFly()
    local c = LP.Character
    if not c then return end
    local hrp = c:FindFirstChild("HumanoidRootPart")
    local hum = c:FindFirstChildOfClass("Humanoid")
    if not hrp or not hum then return end
    hum.PlatformStand = true
    local att = Instance.new("Attachment") att.Parent = hrp
    local lv = Instance.new("LinearVelocity")
    lv.Attachment0 = att lv.MaxForce = math.huge
    lv.VelocityConstraintMode = Enum.VelocityConstraintMode.Vector
    lv.RelativeTo = Enum.ActuatorRelativeTo.World
    lv.VectorVelocity = Vector3.zero lv.Parent = hrp
    local gy = Instance.new("BodyGyro")
    gy.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
    gy.P = 10000 gy.D = 500 gy.CFrame = hrp.CFrame gy.Parent = hrp
    if S.FlyConn then S.FlyConn:Disconnect() end
    S.FlyConn = RunService.RenderStepped:Connect(function()
        if not hrp.Parent then return end
        local cf = Cam.CFrame
        local md = Vector3.zero
        if inputForward() then md = md + cf.LookVector end
        if inputBack() then md = md - cf.LookVector end
        if inputLeft() then md = md - cf.RightVector end
        if inputRight() then md = md + cf.RightVector end
        if inputUp() then md = md + Vector3.new(0,1,0) end
        if inputDown() then md = md - Vector3.new(0,1,0) end
        lv.VectorVelocity = md.Magnitude > 0 and md.Unit * S.FlySpeed or Vector3.zero
        local ld = cf.LookVector
        gy.CFrame = CFrame.new(hrp.Position, hrp.Position + Vector3.new(ld.X,0,ld.Z))
    end)
end

local function stopFly()
    if S.FlyConn then S.FlyConn:Disconnect() S.FlyConn = nil end
    for k in pairs(S.Mobile) do S.Mobile[k] = false end
    if FlyPad then FlyPad.Visible = false end
    local c = LP.Character
    if c then
        local hrp = c:FindFirstChild("HumanoidRootPart")
        local hum = c:FindFirstChildOfClass("Humanoid")
        if hum then hum.PlatformStand = false end
        if hrp then
            for _,v in ipairs(hrp:GetChildren()) do
                if v:IsA("LinearVelocity") or v:IsA("BodyGyro") or v:IsA("Attachment") then v:Destroy() end
            end
        end
    end
end

toggle("FLY", function(v)
    S.Fly = v
    if v then
        startFly()
        if FlyPad then FlyPad.Visible = true end
    else
        stopFly()
    end
end)

toggle("NOCLIP", function(v)
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

toggle("INF JUMP", function(v)
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

toggle("ESP", function(v)
    S.ESPTab = S.ESPTab or {}
    if v then
        for _,p in ipairs(Players:GetPlayers()) do
            if p ~= LP then
                local b = Instance.new("BoxHandleAdornment")
                b.Size = Vector3.new(2,2,1) b.Transparency = 0.5
                b.Color3 = REDB b.AlwaysOnTop = true b.ZIndex = 5
                b.Adornee = p.Character and p.Character:FindFirstChild("HumanoidRootPart")
                b.Parent = PG
                S.ESPTab[p] = b
            end
        end
        S.ESP = true
    else
        for _,b in pairs(S.ESPTab) do b:Destroy() end
        S.ESPTab = {}
        S.ESP = false
    end
end)

toggle("AIMBOT", function(v) S.Aimbot = v end)

slider("Fly Speed", 10, 500, 60, function(v) S.FlySpeed = v end)
slider("Walk Speed", 16, 300, 16, function(v)
    S.WSVal = v
    if S.WSOn then applyWS(v) end
end)

toggle("WALKSPEED", function(v)
    S.WSOn = v
    if v then applyWS(S.WSVal) else applyWS(16) end
end)

-- ============ MOBILE FLY PAD ============
local FlyPad = Instance.new("Frame")
FlyPad.Name = "FlyPad"
FlyPad.Size = UDim2.new(0,220,0,220)
FlyPad.Position = UDim2.new(0,20,1,-240)
FlyPad.BackgroundTransparency = 1
FlyPad.Visible = false
FlyPad.Parent = Gui

local function padBtn(txt, pos, key)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0,68,0,68) b.Position = pos
    b.BackgroundColor3 = BG2 b.BackgroundTransparency = 0.15
    b.Text = txt b.TextColor3 = REDB b.TextSize = 26
    b.Font = Enum.Font.GothamBlack b.AutoButtonColor = false b.Parent = FlyPad
    local c = Instance.new("UICorner") c.CornerRadius = UDim.new(0,12) c.Parent = b
    local s = Instance.new("UIStroke") s.Color = RED s.Thickness = 2 s.Parent = b
    local act = false
    local function on()
        act = true S.Mobile[key] = true b.BackgroundColor3 = RED b.TextColor3 = Color3.new(1,1,1)
    end
    local function off()
        act = false S.Mobile[key] = false b.BackgroundColor3 = BG2 b.TextColor3 = REDB
    end
    b.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.Touch or i.UserInputType == Enum.UserInputType.MouseButton1 then on() end
    end)
    b.InputEnded:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.Touch or i.UserInputType == Enum.UserInputType.MouseButton1 then off() end
    end)
    UIS.InputEnded:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.Touch and act then off() end
    end)
end

padBtn("▲", UDim2.new(0,76,0,0), "W")
padBtn("▼", UDim2.new(0,76,0,152), "S")
padBtn("◀", UDim2.new(0,4,0,76), "A")
padBtn("▶", UDim2.new(0,148,0,76), "D")
padBtn("⬆", UDim2.new(0,148,0,0), "Up")
padBtn("⬇", UDim2.new(0,148,0,152), "Down")

drag(FlyPad)

-- ============ CONTROLLER TOGGLE (L3 to open/close) ============
UIS.InputBegan:Connect(function(i, gp)
    if gp then return end
    if i.KeyCode == Enum.KeyCode.ButtonL3 then
        Main.Visible = not Main.Visible
        if Main.Visible and Reopen then Reopen.Visible = false end
    end
end)

-- ============ REOPEN BUTTON ============
local Reopen = Instance.new("TextButton")
Reopen.Name = "Reopen"
Reopen.Size = UDim2.new(0,150,0,40)
Reopen.Position = UDim2.new(0,20,0,60)
Reopen.BackgroundColor3 = BG
Reopen.Text = "STACKZSAVO01"
Reopen.TextColor3 = REDB
Reopen.TextSize = 14
Reopen.Font = Enum.Font.GothamBlack
Reopen.Visible = false
Reopen.Parent = Gui
local RC = Instance.new("UICorner") RC.CornerRadius = UDim.new(0,6) RC.Parent = Reopen
local RS = Instance.new("UIStroke") RS.Color = RED RS.Thickness = 1.5 RS.Parent = Reopen
drag(Reopen)

Close.MouseButton1Click:Connect(function() Main.Visible = false Reopen.Visible = true end)
Min.MouseButton1Click:Connect(function() Main.Visible = false Reopen.Visible = true end)
Reopen.MouseButton1Click:Connect(function() Main.Visible = true Reopen.Visible = false end)

-- ============ ESP + AIMBOT UPDATER ============
RunService.RenderStepped:Connect(function()
    if S.ESP then
        for p,b in pairs(S.ESPTab) do
            if p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                b.Adornee = p.Character.HumanoidRootPart
            else
                b.Adornee = nil
            end
        end
    end
    if S.Aimbot then
        local mp = UIS:GetMouseLocation()
        local closest, shortest = nil, math.huge
        for _,p in ipairs(Players:GetPlayers()) do
            if p ~= LP and p.Character then
                local h = p.Character:FindFirstChild("Head")
                if h then
                    local sp, on = Cam:WorldToViewportPoint(h.Position)
                    if on then
                        local d = (Vector2.new(sp.X,sp.Y)-mp).Magnitude
                        if d < shortest and d < 300 then shortest = d closest = p end
                    end
                end
            end
        end
        if closest then
            local h = closest.Character:FindFirstChild("Head")
            if h then Cam.CFrame = CFrame.new(Cam.CFrame.Position, h.Position) end
        end
    end
end)

-- Respawn persistence
LP.CharacterAdded:Connect(function()
    task.wait(0.5)
    if S.WSOn then applyWS(S.WSVal) end
    if S.Fly then startFly() end
end)

print("[Stackzsavo01] Loaded | Mobile:", IsMobile, "| Gamepad:", HasGamepad)
