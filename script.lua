local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
    Name = "NerestRBX V0.1 (BETA)",
    LoadingTitle = "NerestRBX | Welcome!",
    LoadingSubtitle = "Loading...",
    ConfigurationSaving = {
       Enabled = false,
       FolderName = nil, -- Create a custom folder for your hub/game
       FileName = "nerestRBX"
    },
    Discord = {
       Enabled = true,
       Invite = "https://t.me/nerestcheatsRoblox", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
       RememberJoins = true -- Set this to false to make them join the discord every time they load it up
    },
    KeySystem = false, -- Set this to true to use our key system
    KeySettings = {
       Title = "",
       Subtitle = "Key System",
       Note = "No method of obtaining the key is provided",
       FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
       SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
       GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
       Key = {"FLICK_7IKTUNC1JQ", "NERESTRBX_ZME4VP0_M9XYVHS"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }
 })

 Rayfield:Notify({
   Title = "NerestRBX",
   Content = "Hello! This Free Beta lua cheat by Lowcode. May bugs and long functions activation. t.me/nerestcheatsRoblox",
   Duration = 2,
   Image = 14624193215,
   Actions = { -- Notification Buttons
      Ignore = {
         Name = "OK",
         Callback = function()
         print("The user tapped Okay!")
      end
   },
},
})

 local Tab = Window:CreateTab("[visuals]", 18445444459) -- Title, Image
 local Button = Tab:CreateButton({
   Name = "ESP NickNames",
   Callback = function()
      local c = workspace.CurrentCamera
      local ps = game:GetService("Players")
      local lp = ps.LocalPlayer
      local rs = game:GetService("RunService")
      
      local function esp(p,cr)
         local h = cr:WaitForChild("Humanoid")
         local hrp = cr:WaitForChild("Head")
      
         local text = Drawing.new("Text")
         text.Visible = false
         text.Center = true
         text.Outline = false 
         text.Font = 3
         text.Size = 16.16
         text.Color = Color3.new(170,170,170)
      
         local conection
         local conection2
         local conection3
      
         local function dc()
            text.Visible = false
            text:Remove()
            if conection then
               conection:Disconnect()
               conection = nil 
            end
            if conection2 then
               conection2:Disconnect()
               conection2 = nil 
            end
            if conection3 then
               conection3:Disconnect()
               conection3 = nil 
            end
         end
      
         conection2 = cr.AncestryChanged:Connect(function(_,parent)
            if not parent then
               dc()
            end
         end)
      
         conection3 = h.HealthChanged:Connect(function(v)
            if (v<=0) or (h:GetState() == Enum.HumanoidStateType.Dead) then
               dc()
            end
         end)
      
         conection = rs.RenderStepped:Connect(function()
            local hrp_pos,hrp_onscreen = c:WorldToViewportPoint(hrp.Position)
            if hrp_onscreen then
               text.Position = Vector2.new(hrp_pos.X, hrp_pos.Y - 27)
               text.Text = "[ "..p.Name.." ]"
               text.Visible = true
            else
               text.Visible = false
            end
         end)
      end
      
      local function p_added(p)
         if p.Character then
            esp(p,p.Character)
         end
         p.CharacterAdded:Connect(function(cr)
            esp(p,cr)
         end)
      end
      
      for i,p in next, ps:GetPlayers() do 
         if p ~= lp then
            p_added(p)
         end
      end
      
      ps.PlayerAdded:Connect(p_added)
   end,
})
local Button = Tab:CreateButton({
   Name = "RadarHack",
   Callback = function()
      local Radar = Instance.new("ScreenGui")
      local Frame = Instance.new("Frame")
      local objs = Instance.new("Folder")
       
      --Properties:
       
      Radar.Name = "Radar"
      Radar.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
       
      Frame.Parent = Radar
      Frame.BackgroundColor3 = Color3.new(0.513726, 1, 0.505882)
      Frame.BackgroundTransparency = 0.5
      Frame.BorderColor3 = Color3.new(0, 0, 0)
      Frame.BorderSizePixel = 0
      Frame.ClipsDescendants = true
      Frame.Position = UDim2.new(0.0574948676, 0, 0.0833333284, 0)
      Frame.Size = UDim2.new(0, 151, 0, 127)
       
      objs.Name = "objs"
      objs.Parent = Frame
       
      -- Scripts:
       
      local function MGGCBXN_fake_script() -- Frame.LocalScript 
         local script = Instance.new('LocalScript', Frame)
       
         local player = game.Players.LocalPlayer
       
         local objs = script.Parent:WaitForChild("objs")
         local scale = 1
       
         local function getCharacters()
            local chars = {}
       
            for i, v in pairs(game.Workspace:children()) do
               if v:findFirstChildOfClass("Humanoid") and v:findFirstChild("HumanoidRootPart") then
                  if v:findFirstChildOfClass("Humanoid").Health > 0 then
                     table.insert(chars, v)
                  end
               end
            end
       
            return chars
         end
       
         local function showEnemies()
            local chars = getCharacters()
       
            objs:ClearAllChildren()
       
            for i, v in pairs(chars) do
               if v and v:findFirstChild("Humanoid") and v:findFirstChild("HumanoidRootPart") then
                  local pos = player.Character.HumanoidRootPart.CFrame:ToObjectSpace(v.HumanoidRootPart.CFrame)
                  local e = Instance.new("Frame")
                  local charSize = v:GetExtentsSize()
                  e.Parent = objs
                  e.Position = UDim2.new(0, (pos.X/1.5)+(script.Parent.Size.X.Offset/2), 0, (pos.Z/1.5)+(script.Parent.Size.Y.Offset/2))		
                  e.Size = UDim2.new(0, charSize.X/scale, 0, charSize.Z/scale)
               end
            end
         end
       
         while wait() do
            showEnemies()
         end
      end
      coroutine.wrap(MGGCBXN_fake_script)()
       
      
   end,
})

local Button = Tab:CreateButton({
   Name = "Black Sky",
   Callback = function()
    


local function changeSkyboxToBlack()
   
   game.Lighting.Sky.Skybox.Color = Color3.new(0, 0, 0)
   
   
   game.Lighting.Sky.Skybox.CubeMap = {
       [Enum.SkyboxCubemapFace.PositiveX] = "rbxassetid://7002997758",
       [Enum.SkyboxCubemapFace.NegativeX] = "rbxassetid://7002997758",
       [Enum.SkyboxCubemapFace.PositiveY] = "rbxassetid://7002997758",
       [Enum.SkyboxCubemapFace.NegativeY] = "rbxassetid://7002997758",
       [Enum.SkyboxCubemapFace.PositiveZ] = "rbxassetid://7002997758",
       [Enum.SkyboxCubemapFace.NegativeZ] = "rbxassetid://7002997758"
   }
end


changeSkyboxToBlack()


print("Skybox успешно изменен на черный!")
   end,
})

local Slider = Tab:CreateSlider({
   Name = "FOV",
   Range = {0, 120},
   Increment = 1,
   Suffix = "FOV",
   CurrentValue = 60,
   Flag = "", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
      local camera = workspace.CurrentCamera -- Получаем камеру
      camera.FieldOfView = Value -- Устанавливаем FOV на 90 градусов       
   end,
})

local Tab = Window:CreateTab("[Combat]", 18857150729)

local Button = Tab:CreateButton({
   Name = "Aim",
   Callback = function()
      loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/WRD%20Aimbot.txt"))()
   end,
})