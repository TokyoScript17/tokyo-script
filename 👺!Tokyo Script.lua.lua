-- ╔══════════════════════════════════════════════════════════════╗
-- ║   👺 !Tokyo Script — Key System v1.0                        ║
-- ║   Discord Key Edition  ·  Navy Ice UI                       ║
-- ╚══════════════════════════════════════════════════════════════╝

-- ══════════════════════════════════════
-- CONFIG — MODIFICA QUESTI VALORI
-- ══════════════════════════════════════
local VALID_KEYS = {
    "TOKYO-FAGF-Y1YI",
    "TOKYO-BTWY-9FSS",
    "TOKYO-UG47-QJE6",
    "TOKYO-IPWG-NOLF",
    "TOKYO-4TUW-ZI5P",
    "TOKYO-LY70-BXHA",
    "TOKYO-8MEG-8EML",
    "TOKYO-3FLD-NNM5",
    "TOKYO-QHWB-E49F",
    "TOKYO-L2DC-6SZF",
    "TOKYO-Y0H0-Y5ZG",
    "TOKYO-KEND-6Q9C",
    "TOKYO-MMTO-8O7D",
    "TOKYO-IR4G-4C5A",
    "TOKYO-PGD7-U485",
    "TOKYO-ACV1-FXB1",
    "TOKYO-3JLX-IDCH",
    "TOKYO-NRRR-7PNX",
    "TOKYO-AQPC-JPP3",
    "TOKYO-XU0H-89MB",
    "TOKYO-2EAS-AD1M",
    "TOKYO-PWGH-Y3JO",
    "TOKYO-2KDW-BLG2",
    "TOKYO-67GV-SQYV",
    "TOKYO-QLFZ-RAO6",
    "TOKYO-QC3Q-WZ42",
    "TOKYO-WFCY-LUDP",
    "TOKYO-D4P0-E68O",
    "TOKYO-QFUC-NF3L",
    "TOKYO-TJ0A-DCZ3",
    "TOKYO-BT8R-XPFA",
    "TOKYO-DFG6-80W9",
    "TOKYO-H2F2-ZIK5",
    "TOKYO-571U-1FTR",
    "TOKYO-573W-DEIR",
    "TOKYO-VHD4-T03G",
    "TOKYO-6BGD-0G76",
    "TOKYO-Y72C-TWQE",
    "TOKYO-MWVS-F65P",
    "TOKYO-NTXS-54AQ",
    "TOKYO-X4MS-9P7S",
    "TOKYO-E0AQ-1X53",
    "TOKYO-EYOB-4JYM",
    "TOKYO-DXGL-VGGC",
    "TOKYO-PXZV-PNC4",
    "TOKYO-V336-7Q4M",
    "TOKYO-KERY-WHJH",
    "TOKYO-ZXJ2-B1WG",
    "TOKYO-6MK8-PBZK",
    "TOKYO-E7CQ-FZO0",
}
local DISCORD_INVITE = "https://discord.gg/TUOCODICE"  -- <-- metti il tuo link Discord

-- ══════════════════════════════════════
-- SERVICES
-- ══════════════════════════════════════
local Players          = game:GetService("Players")
local TweenService     = game:GetService("TweenService")
local RunService       = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local LP       = Players.LocalPlayer
local USERNAME = LP.Name

-- ══════════════════════════════════════
-- KEY STORAGE
-- ══════════════════════════════════════
local STORAGE_KEY = "SP_Key_v3"

local function SaveKey(k)
    pcall(function() LP.PlayerGui:SetAttribute(STORAGE_KEY, k) end)
end
local function LoadKey()
    local ok, v = pcall(function() return LP.PlayerGui:GetAttribute(STORAGE_KEY) end)
    return ok and v or nil
end
local function IsKeyValid(k)
    if not k or k=="" then return false end
    k = k:upper():gsub("%s","")
    for _, v in ipairs(VALID_KEYS) do
        if k == v:upper() then return true end
    end
    return false
end

