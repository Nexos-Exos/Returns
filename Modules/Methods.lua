local Module = {
    ["genv"]                          = getgenv(),
    ["G"]                             = _G,

    ["game"]                          = game,
    ["gameId"]                        = game.gameId,
    ["place"]                         = game.PlaceId,

    ["IsLoaded"]                      = function()
      return game:IsLoaded()
    end,
    ["HttpGet"]                       = function(Url)
      return game:HttpGet(Url)
    end,

    ["next"]                          = next,
    ["table"]                         = {},
    ["bool"]                          = true or false,

    ["tostr"]                         = tostring,
    ["tonum"]                         = tonumber,

    ["math"]                          = math,
    ["inf"]                           = math.huge,
    ["sin"]                           = math.sin,
    ["floor"]                         = math.floor,
    ["random"]                        = math.random,

    ["task"]                          = task,
    ["twait"]                         = task.wait,
    ["tspawn"]                        = task.spawn,
    ["tdelay"]                        = task.delay,
    ["tdefer"]                        = task.defer,

    ["Vector2"]                       = Vector2,
    ["NewVector2"]                    = Vector2.new,
    ["Vector3"]                       = Vector3,
    ["NewVector3"]                    = Vector3.new,

    ["Instance"]                      = Instance,
    ["NewInstance"]                   = Instance.new,

    ["GetChildren"]                   = game.GetChildren,
    ["GetDescendants"]                = game.GetDescendants,
    ["QueryDescendants"]              = game.QueryDescendants,

    ["FindFirstChild"]                = game.FindFirstChild,
    ["FindFirstChildWhichIsA"]        = game.FindFirstChildWhichIsA,
    ["FindFirstChildOfClass"]         = game.FindFirstChildOfClass,

    ["workspace"]                     = game:FindFirstChildOfClass("Workspace"),
    ["ReplicatedStorage"]             = game:FindFirstChildOfClass("ReplicatedStorage"),
    ["CoreGui"]                       = game:FindFirstChildOfClass("StarterGui"),
    ["Players"]                       = game:FindFirstChildOfClass("Players"),
    ["Player"]                        = game:FindFirstChildOfClass("Players").LocalPlayer
}

for i, v in pairs(Module) do
  print("Added method:", i)
  getgenv()[i] = v
  task.wait(.05)
end
