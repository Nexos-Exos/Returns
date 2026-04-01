--[[
 d888b  db    db d888888b      .d888b.      db      db    db  .d8b.
88' Y8b 88    88   `88'        VP  `8D      88      88    88 d8' `8b
88      88    88    88            odD'      88      88    88 88ooo88
88  ooo 88    88    88          .88'        88      88    88 88~~~88
88. ~8~ 88b  d88   .88.        j88.         88booo. 88b  d88 88   88   @uniquadev
 Y888P  ~Y8888P' Y888888P      888888D      Y88888P ~Y8888P' YP   YP  CONVERTER

Designed using LocalMaze GUI Creator
]]--

local GUI = {}
GUI.Order = 0

local Players = game:GetService("Players")
local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")

GUI.ScreenGui = Instance.new("ScreenGui")
GUI.ScreenGui.Parent = PlayerGui
GUI.ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

GUI.Toggle = Instance.new("TextButton")
GUI.Toggle.Name = "Toggle"
GUI.Toggle.Parent = GUI.ScreenGui

local ToggleCorner = Instance.new("UICorner", GUI.Toggle)
local ToggleStroke = Instance.new("UIStroke")
ToggleStroke.Parent = GUI.Toggle
ToggleStroke.Thickness = 2
ToggleStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
ToggleStroke.Color = Color3.fromRGB(143, 143, 143)

GUI.Toggle.Text = "Toggle [OFF]"
GUI.Toggle.TextSize = 12
GUI.Toggle.FontFace = Font.new(
  "rbxasset://fonts/families/Zekton.json",
  Enum.FontWeight.Regular,
  Enum.FontStyle.Normal
)
GUI.Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
GUI.Toggle.TextStrokeTransparency = 0

GUI.Toggle.Size = UDim2.new(0.1, 0, 0.1, 0)
GUI.Toggle.Position = UDim2.new(0.5, 500, 0.5, 0)
GUI.Toggle.AnchorPoint = Vector2.new(0.5, 0.5)

GUI.Toggle.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
GUI.Toggle.BorderSizePixel = 0

GUI.Toggle.MouseButton1Click:Connect(function()
  if GUI.Toggle.Text == "Toggle [OFF]" then
    GUI.Toggle.Text = "Toggle [ON]"
    GUI.Main.Visible = not GUI.Main.Visible
    else
      GUI.Toggle.Text = "Toggle [OFF]"
      GUI.Main.Visible = not GUI.Main.Visible
  end
end)

GUI.Main = Instance.new("Frame")
GUI.Main.Name = "Main"
GUI.Main.Parent = GUI.ScreenGui

GUI.Main.Visible = false

GUI.Main.Size = UDim2.new(0.35, 0, 0.7, 0)
GUI.Main.Position = UDim2.new(0.5, 0, 0.5, 0)
GUI.Main.AnchorPoint = Vector2.new(0.5, 0.5)

GUI.Main.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
GUI.Main.BorderColor3 = Color3.fromRGB(255, 255, 255)

GUI.Tab = Instance.new("Frame")
GUI.Tab.Name = "Tab"
GUI.Tab.Parent = GUI.Main

GUI.Tab.Size = UDim2.new(1, -20, 1, -20)
GUI.Tab.Position = UDim2.new(0.5, 0, 0.5, 0)
GUI.Tab.AnchorPoint = Vector2.new(0.5, 0.5)

GUI.Tab.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
GUI.Tab.BorderColor3 = Color3.fromRGB(255, 255, 255)

local padding = Instance.new("UIPadding")
padding.Parent = GUI.Tab
padding.PaddingLeft = UDim.new(0, 20)
padding.PaddingBottom = UDim.new(0, 100)

local layout = Instance.new("UIListLayout")
layout.Parent = GUI.Tab
layout.Wraps = true
layout.Padding = UDim.new(0.05, 0)
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.FillDirection = Enum.FillDirection.Horizontal

function GUI:Button(Info: Table)
  GUI.Order += 1
  
  local Button = Instance.new("TextButton")
  Button.Parent = GUI.Tab
  Button.Name = Info.Text
  Button.LayoutOrder = GUI.Order
  Button.Size = UDim2.new(0.2, 0, 0.3, 0)
  Button.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
  Button.BackgroundTransparency = 0.3
  Button.TextColor3 = Color3.fromRGB(255, 255, 255)
  Button.TextSize = 12
  Button.Text = Info.Text
  Button.TextWrapped = true
  Button.TextStrokeTransparency = 0
  Button.RichText = true
  Button.BorderSizePixel = 0
  Button.FontFace = Font.new(
    "rbxasset://fonts/families/Guru.json",
    Enum.FontWeight.Regular,
    Enum.FontStyle.Normal
  )
  
  Button.MouseButton1Click:Connect(Info.Callback)
end

return GUI
