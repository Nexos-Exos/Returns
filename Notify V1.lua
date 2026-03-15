--[[
 GUI created with LocalMaze GUI Creator
]]

-- [[ VARIABLES ]]

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local PlayerGui = Player.PlayerGui

local TweenService = game:GetService("TweenService")
local Tween_Infos = {
  Size_Tween = TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
  Size_Properties = {
    Size = UDim2.new(1, 3, 0.25, 1)
  },
  
  Opacity_Tween = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.In),
  Opacity_Properties = {
    Text = {TextTransparency = 1},
    Image = {ImageTransparency = 1}
  }
}

-- [[ UI ]]

local UI = {}
local Handler = PlayerGui:FindFirstChild("Notify_Holder")
UI.__index = UI

function UI:Create()
  ScreenGui = Instance.new("ScreenGui")
  Handler = ScreenGui
  ScreenGui.Name = "Notify_Holder"
  ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
  ScreenGui.Parent = PlayerGui
  ScreenGui.Enabled = false
  
  Main_Frame = Instance.new("Frame")
  Main_Frame.Name = "Main Frame"
  Main_Frame.AnchorPoint = Vector2.new(0.5, 0.5)
  Main_Frame.Size = UDim2.new(0, 238, 0, 316)
  Main_Frame.Position = UDim2.new(0, 1050, 0, 225)
  Main_Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  Main_Frame.BackgroundTransparency = 1
  Main_Frame.BorderSizePixel = 0
  Main_Frame.Parent = ScreenGui
  
  List_Layout = Instance.new("UIListLayout")
  List_Layout.VerticalAlignment = Enum.VerticalAlignment.Bottom
  List_Layout.Parent = Main_Frame
  
  Image = Instance.new("ImageLabel")
  Image.Name = "Image"
  Image.Parent = Main_Frame
  Image.BorderSizePixel = 0
  Image.BackgroundColor3 = Color3.fromRGB(255,255,255)
  Image.BackgroundTransparency = 1
  Image.Image = "rbxassetid://109883022990265"
  Image.Size = UDim2.new(0,0,0,0)
  Image.Position = UDim2.new(0,180,0,208)
  Image.Visible = false
  
  Title_Label = Instance.new("TextLabel")
  Title_Label.Name = "Title_Label"
  Title_Label.Parent = Image
  Title_Label.BorderSizePixel = 0
  Title_Label.BackgroundColor3 = Color3.fromRGB(255,255,255)
  Title_Label.BackgroundTransparency = 1
  Title_Label.AnchorPoint = Vector2.new(0.5,0.5)
  Title_Label.Position = UDim2.new(0,135,0,20)
  Title_Label.Size = UDim2.new(0.2,0,0.3,0)
  Title_Label.FontFace = Font.new(
    "rbxasset://fonts/families/Balthazar.json",
    Enum.FontWeight.Regular,
    Enum.FontStyle.Normal
  )
  Title_Label.Text = "WARNING!"
  Title_Label.TextColor3 = Color3.fromRGB(255,255,255)
  Title_Label.TextSize = 24
  
  Desc_Label = Instance.new("TextLabel")
  Desc_Label.Name = "Desc_Label"
  Desc_Label.Parent = Image
  Desc_Label.BorderSizePixel = 0
  Desc_Label.BackgroundColor3 = Color3.fromRGB(255,255,255)
  Desc_Label.BackgroundTransparency = 1
  Desc_Label.AnchorPoint = Vector2.new(0.5,0.5)
  Desc_Label.Position = UDim2.new(0,135,0,50)
  Desc_Label.Size = UDim2.new(0.4,0,0.4,0)
  
  Desc_Label.FontFace = Font.new(
    "rbxasset://fonts/families/Arial.json",
    Enum.FontWeight.Regular,
    Enum.FontStyle.Normal
  )
  
  Desc_Label.Text = "hi im desc label thingy"
  Desc_Label.TextColor3 = Color3.fromRGB(255,255,255)
  Desc_Label.TextScaled = true
  Desc_Label.TextWrapped = true
  Desc_Label.TextSize = 14
end

function UI:Init()
  if not Handler then
    UI:Create()
    print('UI Created')
  end
end

function UI:Notify(Info: table)
  Handler.Enabled = true
  
  local New_Image = Handler["Main Frame"].Image:Clone()
  New_Image.Parent = Handler["Main Frame"]
  New_Image.Visible = true
  
  local New_Title = New_Image.Title_Label
  New_Title.Text = Info.Title
  New_Title.TextTransparency = 0
  New_Title.Parent = New_Image
  
  local New_Desc = New_Image.Desc_Label
  New_Desc.Text = Info.Description
  New_Desc.TextTransparency = 0
  New_Desc.Parent = New_Image
  
  task.spawn(function()
    local Size_Anim = TweenService:Create(
      New_Image, Tween_Infos.Size_Tween,
      Tween_Infos.Size_Properties)
    Size_Anim:Play()
    
    task.wait(Info.Duration)
    
    for _, Labels in New_Image:GetChildren() do
      if Labels:IsA("TextLabel") then
        local Opacity_Anim = TweenService:Create(
          Labels, Tween_Infos.Opacity_Tween,
          Tween_Infos.Opacity_Properties.Text)
        Opacity_Anim:Play()
      end
    end
    
    local Opacity_Anim = TweenService:Create(
      New_Image, Tween_Infos.Opacity_Tween,
      Tween_Infos.Opacity_Properties.Image)
    Opacity_Anim:Play()
    
    Opacity_Anim.Completed:Connect(function()
      New_Image:Destroy()
    end)
    
  end)
end

-- [[ FUNCTIONS ]]

UI:Init()

return UI
