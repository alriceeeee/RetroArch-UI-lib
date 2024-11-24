local RetroArch = {}
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

-- UI Configuration
local config = {
    backgroundColor = Color3.fromRGB(32, 32, 32),
    accentColor = Color3.fromRGB(65, 65, 65),
    textColor = Color3.fromRGB(255, 255, 255),
    selectedColor = Color3.fromRGB(0, 162, 232),
    fontSize = 14,
    padding = 5
}

function RetroArch.new(title)
    local gui = Instance.new("ScreenGui")
    local main = Instance.new("Frame")
    local sidebar = Instance.new("Frame")
    local content = Instance.new("Frame")
    local title = Instance.new("TextLabel")
    local menuList = Instance.new("ScrollingFrame")
    local UIListLayout = Instance.new("UIListLayout")
    
    gui.Name = "RetroArchGUI"
    gui.Parent = game.CoreGui
    
    main.Name = "Main"
    main.Size = UDim2.new(0.8, 0, 0.8, 0)
    main.Position = UDim2.new(0.1, 0, 0.1, 0)
    main.BackgroundColor3 = config.backgroundColor
    main.Parent = gui
    
    sidebar.Name = "Sidebar"
    sidebar.Size = UDim2.new(0.2, 0, 1, 0)
    sidebar.BackgroundColor3 = config.accentColor
    sidebar.Parent = main
    
    content.Name = "Content"
    content.Size = UDim2.new(0.8, 0, 1, 0)
    content.Position = UDim2.new(0.2, 0, 0, 0)
    content.BackgroundColor3 = config.backgroundColor
    content.Parent = main
    
    menuList.Name = "MenuList"
    menuList.Size = UDim2.new(1, 0, 0.95, 0)
    menuList.Position = UDim2.new(0, 0, 0.05, 0)
    menuList.BackgroundTransparency = 1
    menuList.Parent = sidebar
    
    UIListLayout.Parent = menuList
    UIListLayout.Padding = UDim.new(0, config.padding)
    
    local lib = {}
    lib.pages = {}
    lib.currentPage = nil
    
    function lib:AddPage(name)
        local pageButton = Instance.new("TextButton")
        local page = Instance.new("Frame")
        
        pageButton.Name = name
        pageButton.Size = UDim2.new(1, 0, 0, 30)
        pageButton.BackgroundColor3 = config.accentColor
        pageButton.Text = name
        pageButton.TextColor3 = config.textColor
        pageButton.TextSize = config.fontSize
        pageButton.Parent = menuList
        
        page.Name = name
        page.Size = UDim2.new(1, 0, 1, 0)
        page.BackgroundTransparency = 1
        page.Visible = false
        page.Parent = content
        
        local pageContent = {}
        
        function pageContent:AddButton(buttonText, callback)
            local button = Instance.new("TextButton")
            button.Name = buttonText
            button.Size = UDim2.new(0.9, 0, 0, 30)
            button.Position = UDim2.new(0.05, 0, 0, #page:GetChildren() * 35)
            button.BackgroundColor3 = config.accentColor
            button.Text = buttonText
            button.TextColor3 = config.textColor
            button.TextSize = config.fontSize
            button.Parent = page
            
            button.MouseButton1Click:Connect(callback)
            return button
        end
        
        pageButton.MouseButton1Click:Connect(function()
            if lib.currentPage then
                lib.currentPage.Visible = false
            end
            page.Visible = true
            lib.currentPage = page
        end)
        
        lib.pages[name] = pageContent
        return pageContent
    end
    
    return lib
end

return RetroArch
