local Broly = loadstring(game:HttpGet("https://raw.githubusercontent.com/obitoxxw-max/Broly-UI/refs/heads/main/broly.lua"))()

local Window = Broly:CreateWindow({
	Title = "Example",
	Author = "you",
	Version = "1.0",
	Folder = "BrolyExample",
})

local function humanoid()
	local character = game.Players.LocalPlayer.Character
	return character and character:FindFirstChildOfClass("Humanoid")
end

local Main = Window:Group("Main")

local Player = Main:Tab({Name = "Player", Icon = "user"})
local Movement = Player:Section("Movement")

local speed = Movement:Toggle({
	Name = "Speed",
	Keybind = "V",
	Description = "Walk faster.",
	Callback = function(on)
		local hum = humanoid()
		if not hum then return end
		if on then
			Broly:Patch(hum, "WalkSpeed", Broly.Flags.walk_speed)
		else
			Broly:Restore(hum, "WalkSpeed")
		end
	end,
})

Movement:Slider({
	Name = "Walk Speed",
	Flag = "walk_speed",
	Min = 16,
	Max = 100,
	Default = 32,
	ShowWhen = speed,
	Callback = function(value)
		local hum = humanoid()
		if hum and speed:Get() then Broly:Patch(hum, "WalkSpeed", value) end
	end,
})

local Options = Player:Section({Name = "Options", Side = "Right"})

Options:Dropdown({Name = "Target", Special = "Players"})
Options:ColorPicker({Name = "Color", Default = Color3.fromRGB(255, 80, 80)})
Options:Keybind({Name = "Action Key", Default = "F", Callback = function()
	Broly:Notify({Title = "Action", Content = "You pressed the action key."})
end})
Options:Button({Name = "Say Hi", Callback = function()
	Broly:Notify({Title = "Hi", Content = "Buttons run your code.", Kind = "Success"})
end})

local World = Main:Tab({Name = "World", Icon = "sun"})
local Lighting = World:Section("Lighting")

Lighting:Toggle({Name = "Always Day", Callback = function(on)
	if on then
		Broly:Patch(game.Lighting, "ClockTime", 14)
	else
		Broly:Restore(game.Lighting, "ClockTime")
	end
end})

Lighting:Segmented({Name = "Mode", Values = {"Soft", "Normal", "Bright"}, Default = "Normal"})

-- Settings > Music already has a link box, Load Playlist and every card option.
-- These lines only show the same overlay from your own code.
Broly.Music:Load("https://open.spotify.com/playlist/37i9dQZF1DXcBWIGoYBM5M")

Broly:OnFlag("__music", function()
	local track = Broly.Music:Track()
	if track then Broly:Notify({Title = "Now playing", Content = track.title .. " · " .. track.artist, Icon = "music", Duration = 3}) end
end)

-- Visuals > Render has the graphics, physics, camera and world tweaks.
-- Visuals > Roblox GUI hides the topbar, chat, backpack and the buttons.
Broly:GetTab("Render"):Select()
