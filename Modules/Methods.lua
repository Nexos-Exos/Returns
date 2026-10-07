local Module = {
    ["genv"] = getgenv(),
    ["game"] = game,
    ["place"] = game.PlaceId,
    ["inf"] = math.huge,
    ["sin"] = math.sin,
    ["floor"] = math.floor,
    ["random"] = math.random,
    ["twait"] = task.wait,
    ["tspawn"] = task.spawn,
    ["tdelay"] = task.delay,
    ["tdefer"] = task.defer,
    ["NewVector3"] = Vector3.new,
    ["NewInstance"] Instance.new,
    ["FindFirstChild"] = game.FindFirstChild,
    ["FindFirstChildWhichIsA"] = game.FindFirstChildWhichIsA,
    ["FindFirstChildOfClass"] = game.FindFirstChildOfClass,
    ["workspace"] = game:FindFirstChildOfClass("Workspace"),
    ["CoreGui"] = game:FindFirstChildOfClass("StarterGui"),
    ["ReplicatedStorage"] = FindFirstChildOfClass(game, "ReplicatedStorage"),
    ["Players"] = game:FindFirstChildOfClass("Players"),
    ["Player"] = game:FindFirstChildOfClass("Players").LocalPlayer
}

for i, v in pairs(Module) do
  print("Added method:", i)
  getgenv()[i] = v
  task.wait(.05)
end

return Module
