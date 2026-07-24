local MessageType = {}
local Colors = {
  Cyan = "<font color='rgb(0,255,255)'>",
  Red = "<font color='rgb(255,0,0)'>",
  Yellow = "<font color='rgb(255,215,0)'>"
}

local function Recolor_Text(Color, Text)
  return Color .. Text .. "</font>"
end

function MessageType:Info(Text)
  return print(Recolor_Text(Colors.Cyan, Text))
end

function MessageType:Error(Text)
  return print(Recolor_Text(Colors.Cyan, Text))
end

function MessageType:Warn(Text)
  return print(Recolor_Text(Colors.Cyan, Text))
end

return MessageType