-- ══════════════════════════════════════
-- PALETTE Navy Ice
-- ══════════════════════════════════════
local C = {
    Bg      = Color3.fromRGB(6,  9,  20),
    Panel   = Color3.fromRGB(10, 14, 28),
    Row     = Color3.fromRGB(14, 18, 34),
    Hover   = Color3.fromRGB(20, 26, 52),
    Accent  = Color3.fromRGB(80, 170, 255),
    Accent2 = Color3.fromRGB(140,205,255),
    AccentG = Color3.fromRGB(80, 230,140),
    Border  = Color3.fromRGB(25,  40, 80),
    Text    = Color3.fromRGB(200,215,250),
    Dim     = Color3.fromRGB(90, 110,160),
    White   = Color3.fromRGB(255,255,255),
    Red     = Color3.fromRGB(255, 70,  70),
    Gold    = Color3.fromRGB(255,200,  60),
    DBlue   = Color3.fromRGB(18,  24,  50),
    Discord = Color3.fromRGB(88, 101,242),
}

-- ══════════════════════════════════════
-- GUI ROOT
-- ══════════════════════════════════════
pcall(function()
    local old = game:GetService("CoreGui"):FindFirstChild("SP_KeyUI2")
    if old then old:Destroy() end
end)
pcall(function()
    local old = LP.PlayerGui:FindFirstChild("SP_KeyUI2")
    if old then old:Destroy() end
end)

local SG = Instance.new("ScreenGui")
SG.Name            = "SP_KeyUI2"
SG.ResetOnSpawn    = false
SG.ZIndexBehavior  = Enum.ZIndexBehavior.Sibling
SG.IgnoreGuiInset  = true
if not pcall(function() SG.Parent = game:GetService("CoreGui") end) then
    SG.Parent = LP.PlayerGui
end

-- ══════════════════════════════════════
-- OVERLAY + NEVE
-- ══════════════════════════════════════
local overlay = Instance.new("Frame", SG)
overlay.Size = UDim2.new(1,0,1,0)
overlay.BackgroundColor3 = Color3.fromRGB(0,0,0)
overlay.BackgroundTransparency = 0.5
overlay.BorderSizePixel = 0
overlay.ZIndex = 1

local snowFrame = Instance.new("Frame", SG)
snowFrame.Size = UDim2.new(1,0,1,0)
snowFrame.BackgroundTransparency = 1
snowFrame.ZIndex = 2

local syms   = {"❄","❅","❆","·","*","◦"}
local flakes = {}
for i = 1, 40 do
    local l = Instance.new("TextLabel", snowFrame)
    l.BackgroundTransparency = 1
    l.ZIndex        = 2
    l.Font          = Enum.Font.GothamBold
    l.TextSize      = math.random(8,22)
    l.Text          = syms[math.random(#syms)]
    l.TextColor3    = Color3.fromRGB(math.random(120,200), math.random(160,230), 255)
    l.TextTransparency = math.random(4,8)/10
    l.Size          = UDim2.new(0,26,0,26)
    local sx        = math.random(0,100)/100
    l.Position      = UDim2.new(sx, 0, math.random(-10,100)/100, 0)
    table.insert(flakes, {l=l, x=sx, spd=math.random(6,16)/10, rot=math.random(-2,2)})
end

local snowT    = 0
local snowConn = RunService.Heartbeat:Connect(function(dt)
    snowT = snowT + dt
    for _, f in ipairs(flakes) do
        local ny = (f.l.Position.Y.Scale or 0) + dt * f.spd * 0.07
        if ny > 1.06 then
            ny   = -0.04
            f.x  = math.random(0,100)/100
        end
        local nx = f.x + math.sin(snowT * (f.rot ~= 0 and f.rot or 0.5) + f.x*9) * 0.005
        f.l.Position = UDim2.new(nx, 0, ny, 0)
        f.l.Rotation = snowT * f.rot * 22
    end
end)

-- ══════════════════════════════════════
-- CARD
-- ══════════════════════════════════════
local card = Instance.new("Frame", SG)
card.Size                  = UDim2.new(0, 420, 0, 360)
card.Position              = UDim2.new(0.5, -210, 0.5, -180)
card.BackgroundColor3      = C.Bg
card.BackgroundTransparency= 0.04
card.BorderSizePixel       = 0
card.ZIndex                = 10
card.ClipsDescendants      = true
Instance.new("UICorner", card).CornerRadius = UDim.new(0, 16)
local cardStroke = Instance.new("UIStroke", card)
cardStroke.Color     = C.Border
cardStroke.Thickness = 1.5

-- top accent line
local topLine = Instance.new("Frame", card)
topLine.Size             = UDim2.new(1,0,0,2)
topLine.BackgroundColor3 = C.Accent
topLine.BorderSizePixel  = 0
topLine.ZIndex           = 11
local tg = Instance.new("UIGradient", topLine)
tg.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0,   Color3.fromRGB(0,70,170)),
    ColorSequenceKeypoint.new(0.5, C.Accent),
    ColorSequenceKeypoint.new(1,   Color3.fromRGB(0,70,170)),
})

