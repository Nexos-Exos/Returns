-- [[ SERVICES ]] --

local Players = game:GetService("Players");
local Player = Players.LocalPlayer;
local PlayerGui = Player.PlayerGui;

local TweenService = game:GetService("TweenService")
local Info = TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
local Library = {};

-- [[ FUNCTIONS ]] --

function Library:Validate(Defaults, Options)
  for i, v in pairs(Defaults) do
    if Options[i] == nil then
      Options[i] = v
    end
  end
  
  return Options
end

function Library:Tween(Object, Info, Goal)
  local Anim = TweenService:Create(Object, Info, Goal)
  Anim:Play()
  Anim.Completed:Wait()
end

function Library:Init()
  local GUI = {};
  local Colors = {
    ["OFF"] = {
      Stroke = Color3.fromRGB(0, 0, 0),
      Text = Color3.fromRGB(255, 255, 255)
    },
    ["ON"] = {
      Stroke = Color3.fromRGB(255, 255, 255),
      Text = Color3.fromRGB(104, 96, 255)
    }
  };
  
  -- // Main Frame
  do
    GUI["ScreenGui_1"] = Instance.new("ScreenGui", PlayerGui);
    GUI["ScreenGui_1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;
    
    GUI["Toggle_2"] = Instance.new("TextLabel", GUI["ScreenGui_1"]);
    GUI["Toggle_2"]["BorderSizePixel"] = 0;
    GUI["Toggle_2"]["TextSize"] = 12;
    GUI["Toggle_2"]["BackgroundColor3"] = Color3.fromRGB(39, 39, 39);
    GUI["Toggle_2"]["FontFace"] = Font.new([[rbxasset://fonts/families/Arimo.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
    GUI["Toggle_2"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
    GUI["Toggle_2"]["RichText"] = true;
    GUI["Toggle_2"]["AnchorPoint"] = Vector2.new(1, 0.5);
    GUI["Toggle_2"]["Size"] = UDim2.new(0, 120, 0, 60);
    GUI["Toggle_2"]["Text"] = [[Toggle (OFF)]];
    GUI["Toggle_2"]["Name"] = [[Toggle]];
    GUI["Toggle_2"]["Position"] = UDim2.new(0.99, 0, 0.5, 0);
    
    GUI["Texture_2"] = Instance.new("ImageLabel", GUI["Toggle_2"]);
    GUI["Texture_2"]["ZIndex"] = 0;
    GUI["Texture_2"]["BorderSizePixel"] = 0;
    GUI["Texture_2"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    GUI["Texture_2"]["ImageTransparency"] = 0.8;
    -- GUI["Texture_2"]["ImageContent"] = ;
    GUI["Texture_2"]["Image"] = [[rbxassetid://131593587185640]];
    GUI["Texture_2"]["Size"] = UDim2.new(1, 0, 1, 0);
    GUI["Texture_2"]["BackgroundTransparency"] = 1;
    GUI["Texture_2"]["Name"] = [[Texture]];


    GUI["UICorner_3"] = Instance.new("UICorner", GUI["Texture_2"]);
    
    GUI["FrameStroke_3"] = Instance.new("UIStroke", GUI["Toggle_2"]);
    GUI["FrameStroke_3"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
    GUI["FrameStroke_3"]["Name"] = [[FrameStroke]];
    GUI["FrameStroke_3"]["Thickness"] = 1.5;
    
    
    GUI["Button_4"] = Instance.new("TextButton", GUI["Toggle_2"]);
    GUI["Button_4"]["BorderSizePixel"] = 0;
    GUI["Button_4"]["TextTransparency"] = 1;
    GUI["Button_4"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    GUI["Button_4"]["BackgroundTransparency"] = 1;
    GUI["Button_4"]["Size"] = UDim2.new(1, 0, 1, 0);
    GUI["Button_4"]["Name"] = [[Button]];
    
    
    GUI["Corner_5"] = Instance.new("UICorner", GUI["Button_4"]);
    GUI["Corner_5"]["Name"] = [[Corner]];
    
    
    GUI["TextStroke_6"] = Instance.new("UIStroke", GUI["Toggle_2"]);
    GUI["TextStroke_6"]["Name"] = [[TextStroke]];
    GUI["TextStroke_6"]["Thickness"] = 1.5;
    
    GUI["Corner_8"] = Instance.new("UICorner", GUI["Toggle_2"]);
    GUI["Corner_8"]["Name"] = [[Corner]];
    
    GUI["Main_9"] = Instance.new("Frame", GUI["ScreenGui_1"]);
    GUI["Main_9"]["BorderSizePixel"] = 0;
    GUI["Main_9"]["BackgroundColor3"] = Color3.fromRGB(54, 51, 63);
    GUI["Main_9"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    GUI["Main_9"]["Size"] = UDim2.new(0, 400, 0, 325);
    GUI["Main_9"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
    GUI["Main_9"]["Name"] = [[Main]];
    GUI["Main_9"]["Visible"] = false
    
    GUI["Texture_9"] = Instance.new("ImageLabel", GUI["Main_9"]);
    GUI["Texture_9"]["ZIndex"] = 0;
    GUI["Texture_9"]["BorderSizePixel"] = 0;
    GUI["Texture_9"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    GUI["Texture_9"]["ImageTransparency"] = 0.8;
    -- GUI["Texture_2"]["ImageContent"] = ;
    GUI["Texture_9"]["Image"] = [[rbxassetid://131593587185640]];
    GUI["Texture_9"]["Size"] = UDim2.new(1, 0, 1, 0);
    GUI["Texture_9"]["BackgroundTransparency"] = 1;
    GUI["Texture_9"]["Name"] = [[Texture]];


    GUI["UICorner_3"] = Instance.new("UICorner", GUI["Texture_9"]);
    
    GUI["Button_4"].MouseButton1Click:Connect(function()
      if GUI["Toggle_2"]["Text"] == "Toggle (OFF)" then
        GUI["Toggle_2"]["Text"] = "Toggle (ON)"
        GUI["Toggle_2"]["TextColor3"] = Colors["ON"].Text
        GUI["FrameStroke_3"]["Color"] = Colors["ON"].Stroke
        GUI["Main_9"]["Visible"] = true
        else
          GUI["Toggle_2"]["Text"] = "Toggle (OFF)"
          GUI["Toggle_2"]["TextColor3"] = Colors["OFF"].Text
          GUI["FrameStroke_3"]["Color"] = Colors["OFF"].Stroke
          GUI["Main_9"]["Visible"] = false
      end
    end)
    
    GUI["UICorner_a"] = Instance.new("UICorner", GUI["Main_9"]);
    GUI["UICorner_a"]["CornerRadius"] = UDim.new(0, 4);
    
    
    GUI["TopBar_b"] = Instance.new("Frame", GUI["Main_9"]);
    GUI["TopBar_b"]["BorderSizePixel"] = 0;
    GUI["TopBar_b"]["BackgroundColor3"] = Color3.fromRGB(45, 42, 52);
    GUI["TopBar_b"]["Size"] = UDim2.new(1, 0, 0, 50);
    GUI["TopBar_b"]["Name"] = [[TopBar]];
    

    GUI["Search_2"] = Instance.new("TextBox", GUI["TopBar_b"]);
    GUI["Search_2"]["Name"] = [[Search]];
    GUI["Search_2"]["BorderSizePixel"] = 0;
    GUI["Search_2"]["TextSize"] = 12;
    GUI["Search_2"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
    GUI["Search_2"]["BackgroundColor3"] = Color3.fromRGB(81, 76, 94);
    GUI["Search_2"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
    GUI["Search_2"]["AnchorPoint"] = Vector2.new(1, 0);
    GUI["Search_2"]["PlaceholderText"] = [[Search...]];
    GUI["Search_2"]["Size"] = UDim2.new(0, 150, 1, 0);
    GUI["Search_2"]["Position"] = UDim2.new(1, 0, 0, 0);
    GUI["Search_2"]["Text"] = [[]];
    GUI["Search_2"]["BackgroundTransparency"] = 0.9;
    
    
    GUI["UIPadding_3"] = Instance.new("UIPadding", GUI["Search_2"]);
    
    
    
    GUI["UICorner_4"] = Instance.new("UICorner", GUI["Search_2"]);
    GUI["UICorner_4"]["CornerRadius"] = UDim.new(0, 4);

    
    GUI["Texture_B"] = Instance.new("ImageLabel", GUI["TopBar_b"]);
    GUI["Texture_B"]["ZIndex"] = 0;
    GUI["Texture_B"]["BorderSizePixel"] = 0;
    GUI["Texture_B"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    GUI["Texture_B"]["ImageTransparency"] = 0.8;
    -- GUI["Texture_2"]["ImageContent"] = ;
    GUI["Texture_B"]["Image"] = [[rbxassetid://131593587185640]];
    GUI["Texture_B"]["Size"] = UDim2.new(1, 0, 1, 0);
    GUI["Texture_B"]["BackgroundTransparency"] = 1;
    GUI["Texture_B"]["Name"] = [[Texture]];

    GUI["UICorner_3"] = Instance.new("UICorner", GUI["Texture_B"]);
    
    GUI["Corner_e"] = Instance.new("UICorner", GUI["Button_d"]);
    GUI["Corner_e"]["Name"] = [[Corner]];
    
    
    GUI["UICorner_f"] = Instance.new("UICorner", GUI["TopBar_b"]);
    GUI["UICorner_f"]["CornerRadius"] = UDim.new(0, 4);
    
    
    GUI["Title_10"] = Instance.new("TextLabel", GUI["TopBar_b"]);
    GUI["Title_10"]["BorderSizePixel"] = 0;
    GUI["Title_10"]["TextSize"] = 14;
    GUI["Title_10"]["TextXAlignment"] = Enum.TextXAlignment.Left;
    GUI["Title_10"]["BackgroundColor3"] = Color3.fromRGB(255, 65, 65);
    GUI["Title_10"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
    GUI["Title_10"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
    GUI["Title_10"]["BackgroundTransparency"] = 1;
    GUI["Title_10"]["RichText"] = true;
    GUI["Title_10"]["Size"] = UDim2.new(0.5, 0, 1, 0);
    GUI["Title_10"]["Text"] = [[UI Library]];
    GUI["Title_10"]["Name"] = [[Title]];
    
    
    GUI["UIPadding_11"] = Instance.new("UIPadding", GUI["Title_10"]);
    GUI["UIPadding_11"]["PaddingLeft"] = UDim.new(0, 16);
    
    
    GUI["ContentHolder_12"] = Instance.new("Frame", GUI["Main_9"]);
    GUI["ContentHolder_12"]["BorderSizePixel"] = 0;
    GUI["ContentHolder_12"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    GUI["ContentHolder_12"]["Size"] = UDim2.new(1, -10, 1, -60);
    GUI["ContentHolder_12"]["Position"] = UDim2.new(0, 4, 0.17, 0);
    GUI["ContentHolder_12"]["Name"] = [[ContentHolder]];
    GUI["ContentHolder_12"]["BackgroundTransparency"] = 1;
    
    
    GUI["HomeTab_13"] = Instance.new("ScrollingFrame", GUI["ContentHolder_12"]);
    GUI["HomeTab_13"]["BorderSizePixel"] = 0;
    GUI["HomeTab_13"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    GUI["HomeTab_13"]["Name"] = [[HomeTab]];
    GUI["HomeTab_13"]["Size"] = UDim2.new(1, 0, 1, 0);
    GUI["HomeTab_13"]["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0);
    GUI["HomeTab_13"]["ScrollBarThickness"] = 1;
    GUI["HomeTab_13"]["BackgroundTransparency"] = 1;
    
    
    GUI["UIPadding_14"] = Instance.new("UIPadding", GUI["HomeTab_13"]);
    GUI["UIPadding_14"]["PaddingTop"] = UDim.new(0, 6);
    GUI["UIPadding_14"]["PaddingRight"] = UDim.new(0, 6);
    GUI["UIPadding_14"]["PaddingLeft"] = UDim.new(0, 12);
    GUI["UIPadding_14"]["PaddingBottom"] = UDim.new(0, 6);
    
    GUI["UICorner_1b"] = Instance.new("UICorner", GUI["HomeTab_13"]);
    GUI["UICorner_1b"]["CornerRadius"] = UDim.new(0, 4);
    
    
    GUI["UIListLayout_1c"] = Instance.new("UIListLayout", GUI["HomeTab_13"]);
    GUI["UIListLayout_1c"]["Wraps"] = true;
    GUI["UIListLayout_1c"]["Padding"] = UDim.new(0, 15);
    GUI["UIListLayout_1c"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
    GUI["UIListLayout_1c"]["FillDirection"] = Enum.FillDirection.Horizontal;
    
    
    GUI["UICorner_1d"] = Instance.new("UICorner", GUI["ContentHolder_12"]);
    GUI["UICorner_1d"]["CornerRadius"] = UDim.new(0, 4);
    
    
    GUI["UIStroke_1e"] = Instance.new("UIStroke", GUI["ContentHolder_12"]);
    GUI["UIStroke_1e"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
    GUI["UIStroke_1e"]["Thickness"] = 1.5;
    
    
    GUI["Line_1f"] = Instance.new("Frame", GUI["Main_9"]);
    GUI["Line_1f"]["BorderSizePixel"] = 0;
    GUI["Line_1f"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
    GUI["Line_1f"]["Size"] = UDim2.new(1, 0, 0, 1);
    GUI["Line_1f"]["Position"] = UDim2.new(0, 0, 0.15, 0);
    GUI["Line_1f"]["Name"] = [[Line]];
    
    
    GUI["UIStroke_20"] = Instance.new("UIStroke", GUI["Main_9"]);
    GUI["UIStroke_20"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
    GUI["UIStroke_20"]["Thickness"] = 1.5;
    
    Search = function(text: string)
      local Text = text:lower()
      local ButtonsContainer = GUI["HomeTab_13"]
      
      for _, Buttons in ipairs(ButtonsContainer:GetChildren()) do
        if Buttons:IsA("TextLabel") then
          if string.match(Buttons.Text:lower(), Text) or Text == "" then
            Buttons.Visible = true
            else
              Buttons.Visible = false
          end
          
        end
      end
      
      warn("Searching for:", Text)
    end
    
    GUI["Search_2"].FocusLost:Connect(function()
      Search(GUI["Search_2"].Text)
    end)
  end
  
  -- // Methods
  function GUI:AddButton(options)
    options = Library:Validate({
      Name = "Button",
      Callback = function()
        warn("Clicked!")
      end
    }, options or {});
    
    local Label = Instance.new("TextLabel", GUI["HomeTab_13"]);
    Label["TextWrapped"] = true;
    Label["BorderSizePixel"] = 0;
    Label["TextSize"] = 14;
    Label["BackgroundColor3"] = Color3.fromRGB(39, 39, 39);
    Label["FontFace"] = Font.new([[rbxasset://fonts/families/Arimo.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
    Label["TextColor3"] = Color3.fromRGB(255, 255, 255);
    Label["RichText"] = true;
    Label["Size"] = UDim2.new(0, 60, 0, 60);
    Label["Text"] = options["Name"];
    Label["Name"] = options["Name"];
    
    
    local Corner = Instance.new("UICorner", Label);
    
    
    
    local TextStroke = Instance.new("UIStroke", Label);
    TextStroke["Name"] = [[TextStroke]];
    TextStroke["Thickness"] = 1.5;
    
    
    local FrameStroke = Instance.new("UIStroke", Label);
    FrameStroke["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
    FrameStroke["Name"] = [[FrameStroke]];
    FrameStroke["Thickness"] = 1.5;
    
    
    local Button = Instance.new("TextButton", Label);
    Button["BorderSizePixel"] = 0;
    Button["TextTransparency"] = 1;
    Button["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Button["BackgroundTransparency"] = 1;
    Button["Size"] = UDim2.new(1, 0, 1, 0);
    Button["Name"] = [[Button]];
    
    Button.MouseButton1Click:Connect(function()
      if FrameStroke.Color == Colors["OFF"].Stroke then
        Library:Tween(FrameStroke, Info, {Color = Colors["ON"].Stroke})
        Library:Tween(FrameStroke, Info, {Color = Colors["OFF"].Stroke})
      end
    end)
    
    Button.MouseButton1Click:Connect(options["Callback"])
    
    local Corner = Instance.new("UICorner", Button);
  end
  
  return GUI
end

return Library
