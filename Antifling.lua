loadstring([[
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "AntiFlingGui"
gui.ResetOnSpawn = false
gui.Parent = game.CoreGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0,220,0,120)
frame.Position = UDim2.new(0.5,-110,0.5,-60)
frame.BackgroundColor3 = Color3.fromRGB(35,35,35)
frame.Parent = gui

local box = Instance.new("TextBox")
box.Size = UDim2.new(0,200,0,35)
box.Position = UDim2.new(0,10,0,10)
box.PlaceholderText = "Nombre del jugador"
box.Text = ""
box.TextColor3 = Color3.new(1,1,1)
box.BackgroundColor3 = Color3.fromRGB(50,50,50)
box.Parent = frame
  local button = Instance.new("TextButton")
button.Size = UDim2.new(0,200,0,35)
button.Position = UDim2.new(0,10,0,55)
button.Text = "Dar AntiFling"
button.TextColor3 = Color3.new(1,1,1)
button.BackgroundColor3 = Color3.fromRGB(70,70,70)
button.Parent = frame

local status = Instance.new("TextLabel")
status.Size = UDim2.new(0,200,0,20)
status.Position = UDim2.new(0,10,0,95)
status.Text = ""
status.TextColor3 = Color3.new(1,1,1)
status.BackgroundTransparency = 1
status.Parent = frame

local conexiones = {}

local function aplicarAntiFling(plr)
	if conexiones[plr] then
		conexiones[plr]:Disconnect()
end
  local function setup(char)
		local hrp = char:WaitForChild("HumanoidRootPart")

		conexiones[plr] = RunService.Heartbeat:Connect(function()
			if hrp and hrp.Parent then
				hrp.AssemblyAngularVelocity = Vector3.zero

				if hrp.AssemblyLinearVelocity.Magnitude > 100 then
					hrp.AssemblyLinearVelocity = Vector3.zero
				end
			end
		end)
	end

	if plr.Character then
		setup(plr.Character)
	end

	plr.CharacterAdded:Connect(setup)
end

button.MouseButton1Click:Connect(function()
	local nombre = box.Text
	local objetivo = Players:FindFirstChild(nombre)

	if objetivo then
		aplicarAntiFling(objetivo)
		status.Text = "AntiFling dado a "..nombre
	else
		status.Text = "Jugador no encontrado"
	end
end)
]])()