-- Entrata card
card.Size     = UDim2.new(0,0,0,0)
card.Position = UDim2.new(0.5,0,0.5,0)
TweenService:Create(card, TweenInfo.new(0.5,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{
    Size     = UDim2.new(0,420,0,360),
    Position = UDim2.new(0.5,-210,0.5,-180),
}):Play()

-- ══════════════════════════════════════
-- CONTENUTO CARD
-- ══════════════════════════════════════

-- Icona rotante
local iconLbl = Instance.new("TextLabel", card)
iconLbl.Size               = UDim2.new(1,0,0,56)
iconLbl.Position           = UDim2.new(0,0,0,16)
iconLbl.BackgroundTransparency = 1
iconLbl.Text               = "❄"
iconLbl.TextColor3         = C.Accent
iconLbl.Font               = Enum.Font.GothamBold
iconLbl.TextSize           = 40
iconLbl.ZIndex             = 12

local iRot = 0
local rotConn = RunService.Heartbeat:Connect(function(dt)
    iRot = iRot + dt * 20
    if iRot > 360 then iRot = iRot - 360 end
    iconLbl.Rotation = iRot
end)

-- Titolo
local titleLbl = Instance.new("TextLabel", card)
titleLbl.Size               = UDim2.new(1,0,0,26)
titleLbl.Position           = UDim2.new(0,0,0,76)
titleLbl.BackgroundTransparency = 1
titleLbl.Text               = "👺 !Tokyo Script  ·  v1.0"
titleLbl.TextColor3         = C.White
titleLbl.Font               = Enum.Font.GothamBold
titleLbl.TextSize           = 19
titleLbl.ZIndex             = 12

-- Sottotitolo
local subLbl = Instance.new("TextLabel", card)
subLbl.Size               = UDim2.new(1,0,0,18)
subLbl.Position           = UDim2.new(0,0,0,104)
subLbl.BackgroundTransparency = 1
subLbl.Text               = "Inserisci la key per accedere"
subLbl.TextColor3         = C.Dim
subLbl.Font               = Enum.Font.Gotham
subLbl.TextSize           = 12
subLbl.ZIndex             = 12

-- Divider
local div = Instance.new("Frame", card)
div.Size             = UDim2.new(0,340,0,1)
div.Position         = UDim2.new(0.5,-170,0,130)
div.BackgroundColor3 = C.Border
div.BorderSizePixel  = 0
div.ZIndex           = 12

-- ── INPUT BOX ──
local inputBg = Instance.new("Frame", card)
inputBg.Size             = UDim2.new(0,340,0,42)
inputBg.Position         = UDim2.new(0.5,-170,0,146)
inputBg.BackgroundColor3 = C.Panel
inputBg.BorderSizePixel  = 0
inputBg.ZIndex           = 12
Instance.new("UICorner", inputBg).CornerRadius = UDim.new(0,8)
local inputStroke = Instance.new("UIStroke", inputBg)
inputStroke.Color     = C.Border
inputStroke.Thickness = 1.5

local inputBox = Instance.new("TextBox", inputBg)
inputBox.Size               = UDim2.new(1,-14,1,0)
inputBox.Position           = UDim2.new(0,7,0,0)
inputBox.BackgroundTransparency = 1
inputBox.Text               = ""
inputBox.PlaceholderText    = "Incolla la tua key..."
inputBox.PlaceholderColor3  = C.Dim
inputBox.TextColor3         = C.Accent2
inputBox.Font               = Enum.Font.GothamBold
inputBox.TextSize           = 14
inputBox.ClearTextOnFocus   = false
inputBox.ZIndex             = 13

inputBox.Focused:Connect(function()
    TweenService:Create(inputStroke,TweenInfo.new(0.15),{Color=C.Accent}):Play()
    TweenService:Create(inputBg,TweenInfo.new(0.15),{BackgroundColor3=C.Hover}):Play()
end)
inputBox.FocusLost:Connect(function()
    TweenService:Create(inputStroke,TweenInfo.new(0.15),{Color=C.Border}):Play()
    TweenService:Create(inputBg,TweenInfo.new(0.15),{BackgroundColor3=C.Panel}):Play()
end)

-- ── STATUS ──
local statusLbl = Instance.new("TextLabel", card)
statusLbl.Size               = UDim2.new(1,-40,0,16)
statusLbl.Position           = UDim2.new(0,20,0,194)
statusLbl.BackgroundTransparency = 1
statusLbl.Text               = ""
statusLbl.TextColor3         = C.Dim
statusLbl.Font               = Enum.Font.Gotham
statusLbl.TextSize           = 11
statusLbl.ZIndex             = 12

local function SetStatus(msg, col)
    statusLbl.Text       = msg
    statusLbl.TextColor3 = col or C.Dim
end

-- ══════════════════════════════════════
-- BOTTONE LOGIN
-- ══════════════════════════════════════
local loginBtn = Instance.new("TextButton", card)
loginBtn.Size             = UDim2.new(0,220,0,42)
loginBtn.Position         = UDim2.new(0.5,-110,0,216)
loginBtn.BackgroundColor3 = C.Accent
loginBtn.Text             = "LOGIN"
loginBtn.TextColor3       = C.White
loginBtn.Font             = Enum.Font.GothamBold
loginBtn.TextSize         = 15
loginBtn.BorderSizePixel  = 0
loginBtn.ZIndex           = 12
Instance.new("UICorner", loginBtn).CornerRadius = UDim.new(0,10)
local lbGrad = Instance.new("UIGradient", loginBtn)
lbGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(55,130,255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(25,80,200)),
})
lbGrad.Rotation = 90

