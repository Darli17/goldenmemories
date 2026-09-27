local repo = "https://raw.githubusercontent.com/NightForRoblox/Obsidian/main/"
local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()

local Options = Library.Options
local Toggles = Library.Toggles
local Sliders = Library.Sliders

Library.ForceCheckbox = false 
Library.ShowToggleFrameInKeybinds = true 
Library.ShowCustomCursor = false

local Window = Library:CreateWindow({
	Title = "",
	Footer = "oblivion v1.0 [alpha]",
	Icon = 123666453981716,
  IconSize = UDim2.fromOffset(115, 57),
	NotifySide = "Right",
	ShowCustomCursor = true,
})

local Tabs = {
	Player = Window:AddTab("Player", "circle-user-round"),
	Products = Window:AddTab("Products", "user"),
	["UI Settings"] = Window:AddTab("UI Settings", "settings"),
}

local PlayerBox = Tabs["Player"]:AddLeftGroupbox("Player", "wrench")

local walkspeedSlider = PlayerBox:AddSlider("walkspeedSlider", {
    Text = "WalkSpeed:",
    Default = 16,
    Min = 16,
    Max = 500,
    Rounding = 0,

		Callback = function(Value)
			local plr = game.Players.LocalPlayer.Character
			plr.Humanoid.WalkSpeed = Value
		end
})
local jumppowerSlider = PlayerBox:AddSlider("jumppowerSlider", {
    Text = "JumpPower:",
    Default = 50,
    Min = 50,
    Max = 500,
    Rounding = 0,

		Callback = function(Value)
			local plr = game.Players.LocalPlayer.Character
			plr.Humanoid.JumpPower = Value
		end
})

speeds = 1
 
local speaker = game:GetService("Players").LocalPlayer
 
local chr = game.Players.LocalPlayer.Character
local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
 
nowe = false
 
game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function(char)
	wait(0.7)
	game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
	game.Players.LocalPlayer.Character.Animate.Disabled = false
 
end)

local flyToggle = PlayerBox:AddToggle("flyToggle", {
    Text = "Enable Fly",
    Default = false,

		Callback = function(Value)
			 
	if nowe == true then
		nowe = false
 
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming,true)
		speaker.Character.Humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
	else 
		nowe = true
 
 
 
		for i = 1, speeds do
			spawn(function()
 
				local hb = game:GetService("RunService").Heartbeat	
 
 
				tpwalking = true
				local chr = game.Players.LocalPlayer.Character
				local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
				while tpwalking and hb:Wait() and chr and hum and hum.Parent do
					if hum.MoveDirection.Magnitude > 0 then
						chr:TranslateBy(hum.MoveDirection)
					end
				end
 
			end)
		end
		game.Players.LocalPlayer.Character.Animate.Disabled = true
		local Char = game.Players.LocalPlayer.Character
		local Hum = Char:FindFirstChildOfClass("Humanoid") or Char:FindFirstChildOfClass("AnimationController")
 
		for i,v in next, Hum:GetPlayingAnimationTracks() do
			v:AdjustSpeed(0)
		end
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming,false)
		speaker.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
	end
 
 
 
 
 
		local plr = game.Players.LocalPlayer
		local UpperTorso = plr.Character.LowerTorso
		local flying = true
		local deb = true
		local ctrl = {f = 0, b = 0, l = 0, r = 0}
		local lastctrl = {f = 0, b = 0, l = 0, r = 0}
		local maxspeed = 50
		local speed = 0
 
 
		local bg = Instance.new("BodyGyro", UpperTorso)
		bg.P = 9e4
		bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
		bg.cframe = UpperTorso.CFrame
		local bv = Instance.new("BodyVelocity", UpperTorso)
		bv.velocity = Vector3.new(0,0.1,0)
		bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
		if nowe == true then
			plr.Character.Humanoid.PlatformStand = true
		end
		while nowe == true or game:GetService("Players").LocalPlayer.Character.Humanoid.Health == 0 do
			wait()
 
			if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
				speed = speed+.5+(speed/maxspeed)
				if speed > maxspeed then
					speed = maxspeed
				end
			elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
				speed = speed-1
				if speed < 0 then
					speed = 0
				end
			end
			if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
				bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
				lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
			elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
				bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
			else
				bv.velocity = Vector3.new(0,0,0)
			end
 
			bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
		end
		ctrl = {f = 0, b = 0, l = 0, r = 0}
		lastctrl = {f = 0, b = 0, l = 0, r = 0}
		speed = 0
		bg:Destroy()
		bv:Destroy()
		plr.Character.Humanoid.PlatformStand = false
		game.Players.LocalPlayer.Character.Animate.Disabled = false
		tpwalking = false
		end
})
	:AddKeyPicker("flyKeybind", {
			Text = "Fly",
			Default = "F",
			Mode = "Toggle",
			SyncToggleState = true,
	})

local flyspeedSlider = PlayerBox:AddSlider("flyspeedSlider", {
    Text = "Fly Speed: ",
    Default = 1,
    Min = 0.1,
    Max = 5,
    Rounding = 0.1,

		Callback = function(Value)
	speeds = speeds + Value
	if nowe == true then
 
 
	tpwalking = false
	for i = 1, speeds do
		spawn(function()
 
			local hb = game:GetService("RunService").Heartbeat	
 
 
			tpwalking = true
			local chr = game.Players.LocalPlayer.Character
			local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
			while tpwalking and hb:Wait() and chr and hum and hum.Parent do
				if hum.MoveDirection.Magnitude > 0 then
					chr:TranslateBy(hum.MoveDirection)
				end
			end
 
		end)
		end
		end
		end
})

local character = game.Players.LocalPlayer.Character

