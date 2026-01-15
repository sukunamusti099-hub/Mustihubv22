local lp = game.Players.LocalPlayer
local TS = game:GetService("TweenService")
local sg = Instance.new("ScreenGui", lp.PlayerGui)
sg.Name = "MustiHub_V10"; sg.IgnoreGuiInset = true; sg.ResetOnSpawn = false

local TargetPos = nil

-- --- [ 🎬 GHOST EKRAN EFEKTİ ] ---
local function PlayTransition()
    local canvas = Instance.new("Frame", sg)
    canvas.Size = UDim2.new(1, 0, 1, 0)
    canvas.BackgroundColor3 = Color3.new(0, 0, 0)
    canvas.ZIndex = 1000

    local mainLabel = Instance.new("TextLabel", canvas)
    mainLabel.Size = UDim2.new(1, 0, 0, 60); mainLabel.Position = UDim2.new(0, 0, 0.45, -30)
    mainLabel.BackgroundTransparency = 1; mainLabel.Text = "MUSTI HUB STEAL"
    mainLabel.TextColor3 = Color3.fromRGB(255, 0, 0); mainLabel.Font = Enum.Font.Code; mainLabel.TextSize = 55

    local dcLabel = Instance.new("TextLabel", canvas)
    dcLabel.Size = UDim2.new(1, 0, 0, 30); dcLabel.Position = UDim2.new(0, 0, 0.55, 0)
    dcLabel.BackgroundTransparency = 1; dcLabel.Text = "https://discord.gg/GfHwSpEr"
    dcLabel.TextColor3 = Color3.new(1, 1, 1); dcLabel.Font = Enum.Font.Code; dcLabel.TextSize = 25

    task.wait(0.9)
    canvas:Destroy()
end

-- --- [ ⚙️ ANA MENÜ ] ---
local main = Instance.new("Frame", sg)
main.Size = UDim2.new(0, 160, 0, 180); main.Position = UDim2.new(0, 50, 0.4, 0)
main.BackgroundColor3 = Color3.fromRGB(10, 10, 10); main.Active = true; main.Draggable = true
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 10)
local stroke = Instance.new("UIStroke", main); stroke.Color = Color3.new(1, 0, 0); stroke.Thickness = 2

local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, 0, 0, 30); title.Text = "MUSTI HUB V10"; title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundColor3 = Color3.new(1, 0, 0); title.Font = "Code"; title.TextSize = 16; Instance.new("UICorner", title)

local function CreateBtn(txt, y, func, color)
    local b = Instance.new("TextButton", main)
    b.Size = UDim2.new(0.9, 0, 0, 35); b.Position = UDim2.new(0.05, 0, 0, y)
    b.Text = txt; b.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    b.TextColor3 = color or Color3.new(1, 1, 1); b.Font = "Code"; b.TextSize = 14
    Instance.new("UICorner", b); b.MouseButton1Click:Connect(func)
end

CreateBtn("SAVE POSITION", 40, function() 
    if lp.Character then TargetPos = lp.Character.HumanoidRootPart.Position end 
end)

CreateBtn("TP FORWARD", 85, function() 
    if lp.Character then lp.Character.HumanoidRootPart.CFrame *= CFrame.new(0, 0, -20) end 
end)

CreateBtn("GHOST SWEEP", 130, function()
    if lp.Character and TargetPos then
        task.spawn(PlayTransition)
        task.wait(0.3)
        local hrp = lp.Character.HumanoidRootPart
        local old = hrp.CFrame
        hrp.CFrame = CFrame.new(TargetPos)
        task.wait(0.3)
        hrp.CFrame = old
    end
end, Color3.new(1, 0, 0))