loginBtn.MouseEnter:Connect(function()
    TweenService:Create(loginBtn,TweenInfo.new(0.12),{BackgroundColor3=Color3.fromRGB(100,190,255)}):Play()
end)
loginBtn.MouseLeave:Connect(function()
    TweenService:Create(loginBtn,TweenInfo.new(0.12),{BackgroundColor3=C.Accent}):Play()
end)

-- ══════════════════════════════════════
-- BOTTONE GET KEY (in basso a destra)
-- ══════════════════════════════════════
local getKeyBtn = Instance.new("TextButton", card)
getKeyBtn.Size             = UDim2.new(0,110,0,32)
getKeyBtn.Position         = UDim2.new(1,-122,1,-44)
getKeyBtn.BackgroundColor3 = C.Discord
getKeyBtn.Text             = "Get Key"
getKeyBtn.TextColor3       = C.White
getKeyBtn.Font             = Enum.Font.GothamBold
getKeyBtn.TextSize         = 13
getKeyBtn.BorderSizePixel  = 0
getKeyBtn.ZIndex           = 12
Instance.new("UICorner", getKeyBtn).CornerRadius = UDim.new(0,8)
local gkGrad = Instance.new("UIGradient", getKeyBtn)
gkGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(100,120,255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(70, 85,220)),
})
gkGrad.Rotation = 90

getKeyBtn.MouseEnter:Connect(function()
    TweenService:Create(getKeyBtn,TweenInfo.new(0.12),{BackgroundColor3=Color3.fromRGB(110,130,255)}):Play()
end)
getKeyBtn.MouseLeave:Connect(function()
    TweenService:Create(getKeyBtn,TweenInfo.new(0.12),{BackgroundColor3=C.Discord}):Play()
end)

