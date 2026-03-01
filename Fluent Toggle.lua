-- [[ UI Variables ]]

local Player = game:GetService("Players").LocalPlayer
local PlayerGui = Player.PlayerGui

local CoreGui = game:GetService("CoreGui")
local Frame = CoreGui.ScreenGui:GetChildren()[2]

local GUI = {}
GUI.__index = GUI

-- [[ GUI Functions ]]

function GUI.Create()
  local Frame = game:GetService("CoreGui").ScreenGui:GetChildren()[2]

  local ScreenGui = Instance.new("ScreenGui")
  ScreenGui.Name = "Minimize_GUI"
  ScreenGui.ResetOnSpawn = false
  ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
  ScreenGui.Parent = PlayerGui
    
  local Minimize_Btn = Instance.new("TextButton")
  Minimize_Btn.Draggable = true
  Minimize_Btn.Name = "Minimize_Btn"
  Minimize_Btn.Parent = ScreenGui
  Minimize_Btn.Size = UDim2.new(0, 76, 0, 56)
  Minimize_Btn.Position = UDim2.new(0, 754, 0, -26)
  Minimize_Btn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
  Minimize_Btn.BackgroundTransparency = 0.4
  Minimize_Btn.BorderSizePixel = 0
  Minimize_Btn.Text = "[Close]"
  Minimize_Btn.TextSize = 18
  Minimize_Btn.TextTransparency = 0.1
  Minimize_Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
  Minimize_Btn.FontFace = Font.new(
    "rbxasset://fonts/families/Inconsolata.json",
    Enum.FontWeight.Regular,
    Enum.FontStyle.Normal
  )
    
  local Corner = Instance.new("UICorner")
  Corner.CornerRadius = UDim.new(0, 10)
  Corner.Parent = Minimize_Btn
    
  local Stroke = Instance.new("UIStroke")
  Stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
  Stroke.Thickness = 1.5
  Stroke.Color = Color3.fromRGB(134, 134, 134)
  Stroke.Parent = Minimize_Btn
    
  Minimize_Btn.MouseButton1Click:Connect(function()
    if Minimize_Btn.Text == "[Close]" then
      Minimize_Btn.Text = "[Open]"
      else
        Minimize_Btn.Text = "[Close]"
    end
      
    Frame.Visible = not Frame.Visible
  end)
end

function GUI:Init()
  local MinimizeGUI = PlayerGui:FindFirstChild("Minimize_GUI")
  
  if MinimizeGUI then
    MinimizeGUI:Destroy()
    print("OLD UI DESTROYED!")
    
    GUI.Create()
  end
  
  if not MinimizeGUI then
    GUI.Create()
  end
end

return GUI
