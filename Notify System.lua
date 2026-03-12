--[[
GUI created with LocalMaze GUI Creator

Raw Url: https://raw.githubusercontent.com/Nexos-Exos/Returns/refs/heads/main/Notify%20System.lua
]]

-- [[ VARIABLES ]]

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

local TweenService = game:GetService("TweenService")
local Tween_Infos = {
  Size_Tween = TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
  Size_Properties = {
    Size = UDim2.new(1, 0, 0.3, 0)
  },
  
  Opacity_Tween = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.In),
  Opacity_Properties = {
    TextTransparency = 1
  }
}

-- [[ UI ]]

local UI = {}
local Handler = PlayerGui:FindFirstChild("Notify_Holder")
UI.__index = UI

function UI:Create()
  ScreenGUI = Instance.new("ScreenGui")
  Handler = ScreenGUI
  ScreenGUI.Name = "Notify_Holder"
  ScreenGUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
  ScreenGUI.Parent = PlayerGui
    
  Main_Frame = Instance.new("Frame")
  Main_Frame.Name = "Main Frame"
  Main_Frame.AnchorPoint = Vector2.new(0.5, 0.5)
  Main_Frame.Size = UDim2.new(0, 238, 0, 316)
  Main_Frame.Position = UDim2.new(0, 1050, 0, 225)
  Main_Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  Main_Frame.BackgroundTransparency = 1
  Main_Frame.BorderSizePixel = 0
  Main_Frame.Parent = ScreenGUI
  
  List_Layout = Instance.new("UIListLayout")
  List_Layout.VerticalAlignment = Enum.VerticalAlignment.Bottom
  List_Layout.Parent = Main_Frame
    
  Label = Instance.new("TextLabel")
  Label.Name = "Label"
  Label.Size = UDim2.new(0, 0, 0, 0)
  Label.Position = UDim2.new(0, 4, 0, 4)
  Label.TextScaled = true
  Label.TextTransparency = 1
  Label.BackgroundTransparency = 1
  Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  Label.BorderSizePixel = 0
  Label.TextSize = 24
  Label.TextColor3 = Color3.fromRGB(255, 255, 255)
  Label.FontFace = Font.new(
    "rbxasset://fonts/families/PressStart2P.json",
    Enum.FontWeight.Regular,
    Enum.FontStyle.Normal
  )
  Label.Parent = Main_Frame
end

function UI:Init()
  if not Handler then
    UI:Create()
    print('UI Created')
  end
end

function UI:Notify(Text: string, Duration: number)
  local New_Label = Handler["Main Frame"].Label:Clone()
  New_Label.Text = Text
  New_Label.TextTransparency = 0
  New_Label.Parent = Handler["Main Frame"]
    
  task.spawn(function()
    local Size_Anim = TweenService:Create(
      New_Label, Tween_Infos.Size_Tween,
      Tween_Infos.Size_Properties)
    Size_Anim:Play()
      
    task.wait(Duration)
      
    local Opacity_Anim = TweenService:Create(
      New_Label, Tween_Infos.Opacity_Tween,
      Tween_Infos.Opacity_Properties)
    Opacity_Anim:Play()
      
    Opacity_Anim.Completed:Connect(function()
      New_Label:Destroy()
    end)
    
  end)
end

-- [[ FUNCTIONS ]]

UI:Init()

return UI