-- ── Toast "Copied Link" in basso a destra ──
local toast = Instance.new("Frame", SG)
toast.Size             = UDim2.new(0,140,0,36)
toast.Position         = UDim2.new(1,-154, 1, 10)  -- fuori schermo in basso
toast.BackgroundColor3 = C.Panel
toast.BorderSizePixel  = 0
toast.ZIndex           = 50
toast.BackgroundTransparency = 0.1
Instance.new("UICorner", toast).CornerRadius = UDim.new(0,8)
local toastStroke = Instance.new("UIStroke", toast)
toastStroke.Color     = C.AccentG
toastStroke.Thickness = 1.2

local toastLbl = Instance.new("TextLabel", toast)
toastLbl.Size               = UDim2.new(1,0,1,0)
toastLbl.BackgroundTransparency = 1
toastLbl.Text               = "✔  Copied Link"
toastLbl.TextColor3         = C.AccentG
toastLbl.Font               = Enum.Font.GothamBold
toastLbl.TextSize            = 13
toastLbl.ZIndex             = 51

local toastVisible = false
local function ShowToast()
    if toastVisible then return end
    toastVisible = true
    -- slide su
    TweenService:Create(toast, TweenInfo.new(0.28, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Position = UDim2.new(1,-154, 1,-50)
    }):Play()
    task.delay(2.2, function()
        TweenService:Create(toast, TweenInfo.new(0.22, Enum.EasingStyle.Quad), {
            Position = UDim2.new(1,-154, 1, 10)
        }):Play()
        task.wait(0.25)
        toastVisible = false
    end)
end

-- Click Get Key: copia discord e mostra toast
getKeyBtn.MouseButton1Click:Connect(function()
    pcall(function() setclipboard(DISCORD_INVITE) end)
    pcall(function() game:GetService("GuiService"):OpenBrowserWindow(DISCORD_INVITE) end)
    ShowToast()
end)

-- ══════════════════════════════════════
-- SHAKE su errore
-- ══════════════════════════════════════
local function ShakeCard()
    local orig = card.Position
    for i = 1,5 do
        local dir = i%2==0 and 7 or -7
        TweenService:Create(card,TweenInfo.new(0.055),{
            Position = UDim2.new(orig.X.Scale, orig.X.Offset+dir, orig.Y.Scale, orig.Y.Offset)
        }):Play()
        task.wait(0.06)
    end
    TweenService:Create(card,TweenInfo.new(0.1),{Position=orig}):Play()
end

