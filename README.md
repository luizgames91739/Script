local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "🦈 Project Leviathan",
   LoadingTitle = "🦈 Project Leviathan",
   LoadingSubtitle = "by Leviathan Team",
   ConfigurationSaving = {
      Enabled = false
   },
   Discord = {
      Enabled = false
   },
   KeySystem = false
})

-- 🦈 Hub Information Tab
local InfoTab = Window:CreateTab("🦈 Hub Information", 4483362458)

InfoTab:CreateParagraph({
   Title = "🦈 Day Of Creation",
   Content = "30/07/25"
})

InfoTab:CreateParagraph({
   Title = "🦈 Hub Version",
   Content = "version : Alpha 1.10.0"
})

InfoTab:CreateParagraph({
   Title = "🦈 Hub-Compatible Maps",
   Content = "All Maps"
})

-- 🦈 Leviathan-Scripts Executer Tab
local ScriptTab = Window:CreateTab("🦈 Leviathan-Scripts Executer", 4483362458)

ScriptTab:CreateButton({
   Name = "🦈 Redz Hub",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau"))()
   end,
})

ScriptTab:CreateButton({
   Name = "🦈 Infinity Yield",
   Callback = function()
      loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
   end,
})

ScriptTab:CreateButton({
   Name = "🦈 Dinga Hub",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Dingarik/Dingarik/refs/heads/main/GrowAGarden"))()
   end,
})

ScriptTab:CreateButton({
   Name = "🦈 No-Lag Hub",
   Callback = function()
      repeat wait() until game:IsLoaded() and game.Players.LocalPlayer

      local scripts = {
         [126884695634066] = "https://raw.githubusercontent.com/NoLag-id/No-Lag-HUB/refs/heads/main/Garden/Garden-V1.lua",
         [81440632616906] = "https://raw.githubusercontent.com/NoLag-id/No-Lag-HUB/refs/heads/main/DigEarth/V1.lua",
      }

      local url = scripts[game.PlaceId]
      if url then
         loadstring(game:HttpGetAsync(url))()
         loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/NoLag-id/No-Lag-HUB/refs/heads/main/untitled.lua"))()
      end
   end,
})

ScriptTab:CreateButton({
   Name = "🦈 Chilli Hub",
   Callback = function()
      loadstring(game:HttpGet("https://rawscripts.net/raw/Steal-a-Brainrot-KEYLESS-TRUE-THE-BEST-STEAL-A-BRAINROT-SCRIPT-45137"))()
   end,
})