local noclipToggle = PlayerBox:AddToggle("noclipToggle", {
    Text = "Enable Noclip",
    Default = false,

		Callback = function(Value)
				if Value == true then
					character.LowerTorso.CanCollide = false
					character.UpperTorso.CanCollide = false
					character.HumanoidRootPart.CanCollide = false
					else
					character.LowerTorso.CanCollide = true
					character.UpperTorso.CanCollide = true
					character.HumanoidRootPart.CanCollide = true
				end
		end
})
	:AddKeyPicker("noclipKeybind", {
			Text = "Noclip",
			Default = "N",
			Mode = "Toggle",
			SyncToggleState = true,
	})

local MarketplaceService = game:GetService("MarketplaceService")

local success, result = pcall(function()
    return MarketplaceService:GetDeveloperProductsAsync()
end)

--[[

if success then
    for _, product in pairs(result:GetCurrentPage()) do
        local ProductBox = Tabs.Products:AddLeftGroupbox(product.Name, "boxes")
        local ProductName = ProductBox:AddLabel("Product Name: "..product.Name, false)
        local ProductDesc = ProductBox:AddLabel("Product Desc: "..product.Description, false)
        local ProductImage = ProductBox:AddImage("ProductImage", {
            Image = "rbxassetid://"..product.IconImageAssetId,
            Transparency = 0,
            Color = Color3.new(1, 1, 1),
            RectOffset = Vector2.zero,
            RectSize = Vector2.zero,
            ScaleType = Enum.ScaleType.Fit,
            Height = 200,
        })
      local ProductID = ProductBox:AddLabel("Product ID: "..product.ProductId, false)
		  ProductBox:AddButton("Copy ProductID", function()
          setclipboard(tostring(product.ProductId))
          Library:Notify({
              Title = "Product Viewer",
              Description = "ProductID successfully copied to clipboard!",
              Time = 4,
          })
		  end)
      local ProductIsForSale = ProductBox:AddLabel("Is Product For Sale: "..tostring(product.IsForSale), false)
      local ProductPrice = ProductBox:AddLabel("Product Price: "..tostring(product.PriceInRobux), false)
      ProductBox:AddDivider("Divider")
      local ProductCreated = ProductBox:AddLabel("Product Created: "..tostring(product.Created), false)
      local ProductUpdated = ProductBox:AddLabel("Product Last Update: "..tostring(product.Updated), false)
      ProductBox:AddDivider("Divider")
	    ProductBox:AddButton({
	      Text = "Fire Buy Prompt",
	      Func = function()
	        local args = {
	          product.ProductId,
	          	"Product"
	          }
	        	workspace:WaitForChild("PromptRobuxEvent"):InvokeServer(unpack(args))
				  end
	      })
			end
    end
else
    ProductBox:AddDivider("Divider")
    ProductBox:UpdateWarningBox({
      Title = "Product ???",
      Text = "Failed to load product!",
      IsNormal = false, -- Error Box = false, Normal Box = true
      Visible = true,
      LockSize = true,
    })
end

]]

local MenuGroup = Tabs["UI Settings"]:AddLeftGroupbox("Menu", "wrench")

MenuGroup:AddToggle("KeybindMenuOpen", {
	Default = Library.KeybindFrame.Visible,
	Text = "Open Keybind Menu",
	Callback = function(value)
		Library.KeybindFrame.Visible = value
	end,
})
MenuGroup:AddDropdown("NotificationSide", {
	Values = { "Left", "Right" },
	Default = "Right",

	Text = "Notification Side",

	Callback = function(Value)
		Library:SetNotifySide(Value)
	end,
})
MenuGroup:AddDropdown("DPIDropdown", {
	Values = { "50%", "75%", "100%", "125%", "150%", "175%", "200%" },
	Default = "100%",

	Text = "DPI Scale",

	Callback = function(Value)
		Value = Value:gsub("%%", "")
		local DPI = tonumber(Value)

		Library:SetDPIScale(DPI)
	end,
})
MenuGroup:AddDivider()
MenuGroup:AddLabel("Menu bind")
	:AddKeyPicker("MenuKeybind", { Default = "P", NoUI = true, Text = "Menu keybind" })

MenuGroup:AddButton("Unload", function()
	Library:Unload()
end)

Library.ToggleKeybind = Options.MenuKeybind -- Allows you to have a custom keybind for the menu

-- Addons:
-- SaveManager (Allows you to have a configuration system)
-- ThemeManager (Allows you to have a menu theme system)

-- Hand the library over to our managers
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

-- Ignore keys that are used by ThemeManager.
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings()

-- Adds our MenuKeybind to the ignore list
-- (do you want each config to have a different menu key? probably not.)
SaveManager:SetIgnoreIndexes({ "MenuKeybind" })

-- use case for doing it this way:
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
ThemeManager:SetFolder("MyScriptHub")
SaveManager:SetFolder("MyScriptHub/specific-game")
SaveManager:SetSubFolder("specific-place") -- if the game has multiple places inside of it (for example: DOORS)
-- you can use this to save configs for those places separately
-- The path in this script would be: MyScriptHub/specific-game/settings/specific-place
-- [ This is optional ]

-- Builds our config menu on the right side of our tab
SaveManager:BuildConfigSection(Tabs["UI Settings"])

-- Builds our theme menu (with plenty of built in themes) on the left side
-- NOTE: you can also call ThemeManager:ApplyToGroupbox to add it to a specific groupbox
ThemeManager:ApplyToTab(Tabs["UI Settings"])

-- You can use the SaveManager:LoadAutoloadConfig() to load a config
-- which has been marked to be one that auto loads!
SaveManager:LoadAutoloadConfig()