-- ══════════════════════════════════════
-- WELCOME SCREEN
-- ══════════════════════════════════════
local function PlayWelcome(onDone)
    -- Fade out card
    TweenService:Create(card, TweenInfo.new(0.35,Enum.EasingStyle.Quad),{
        BackgroundTransparency = 1,
        Position = UDim2.new(0.5,-210, 0.5,-240),
    }):Play()
    for _,v in ipairs(card:GetChildren()) do
        if v:IsA("GuiObject") then
            TweenService:Create(v,TweenInfo.new(0.25),{BackgroundTransparency=1}):Play()
            if v:IsA("TextLabel") or v:IsA("TextButton") or v:IsA("TextBox") then
                TweenService:Create(v,TweenInfo.new(0.25),{TextTransparency=1}):Play()
            end
        end
    end
    task.wait(0.4)
    card:Destroy()

    -- Welcome card
    local wCard = Instance.new("Frame", SG)
    wCard.Size             = UDim2.new(0,0,0,0)
    wCard.Position         = UDim2.new(0.5,0,0.5,0)
    wCard.BackgroundColor3 = C.Bg
    wCard.BackgroundTransparency = 0.04
    wCard.BorderSizePixel  = 0
    wCard.ZIndex           = 20
    wCard.ClipsDescendants = true
    Instance.new("UICorner", wCard).CornerRadius = UDim.new(0,16)
    local ws = Instance.new("UIStroke", wCard)
    ws.Color     = C.AccentG
    ws.Thickness = 1.8

    -- top line verde
    local wtl = Instance.new("Frame", wCard)
    wtl.Size             = UDim2.new(1,0,0,2)
    wtl.BackgroundColor3 = C.AccentG
    wtl.BorderSizePixel  = 0; wtl.ZIndex=21
    local wtg = Instance.new("UIGradient", wtl)
    wtg.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0,150,80)),
        ColorSequenceKeypoint.new(0.5, C.AccentG),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0,150,80)),
    })

    -- Entrata
    TweenService:Create(wCard,TweenInfo.new(0.55,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{
        Size     = UDim2.new(0,400,0,300),
        Position = UDim2.new(0.5,-200,0.5,-150),
    }):Play()
    task.wait(0.3)

    -- Icona check
    local wIcon = Instance.new("TextLabel", wCard)
    wIcon.Size               = UDim2.new(1,0,0,70)
    wIcon.Position           = UDim2.new(0,0,0,18)
    wIcon.BackgroundTransparency = 1
    wIcon.Text               = "✔"
    wIcon.TextColor3         = C.AccentG
    wIcon.Font               = Enum.Font.GothamBold
    wIcon.TextSize           = 0
    wIcon.ZIndex             = 22

    TweenService:Create(wIcon,TweenInfo.new(0.45,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{
        TextSize = 52
    }):Play()
    task.wait(0.2)

    -- "Welcome"
    local wWelcome = Instance.new("TextLabel", wCard)
    wWelcome.Size               = UDim2.new(1,0,0,30)
    wWelcome.Position           = UDim2.new(0,0,0,96)
    wWelcome.BackgroundTransparency = 1
    wWelcome.Text               = "Welcome,"
    wWelcome.TextColor3         = C.Dim
    wWelcome.Font               = Enum.Font.Gotham
    wWelcome.TextSize           = 0
    wWelcome.ZIndex             = 22
    TweenService:Create(wWelcome,TweenInfo.new(0.3),{TextSize=16}):Play()
    task.wait(0.1)

    -- Username grande
    local wName = Instance.new("TextLabel", wCard)
    wName.Size               = UDim2.new(1,-40,0,40)
    wName.Position           = UDim2.new(0,20,0,122)
    wName.BackgroundTransparency = 1
    wName.Text               = USERNAME
    wName.TextColor3         = C.White
    wName.Font               = Enum.Font.GothamBold
    wName.TextSize           = 0
    wName.ZIndex             = 22
    TweenService:Create(wName,TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{
        TextSize = 30
    }):Play()
    task.wait(0.18)

    -- Sottotitolo
    local wSub = Instance.new("TextLabel", wCard)
    wSub.Size               = UDim2.new(1,0,0,20)
    wSub.Position           = UDim2.new(0,0,0,167)
    wSub.BackgroundTransparency = 1
    wSub.Text               = "Accesso concesso  ·  👺 !Tokyo Script v1.0"
    wSub.TextColor3         = C.Dim
    wSub.Font               = Enum.Font.Gotham
    wSub.TextSize           = 0
    wSub.ZIndex             = 22
    TweenService:Create(wSub,TweenInfo.new(0.3),{TextSize=12}):Play()
    task.wait(0.1)

    -- Barra di caricamento
    local barBg = Instance.new("Frame", wCard)
    barBg.Size             = UDim2.new(0,320,0,5)
    barBg.Position         = UDim2.new(0.5,-160,0,210)
    barBg.BackgroundColor3 = C.Panel
    barBg.BorderSizePixel  = 0; barBg.ZIndex=22
    Instance.new("UICorner", barBg).CornerRadius = UDim.new(1,0)

    local barFill = Instance.new("Frame", barBg)
    barFill.Size             = UDim2.new(0,0,1,0)
    barFill.BackgroundColor3 = C.AccentG
    barFill.BorderSizePixel  = 0; barFill.ZIndex=23
    Instance.new("UICorner", barFill).CornerRadius = UDim.new(1,0)
    local bfg = Instance.new("UIGradient", barFill)
    bfg.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(50,200,110)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(80,255,160)),
    })

    -- Loading label
    local loadLbl = Instance.new("TextLabel", wCard)
    loadLbl.Size               = UDim2.new(1,0,0,18)
    loadLbl.Position           = UDim2.new(0,0,0,224)
    loadLbl.BackgroundTransparency = 1
    loadLbl.Text               = "Caricamento script..."
    loadLbl.TextColor3         = C.Dim
    loadLbl.Font               = Enum.Font.Gotham
    loadLbl.TextSize           = 11
    loadLbl.ZIndex             = 22

    TweenService:Create(barFill,TweenInfo.new(1.4,Enum.EasingStyle.Quad),{
        Size = UDim2.new(1,0,1,0)
    }):Play()

    -- Dots animati
    local dots = 0
    local dotConn
    dotConn = RunService.Heartbeat:Connect(function()
        dots = dots + 1
        if dots % 30 == 0 then
            local d = dots/30
            loadLbl.Text = "Caricamento script" .. string.rep(".", (d%4)+1)
        end
    end)

    task.delay(1.5, function()
        dotConn:Disconnect()
        loadLbl.Text = "✔  Script avviato!"
        loadLbl.TextColor3 = C.AccentG

        task.wait(0.5)

        -- Fade out tutto
        TweenService:Create(wCard,TweenInfo.new(0.45,Enum.EasingStyle.Quad),{
            BackgroundTransparency = 1,
            Position = UDim2.new(0.5,-200, 0.5,-220),
        }):Play()
        TweenService:Create(overlay,TweenInfo.new(0.4),{BackgroundTransparency=1}):Play()
        for _, f in ipairs(flakes) do
            TweenService:Create(f.l,TweenInfo.new(0.3),{TextTransparency=1}):Play()
        end

        task.wait(0.5)
        snowConn:Disconnect()
        rotConn:Disconnect()
        SG:Destroy()
        if onDone then onDone() end
    end)
