local MessageType = {}
MessageType.__index = MessageType
local Type_Colors = {
  Cyan = "<font color='rgb(0,255,255)'>",
  Red = "<font color='rgb(255,0,0)'>",
  Yellow = "<font color='rgb(255,215,0)'>"
}

local function Recolor_Text(Color, Text)
  return Color .. Text .. "</font>"
end

function MessageType:Success(Text)
  return Recolor_Text(Type_Colors.Cyan, Text)
end

function MessageType:Error(Text)
  return Recolor_Text(Type_Colors.Red, Text)
end

function MessageType:Warn(Text)
  return Recolor_Text(Type_Colors.Yellow, Text)
end

return MessageType
