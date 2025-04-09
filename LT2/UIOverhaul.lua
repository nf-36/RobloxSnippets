local UI = game:GetService("Players").LocalPlayer.PlayerGui
local MoneyDisplay = UI.MoneyDisplayGui

local elements = game.HttpService:JSONDecode(game:HttpGet("https://pastebin.com/raw/qVrRbPdr"))

for i, element in pairs(elements) do
    local parts = {}
    for part in string.gmatch(i, "([^%.]+)") do
        table.insert(parts, part)
    end

    local instance = game:GetService("Players").LocalPlayer
    for _, part in ipairs(parts) do
        instance = instance:FindFirstChild(part)
        if not instance then
            warn("Could not find instance: " .. part)
            break
        end
    end

    if instance and instance:IsA("Frame") then
        local colorValues = {}
        for value in string.gmatch(element.BackgroundColor, "([^,]+)") do
            table.insert(colorValues, tonumber(value))
        end
        
        if #colorValues == 3 then 
            instance.BackgroundColor3 = Color3.new(colorValues[1], colorValues[2], colorValues[3])
        end

        if type(element.BackgroundTransparency) == "number" then
            instance.BackgroundTransparency = element.BackgroundTransparency
        end
    elseif instance and instance:IsA("TextLabel") then
        local colorValues = {}
        for value in string.gmatch(element.TextColor, "([^,]+)") do
            table.insert(colorValues, tonumber(value))
        end
        
        if #colorValues == 3 then 
            instance.TextColor3 = Color3.new(colorValues[1], colorValues[2], colorValues[3])
        end
        local colorValues2 = {}
        for value in string.gmatch(element.BackgroundColor, "([^,]+)") do
            table.insert(colorValues2, tonumber(value))
        end
        
        if #colorValues2 == 3 then 
            instance.BackgroundColor3 = Color3.new(colorValues2[1], colorValues2[2], colorValues2[3])
        end
    elseif instance and instance:IsA("TextButton") then
        local colorValues = {}
        for value in string.gmatch(element.TextColor, "([^,]+)") do
            table.insert(colorValues, tonumber(value))
        end

        if #colorValues == 3 then 
            instance.TextColor3 = Color3.new(colorValues[1], colorValues[2], colorValues[3])
        end
        local colorValues2 = {}
        for value in string.gmatch(element.BackgroundColor, "([^,]+)") do
            table.insert(colorValues2, tonumber(value))
        end

        if #colorValues2 == 3 then 
            instance.BackgroundColor3 = Color3.new(colorValues2[1], colorValues2[2], colorValues2[3])
        end
    end
end




local Menu = UI.MenuGUI

MoneyDisplay.Text.DropShadow.Visible = false
MoneyDisplay.Text.DropShadow.TextColor3 = Color3.new(0,0,0)
MoneyDisplay.Text.DropShadow.TextScaled = true

if MoneyDisplay.Text:FindFirstChild("UIStroke") == nil then
    local UIStroke = Instance.new("UIStroke",MoneyDisplay.Text)
    UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
    UIStroke.Color = Color3.new(0,0,0)
end

MoneyDisplay.Text.BackgroundColor3 = Color3.new(0, 0, 0)
MoneyDisplay.Text.BackgroundTransparency = 0.7
MoneyDisplay.Text.TextScaled = true


for i, textlabel in pairs(UI:GetDescendants()) do
    if textlabel:IsA("TextLabel") then
        textlabel.Font = Enum.Font.Roboto
    end
end

for i, DropShadow in pairs(UI:GetDescendants()) do
    if DropShadow.Name == "DropShadow" then
        DropShadow.BackgroundTransparency = .5
    end
end

if MoneyDisplay.Text:FindFirstChild("UICorner") == nil then
	local UICorner = Instance.new("UICorner", MoneyDisplay.Text)
end

-- MENU BUTTON --
if Menu.Open:FindFirstChild("UICorner") == nil then
	local UICorner = Instance.new("UICorner", Menu.Open)
    UICorner.CornerRadius = UDim.new(0,7)
end

if Menu.Open.DropShadow:FindFirstChild("UICorner") == nil then
	local UICorner = Instance.new("UICorner", Menu.Open.DropShadow)
	UICorner.CornerRadius = UDim.new(0,7)
end
-- MENU BUTTON --

-- MENU UI--
if Menu.Menu.Main:FindFirstChild("UICorner") == nil then
	local UICorner = Instance.new("UICorner", Menu.Menu.Main)
	UICorner.CornerRadius = UDim.new(0,20)
end

if Menu.Menu.Main.DropShadow:FindFirstChild("UICorner") == nil then
	local UICorner = Instance.new("UICorner", Menu.Menu.Main.DropShadow)
	UICorner.CornerRadius = UDim.new(0,20)
end

if Menu.Menu.Quit:FindFirstChild("UICorner") == nil then
	local UICorner = Instance.new("UICorner", Menu.Menu.Quit)
	UICorner.CornerRadius = UDim.new(0,20)
end
if Menu.Menu.Quit.DropShadow:FindFirstChild("UICorner") == nil then
	local UICorner = Instance.new("UICorner", Menu.Menu.Quit.DropShadow)
	UICorner.CornerRadius = UDim.new(0,20)
end

for i, button in pairs(Menu.Menu.Main.MenuItems:GetChildren()) do
    if button:IsA("TextButton") then
        if button:FindFirstChild("UICorner") == nil then
            local UICorner = Instance.new("UICorner", button)
            UICorner.CornerRadius = UDim.new(0,7)
        end
        if button.TextLabel:FindFirstChild("UICorner") == nil then
            local UICorner = Instance.new("UICorner", button.TextLabel)
            UICorner.CornerRadius = UDim.new(0,7)
        end
    end
end

if MoneyDisplay.Text:FindFirstChild("UIPadding") == nil then
	local UIPadding = Instance.new("UIPadding", MoneyDisplay.Text)
	UIPadding.PaddingBottom = UDim.new(0,5)
	UIPadding.PaddingTop = UDim.new(0,5)
	UIPadding.PaddingRight = UDim.new(0,5)
	UIPadding.PaddingLeft = UDim.new(0,5)
end

