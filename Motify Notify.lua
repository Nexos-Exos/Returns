-- [[ VARIABLES ]]

if not isfile("Motify Frame.jpg") then
  local Encoded_Image = game:HttpGet("https://raw.githubusercontent.com/Nexos-Exos/Returns/refs/heads/main/image.txt")
  writefile("Motify Frame.jpg", base64decode(Encoded_Image))
end

local OutputMessage=loadstring(game:HttpGet("https://raw.githubusercontent.com/Nexos-Exos/Returns/refs/heads/main/Fancy%20Print.lua"))()

local getcustomasset=getcustomasset
local tspawn=task.spawn
local twait=task.wait

local game=game
local FindFirstChild=game.FindFirstChild

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local PlayerGui = Player.PlayerGui

local TweenService = game:GetService("TweenService")
local InfoNew = TweenInfo.new
local Infos = {
  Fade_In_Tween = InfoNew(
    1, Enum.EasingStyle.Circular,
    Enum.EasingDirection.Out),
  Fade_In_Properties = {
    Image = {ImageTransparency = 0},
    Text = {TextTransparency = 0}
  },
  
  Fade_Out_Tween = InfoNew(
    1.5, Enum.EasingStyle.Exponential,
    Enum.EasingDirection.InOut),
  Fade_Out_Properties = {
    Text = {TextTransparency = 1},
    Image = {ImageTransparency = 1}
  }
}

-- [[ FUNCTIONS ]]

local UI = {}
UI["Name"] = "Motify"
local Handler = FindFirstChild(PlayerGui, UI["Name"])

function Tween(UI_Object: Instance, Tween, Properties, Children: boolean)
  if not Children then
    local Opacity_Anim = TweenService:Create(UI_Object, Tween, Properties)
    return Opacity_Anim:Play()
  end
  
  for _, Labels in next, UI_Object:GetChildren() do
    if Labels:IsA("TextLabel") then
      local Opacity_Anim = TweenService:Create(Labels, Tween, Properties)
      return Opacity_Anim:Play()
    end
  end
end

function UI:Create()
  local ScreenGui = Instance.new("ScreenGui")
  ScreenGui.Name = UI["Name"]
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
  Image.Image = getcustomasset("Motify Frame.jpg")
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
  
  local DescLabel = Instance.new("TextLabel")
  DescLabel.Name = "DescLabel"
  DescLabel.Text = ""
  DescLabel.Size = UDim2.new(0.4, 0, 0.4, 0)
  DescLabel.Position = UDim2.new(0, 140, 0, 45)
  DescLabel.AnchorPoint = Vector2.new(0.5, 0.5)
  DescLabel.TextTransparency = 0
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
    OutputMessage:Info("UI Created!")
  end
end

function UI:Typewrite(String: string, Label: Instance)
  tspawn(function()
    local Substring = 1
    
    twait(0.25)
    for Letters = 1, #String do
      local New_Letter = string.sub(String, 1, Substring)
      
      Label.Text = New_Letter
      Substring += 1
      twait(0.1)
    end
    
    OutputMessage:Info("Typewrite Ended!")
  end)
end

function UI:Notify(Info: table)
  local New_Image = Handler["MainFrame"].Image:Clone()
  New_Image.Parent = Handler["MainFrame"]
  New_Image.Visible = true
  
  local New_Title = New_Image.TitleLabel
  New_Title.Parent = New_Image
  
  local New_Desc = New_Image.DescLabel
  New_Desc.Parent = New_Image
  
  tspawn(function()
    Tween(New_Image, Infos.Fade_In_Tween,
      Infos.Fade_In_Properties.Image)
    Tween(New_Image, Infos.Fade_In_Tween,
      Infos.Fade_In_Properties.Text, true)
    UI:Typewrite(Info.Title, New_Title)
    UI:Typewrite(Info.Description, New_Desc)
    
    OutputMessage:Info("Sent Notification!")
    
    while New_Title.Text ~= Info.Title do twait() end
    
    while New_Desc.Text ~= Info.Description do twait() end
    
    twait(Info.Duration)
    
    Tween(New_Image, Infos.Fade_Out_Tween,
      Infos.Fade_Out_Properties.Image)
    Tween(New_Image, Infos.Fade_Out_Tween,
      Infos.Fade_Out_Properties.Text, true)
    
    New_Image:GetPropertyChangedSignal("ImageTransparency"):Connect(function()
      if New_Image.ImageTransparency >= 0.95 then New_Image:Destroy() end
    end)
    
  end)
end

UI:Init()

return UI
