-- [[ VARIABLES ]]

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local PlayerGui = Player.PlayerGui

local TweenService = game:GetService("TweenService")
local Tween_Infos = {
  Fade_In_Tween = TweenInfo.new(
    1, Enum.EasingStyle.Circular,
    Enum.EasingDirection.Out),
  Fade_In_Properties = {
    Image = {ImageTransparency = 0},
    Text = {TextTransparency = 0}
  },
  
  Fade_Out_Tween = TweenInfo.new(
    1.5, Enum.EasingStyle.Exponential,
    Enum.EasingDirection.InOut),
  Fade_Out_Properties = {
    Text = {TextTransparency = 1},
    Image = {ImageTransparency = 1}
  }
}

-- [[ FUNCTIONS ]]

local UI = {}
UI.__index = UI
local UI_Name = "Motif Notify"
local Handler = PlayerGui:FindFirstChild(UI_Name)

local Play = {}
Play.__index = Play

function Play:Tween(UI_Object: Instance, Tween, Properties, Children: boolean)
  if Children then
    for _, Labels in UI_Object:GetChildren() do
      if Labels:IsA("TextLabel") then
        local Opacity_Anim = TweenService:Create(Labels, Tween, Properties)
          Opacity_Anim:Play()
      end
    end
  end
  
  if not Children then
    local Opacity_Anim = TweenService:Create(UI_Object, Tween, Properties)
    Opacity_Anim:Play()
  end
end

function UI:Create()
  local ScreenGui = Instance.new("ScreenGui")
  ScreenGui.Name = UI_Name
  Handler = ScreenGui
  ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
  ScreenGui.Parent = PlayerGui
  
  local MainFrame = Instance.new("Frame")
  MainFrame.Name = "MainFrame"
  MainFrame.Size = UDim2.new(0, 238, 0, 316)
  MainFrame.Position = UDim2.new(0, 1060, 0, 225)
  MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
  MainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  MainFrame.BackgroundTransparency = 1
  MainFrame.BorderSizePixel = 0
  MainFrame.Parent = ScreenGui
  
  local UIListLayout = Instance.new("UIListLayout")
  UIListLayout.Parent = MainFrame
  
  local Image = Instance.new("ImageLabel")
  Image.Name = "Image"
  Image.Size = UDim2.new(1, 0, 0, 80)
  Image.ImageTransparency = 1
  Image.BackgroundTransparency = 1
  Image.Visible = false
  Image.BorderSizePixel = 0
  Image.Image = "rbxassetid://94350151984781"
  Image.Parent = MainFrame
  
  local TitleLabel = Instance.new("TextLabel")
  TitleLabel.Name = "TitleLabel"
  TitleLabel.Text = ""
  TitleLabel.Size = UDim2.new(0.2, 0, 0.3, 0)
  TitleLabel.Position = UDim2.new(0, 140, 0, 15)
  TitleLabel.AnchorPoint = Vector2.new(0.5, 0.5)
  TitleLabel.TextWrapped = false
  TitleLabel.TextTransparency = 1
  TitleLabel.BackgroundTransparency = 1
  TitleLabel.BorderSizePixel = 0
  TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
  TitleLabel.TextSize = 14
  TitleLabel.FontFace = Font.new(
    "rbxasset://fonts/families/AccanthisADFStd.json",
    Enum.FontWeight.Regular,
    Enum.FontStyle.Normal
  )
  TitleLabel.Parent = Image
  
  --// Description Label
  local DescLabel = Instance.new("TextLabel")
  DescLabel.Name = "DescLabel"
  DescLabel.Text = ""
  DescLabel.Size = UDim2.new(0.4, 0, 0.4, 0)
  DescLabel.Position = UDim2.new(0, 140, 0, 45)
  DescLabel.AnchorPoint = Vector2.new(0.5, 0.5)
  DescLabel.TextTransparency = 1
  DescLabel.BackgroundTransparency = 1
  DescLabel.BorderSizePixel = 0
  DescLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
  DescLabel.TextSize = 10
  DescLabel.TextWrapped = true
  DescLabel.FontFace = Font.new(
    "rbxasset://fonts/families/Inconsolata.json",
    Enum.FontWeight.Regular,
    Enum.FontStyle.Normal
  )
  DescLabel.Parent = Image
end

function UI:Init()
  if not Handler then
    UI:Create()
    print('UI Created')
  end
end

function UI:Typewrite(String, Label)
  task.spawn(function()
    local Substring = 1
    
    task.wait(0.25)
    for Letters = 1, #String do
      local New_Letter = string.sub(String, 1, Substring)
      
      Label.Text = New_Letter
      Substring += 1
      task.wait(0.1)
    end
  end)
  
  return task.wait(0.7)
end

function UI:Notify(Info: table)
  local New_Image = Handler["MainFrame"].Image:Clone()
  New_Image.Parent = Handler["MainFrame"]
  New_Image.Visible = true
  
  local New_Title = New_Image.TitleLabel
  New_Title.Parent = New_Image
  
  local New_Desc = New_Image.DescLabel
  New_Desc.Parent = New_Image
  
  task.spawn(function()
    Play:Tween(New_Image, Tween_Infos.Fade_In_Tween,
      Tween_Infos.Fade_In_Properties.Image)
    Play:Tween(New_Image, Tween_Infos.Fade_In_Tween,
      Tween_Infos.Fade_In_Properties.Text, true)
    UI:Typewrite(Info.Title, New_Title)
    UI:Typewrite(Info.Description, New_Desc)
    
    while New_Title.Text ~= Info.Title do task.wait() end
    
    warn("Passed title")
    
    while New_Desc.Text ~= Info.Description do task.wait() end
    
    warn("Passed desc")
    
    task.wait(Info.Duration)
    
    Play:Tween(New_Image, Tween_Infos.Fade_Out_Tween,
      Tween_Infos.Fade_Out_Properties.Image)
    Play:Tween(New_Image, Tween_Infos.Fade_Out_Tween,
      Tween_Infos.Fade_Out_Properties.Text, true)
    
    New_Image:GetPropertyChangedSignal("ImageTransparency"):Connect(function()
      if New_Image.ImageTransparency >= 0.9 then New_Image:Destroy() end
    end)
    
  end)
end

UI:Init()

return UI
