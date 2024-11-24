-- Load RetroArch UI Library from GitHub
local function LoadURL(URL)
    return loadstring(game:HttpGet(URL))()
end

local RetroArch = LoadURL("https://raw.githubusercontent.com/[username]/[repository]/[branch]/RetroArch.lua") -- Replace with actual GitHub URL

local ui = RetroArch.new("RetroArch Menu")

-- Create Main Menu
local mainMenu = ui:AddPage("Main Menu")
mainMenu:AddButton("Load Core", function()
    print("Loading Core...")
end)

mainMenu:AddButton("Start Core", function()
    print("Starting Core...")
end)

-- Create Settings
local settings = ui:AddPage("Settings")
settings:AddButton("Video Settings", function()
    print("Opening Video Settings...")
end)

settings:AddButton("Audio Settings", function()
    print("Opening Audio Settings...")
end)

-- Create About
local about = ui:AddPage("About")
about:AddButton("Information", function()
    print("Showing Information...")
end) 