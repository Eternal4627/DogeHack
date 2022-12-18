local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
local Window = Rayfield:CreateWindow({
	Name = "DogeHack 1.5.666",
	LoadingTitle = "THE_REAL_666",
	LoadingSubtitle = "by eternal",
	ConfigurationSaving = {
		Enabled = true,
		FolderName = nil,
		FileName = "GoodMorning"
	},
        Discord = {
        	Enabled = false,
        	Invite = "qbK8awTh", 
        	RememberJoins = true 
        },
	KeySystem = false,
	KeySettings = {
		Title = "Sirius Hub",
		Subtitle = "Key System",
		Note = "Join the discord (discord.gg/sirius)",
		FileName = "SiriusKey",
		SaveKey = true,
		GrabKeyFromSite = false,
		Key = "Hello"
	}
})

local ReplicatedStorage = game:GetService("ReplicatedStorage");
local CoreGui = game:GetService("CoreGui");
local Players = game:GetService("Players");
local Workspace = game:GetService("Workspace");
local Lighting = game:GetService("Lighting");
local VirtualInputManager = game:GetService("VirtualInputManager");


Rayfield:Notify({
    Title = "NICE IP BRO 123.456.675.0",
    Content = "Script loaded",
    Duration = 6.5,
    Image = 4483362458,
    Actions = { 
        Ignore = {
            Name = "OKAY NIGGA",
            Callback = function()
                print("The user tapped OKAY NIGGA")
            end
		},
	},
})

local PlayerTab = Window:CreateTab("Player", 4483362458)
local Section = PlayerTab:CreateSection("Sussy Section")
local Label = PlayerTab:CreateLabel("Player Tab")


local Button = PlayerTab:CreateButton({
    Name = "FREE HL-MK2 AND NUNCHUCKS",
	Callback = function()
    game:GetService("ReplicatedStorage").Storage.ItemStats.Misc["HL-MK2"].IsGamepass.Value = false
    game:GetService("ReplicatedStorage").Storage.ItemStats.Melees.Nunchucks.IsGamepass.Value = false
end
})

local Button = PlayerTab:CreateButton({
	Name = "Fly (Press X to use)",
	Callback = function()
		local FlyKey = Enum.KeyCode.X
            local SpeedKey = Enum.KeyCode.LeftControl
            
            local SpeedKeyMultiplier = 3
            local FlightSpeed = 100
            local FlightAcceleration = 2.56
            local TurnSpeed = 16
            
            
            local UserInputService = game:GetService("UserInputService")
            local StarterGui = game:GetService("StarterGui")
            local RunService = game:GetService("RunService")
            local Players = game:GetService("Players")
            local User = Players.LocalPlayer
            local Camera = workspace.CurrentCamera
            local UserCharacter = nil
            local UserRootPart = nil
            local Connection = nil
            
            
            workspace.Changed:Connect(function()
                Camera = workspace.CurrentCamera
            end)
            
            local setCharacter = function(c)
                UserCharacter = c
                UserRootPart = c:WaitForChild("HumanoidRootPart")
            end
            
            User.CharacterAdded:Connect(setCharacter)
            if User.Character then
                setCharacter(User.Character)
            end
            
            local CurrentVelocity = Vector3.new(0,0,0)
            local Flight = function(delta)
                local BaseVelocity = Vector3.new(0,0,0)
                if not UserInputService:GetFocusedTextBox() then
                    if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                        BaseVelocity = BaseVelocity + (Camera.CFrame.LookVector * FlightSpeed)
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                        BaseVelocity = BaseVelocity - (Camera.CFrame.RightVector * FlightSpeed)
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                        BaseVelocity = BaseVelocity - (Camera.CFrame.LookVector * FlightSpeed)
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                        BaseVelocity = BaseVelocity + (Camera.CFrame.RightVector * FlightSpeed)
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                        BaseVelocity = BaseVelocity + (Camera.CFrame.UpVector * FlightSpeed)
                    end
                    if UserInputService:IsKeyDown(SpeedKey) then
                        BaseVelocity = BaseVelocity * SpeedKeyMultiplier
                    end
                end
                if UserRootPart then
                    local car = UserRootPart:GetRootPart()
                    if car.Anchored then return end
                    if not isnetworkowner(car) then return end
                    CurrentVelocity = CurrentVelocity:Lerp(
                        BaseVelocity,
                        math.clamp(delta * FlightAcceleration, 0, 1)
                    )
                    car.Velocity = CurrentVelocity + Vector3.new(0,2,0)
                    if car ~= UserRootPart then
                        car.RotVelocity = Vector3.new(0,0,0)
                        car.CFrame = car.CFrame:Lerp(CFrame.lookAt(
                            car.Position,
                            car.Position + CurrentVelocity + Camera.CFrame.LookVector
                        ), math.clamp(delta * TurnSpeed, 0, 1))
                    end
                end
            end
            
            UserInputService.InputBegan:Connect(function(userInput,gameProcessed)
                if gameProcessed then return end
                if userInput.KeyCode == FlyKey then
                    if Connection then
            
                        
                        Connection:Disconnect()
                        Connection = nil
                    else
            
                        
                        CurrentVelocity = UserRootPart.Velocity
                        Connection = RunService.Heartbeat:Connect(Flight)
                    end
                end
            end)
	end,
})

local Slider = PlayerTab:CreateSlider({
	Name = "Walkspeed",
	Range = {0, 100},
	Increment = 1,
	Suffix = "Times faster than normal",
	CurrentValue = 1,
	Flag = "SpeedSlider",
	Callback = function(Value)
		TargetWalkspeed = Value
    	game:GetService("RunService").RenderStepped:Connect(function()
			pcall(function()
				if game.Players.LocalPlayer.Character.Humanoid.MoveDirection.Magnitude > 0 then
					game.Players.LocalPlayer.Character:TranslateBy(game.Players.LocalPlayer.Character.Humanoid.MoveDirection * TargetWalkspeed/100)
				end
			end)
		end)
	end,
})



local VisualTab = Window:CreateTab("Visuals", 4483362458)
local Section = VisualTab:CreateSection("ESP Section")
local Label = VisualTab:CreateLabel("Visual Tab")

local Button = VisualTab:CreateButton({
	Name = "ESP (Resource Intensive)",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Stefanuk12/ROBLOX/master/Universal/ESP/Examples/PlayerESP.lua"))()
	end,
})

local Button = VisualTab:CreateButton({
	Name = "Chat Spy",
	Callback = function()

local Players = game:GetService("Players")

local ChatFrame = Players.LocalPlayer.PlayerGui.Chat.Frame

ChatFrame.ChatChannelParentFrame.Visible = true
ChatFrame.ChatBarParentFrame.Position = UDim2.new(0, 0, 1, -42)
	end,
})

local Button = VisualTab:CreateButton({
	Name = "Fullbright",
	Callback = function()
		local Light = game:GetService("Lighting")
    
            function dofullbright()
            Light.Ambient = Color3.new(1, 1, 1)
            Light.ColorShift_Bottom = Color3.new(1, 1, 1)
            Light.ColorShift_Top = Color3.new(1, 1, 1)
            end
            
            dofullbright()
            
            Light.LightingChanged:Connect(dofullbright)
	end,
})