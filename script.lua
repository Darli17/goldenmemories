while not game:IsLoaded() or not game:GetService("CoreGui") or not game:GetService("Players").LocalPlayer or not game:GetService("Players").LocalPlayer.PlayerGui do wait() end

local mouse = game.Players.LocalPlayer:GetMouse()
local plr = game.Players.LocalPlayer

getgenv().LegacySettings = ({
    Year = 2016,
    OldGraphics = true,
    HideDisplayName = true,
    SafeChat = false,
    OldConsole = true,
    OldBubbleChat = true,
})
getgenv().LegacyCursorSettings = ({
  OldCursor = true, -- you can use bloxstrap for better nostalgia
})

if LegacyCursorSettings.OldCursor == true then
  mouse.Icon = "rbxasset://textures/ArrowCursor.png"
  else
  mouse.Icon = mouse.Icon
end

local function oldgui()
    -- old gold gui

    local goldgui = plr.PlayerGui:WaitForChild("GoldGui")
    goldgui.Frame.Background.UICorner.CornerRadius = UDim.new(0,6)
    goldgui.Frame.Background.Background.Visible = false
    goldgui.Frame.Background.BackgroundColor3 = Color3.new(0,0,0)
    goldgui.Frame.Background.BackgroundTransparency = 0.3
    goldgui.Frame.GoldImage.Image = "rbxassetid://88785230043456"
    goldgui.Frame.GoldImage.ResampleMode = "Pixelated"
    goldgui.Frame.GoldImage.UIAspectRatioConstraint.AspectRatio = "0.8899999856948853"
    goldgui.Frame.GoldImage.Size = UDim2.new(0.200000018, 0, 1.32000005, 0)
    goldgui.Frame.GoldImage.Position = UDim2.new(0.0759999976, 0, 1, 0)

    -- old menu button

    local shopgui = plr.PlayerGui:WaitForChild("ShopGui")
    local sideframe = shopgui.SideFrame 

    sideframe.MenuButton.Image = "rbxassetid://84212143429429"
    sideframe.MenuButton.UIAspectRatioConstraint.AspectRatio = 1.100000023841858
    sideframe.MenuButton.Size = UDim2.new(0.879999995, 0, 0.400000036, 0)
    sideframe.MenuButton.TextLabel.Visible = false

    local menuistroke = Instance.new("UIStroke")
    menuistroke.Parent = sideframe.MenuButton

    -- old launch button

    local launchgui = plr.PlayerGui:WaitForChild("LaunchBoatGui")
    launchgui.LaunchFrame.LaunchBoat.Image = "rbxassetid://108770684976507"
    launchgui.LaunchFrame.LaunchBoat.TextLabel.Visible = false

    -- old buttons view

    local listlayout = Instance.new("UIListLayout")
    listlayout.Parent = sideframe
    listlayout.HorizontalAlignment = "Center"
    listlayout.SortOrder = "LayoutOrder"

    -- add other buttons

    local shopgui = plr.PlayerGui:WaitForChild("ShopGui")
    local sideframe = shopgui.SideFrame 
    local function createbutton(image, name, layout)
      local example = sideframe.MenuButton:Clone()
      example.Parent = sideframe
      example.Image = image
      example.Name = name
      example.LayoutOrder = layout
    end

    createbutton("rbxassetid://117957966633160", "TeamsButton", 2)
    createbutton("rbxassetid://138806241974209", "GoldButton", 1)
end

loadstring(game:HttpGet("https://raw.githubusercontent.com/yeku/legacy/refs/heads/main/Source.luau"))()
task.wait(0.3)
game.CoreGui.NewRobloxGui.PlayerListContainer:Destroy()

local resetgui = true
local taskwhile = true

while task.wait(0.05) do
    if plr.PlayerGui:WaitForChild("GoldGui").Frame.GoldImage.Image == "http://www.roblox.com/asset/?id=5445557932" and taskwhile == true then
      print("resetgui = true")
      resetgui = true
      print("taskwhile = false")
      taskwhile = false
    else
      if resetgui == true then
        oldgui()
        print("taskwhile = true")
        taskwhile = true
        print("resetgui = false")
        resetgui = false
      end
    end
end