end

-- ══════════════════════════════════════
-- LOGICA LOGIN
-- ══════════════════════════════════════
local function TryLogin()
    local key = inputBox.Text:upper():gsub("%s","")
    if key == "" then
        SetStatus("✖  Inserisci una key", C.Red)
        task.spawn(ShakeCard)
        return
    end

    SetStatus("⏳ Verifica in corso...", C.Dim)
    loginBtn.Text   = "..."
    loginBtn.Active = false

    task.wait(0.7)

    if IsKeyValid(key) then
        SaveKey(key)
        PlayWelcome(function()
            -- ═══════════════════════════════════════════════════
            -- INSERISCI QUI IL CARICAMENTO DELLO SCRIPT PRINCIPALE
            -- es: loadstring(game:HttpGet("URL_SCRIPT"))()
            -- ═══════════════════════════════════════════════════
            print("👺 [!Tokyo Script v1.0] Accesso OK per " .. USERNAME)
        end)
    else
        loginBtn.Text   = "LOGIN"
        loginBtn.Active = true
        SetStatus("✖  Key non valida — ottieni la key dal Discord", C.Red)
        TweenService:Create(cardStroke,TweenInfo.new(0.12),{Color=C.Red}):Play()
        task.spawn(ShakeCard)
        task.delay(0.5, function()
            TweenService:Create(cardStroke,TweenInfo.new(0.35),{Color=C.Border}):Play()
        end)
    end
end

inputBox.FocusLost:Connect(function(enter) if enter then TryLogin() end end)
loginBtn.MouseButton1Click:Connect(TryLogin)

-- ══════════════════════════════════════
-- AUTO LOGIN (key già salvata)
-- ══════════════════════════════════════
task.spawn(function()
    task.wait(0.4)
    local saved = LoadKey()
    if IsKeyValid(saved) then
        SetStatus("✔  Key trovata — accesso automatico...", C.AccentG)
        inputBox.Text = saved
        task.wait(0.9)
        PlayWelcome(function()
            print("👺 [!Tokyo Script v1.0] Auto-login per " .. USERNAME)
        end)
    end
end)

print("👺 [!Tokyo Script v1.0] Key System Caricato!")
