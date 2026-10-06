# Customization

Almost everything in the menu can be changed: the layout, the names, the colors, the fonts, the built-in pages and the overlays. You can also add UI of your own.

There are two kinds of changes:

- **Your defaults.** You set them in `CreateWindow`, and they are what a new player sees.
- **Player choices.** Players change things in Settings, and their choices are saved. Your defaults never overwrite what a player picked.

- [Window options](#window-options)
- [Default for any setting](#default-for-any-setting)
- [The sidebar](#the-sidebar)
- [Built-in pages](#built-in-pages)
- [Themes and colors](#themes-and-colors)
- [Fonts](#fonts)
- [Size and shape](#size-and-shape)
- [Logo and background](#logo-and-background)
- [UI button](#ui-button)
- [Watermark](#watermark)
- [Notifications](#notifications)
- [Music card](#music-card)
- [Render](#render)
- [Roblox GUI](#roblox-gui)
- [Dialogs and prompts](#dialogs-and-prompts)
- [Widgets](#widgets)
- [Tooltips](#tooltips)
- [Reset buttons](#reset-buttons)
- [Locking the menu](#locking-the-menu)
- [Your own elements](#your-own-elements)
- [Your own pages](#your-own-pages)
- [Keep your UI in theme colors](#keep-your-ui-in-theme-colors)

## Window options

Everything `CreateWindow` accepts:

```lua
local Window = Broly:CreateWindow({
	Title = "My Script",
	Subtitle = "v1.0",
	Author = "you",
	Version = "1.0",
	Credits = {{"Testing", "friend"}},
	Logo = "rbxassetid://123456",
	Folder = "MyScript",

	Theme = "Purple",
	Accent = Color3.fromRGB(170, 110, 255),
	Font = "GothamSSm",
	ToggleStyle = "Checkbox",
	Scale = 100,
	Width = 900,
	Height = 640,
	SidebarWidth = 200,
	Resizable = true,

	Blur = true,
	Particles = "Snow",
	Background = {Image = "https://files.catbox.moe/example.png", Opacity = 0.4, Darken = 0.5},

	MenuKey = "RightShift",
	OpenOnLoad = true,
	LoadNotification = true,
	NotifySide = "Top Right",
	Watermark = true,
	WatermarkText = "My Script",
	Keybinds = true,
	Keystrokes = false,
	UIButton = true,
	Search = true,
	Sounds = true,
	Notifications = true,

	Dashboard = false,
	Server = false,
	Tools = false,
	Groups = {Main = "Home"},
	Pages = {Profile = false},

	Defaults = {ui_radius = 10},
	KeySystem = nil,
	ShowErrors = false,
})
```

| Option | Default | What it does |
|---|---|---|
| `Title` | `"broly"` | name in the sidebar and the watermark |
| `Subtitle` | none | small text under the title |
| `Author`, `Version` | none | shown in Settings > General > About |
| `Credits` | none | more names in About: `{{"Role", "name"}, ...}` |
| `Logo` | none | an asset id, a number, an image link, or one or two letters. Shows in the sidebar, the watermark and the UI button. |
| `Folder` | `"broly"` | where saves go. Give every script its own. |
| `SubFolder` | none | a folder inside `Folder` for configs, for example one per game |
| `Theme` | `"Dark"` | see [Themes](#themes-and-colors) |
| `Accent` | the theme's | the highlight color, as a `Color3` or hex string |
| `Colors` | none | change single theme colors, see [Themes](#themes-and-colors) |
| `Font` | `"BuilderSans"` | see [Fonts](#fonts) |
| `ToggleStyle` | `"Switch"` | `"Switch"`, `"Square"` or `"Checkbox"` |
| `Scale` | `100` | size of the whole menu in percent, `75` to `130` |
| `Width`, `Height` | `880`, `640` | window size in pixels |
| `SidebarWidth` | `188` | width of the sidebar |
| `Resizable` | `true` | players can drag the corner to resize, and the size is saved |
| `Blur` | `true` | blurs the game while the menu is open |
| `Particles` | `"Snow"` | `"Snow"`, `"Sparkles"`, `"Dust"` or `"Off"` |
| `Background` | none | an image behind the menu, see [Logo and background](#logo-and-background) |
| `MenuKey` | `"RightShift"` | the key that opens and closes the menu |
| `OpenOnLoad` | `true` | `false` keeps the menu closed until the key is pressed |
| `LoadNotification` | `true` | the "loaded" notification. `false` hides it, a string changes its text. |
| `NotifySide` | `"Top Right"` | where notifications show |
| `Watermark` | `true` | the bar at the top of the screen |
| `WatermarkText` | the title | the text in it |
| `Keybinds` | `true` | the list of bound keys |
| `Keystrokes` | `false` | shows key and mouse presses on screen |
| `UIButton` | `true` | the button that opens the menu. `false` hides it, `{Icon = "...", Text = "..."}` changes it. |
| `Search` | `true` | the search box |
| `Sounds` | `true` | menu sounds. `false` also hides the Sounds page. |
| `Notifications` | `true` | `false` turns notifications off until a player turns them on |
| `Dashboard`, `Server`, `Tools` | off | optional built-in pages |
| `Settings` | on | `false` removes the whole Settings group |
| `Groups` | built-in names | rename the built-in sidebar headings |
| `Pages` | built-in pages | rename, re-icon or hide built-in pages, see [Built-in pages](#built-in-pages) |
| `Defaults` | none | the default of any setting, see below |
| `KeySystem` | none | see [Key system](getting-started.md#key-system) |
| `ShowErrors` | `false` | show errors from your callbacks as notifications |

## Default for any setting

Every option in Settings is a flag. `Defaults` sets what it starts at for new players:

```lua
Broly:CreateWindow({
	Title = "My Script",
	Defaults = {
		ui_radius = 8,
		ui_density = "Compact",
		ui_glass = false,
		fx_style = "Off",
		wm_style = "Minimal",
		wm_time = true,
		nt_pos = "Bottom Right",
		ov_ks = true,
	},
})
```

Players can still change them, and their choice wins. Every setting flag is listed in [Reference](reference.md#built-in-settings).

To change a setting right now, even over the player's choice, set the flag:

```lua
Broly.Flags.ui_radius = 8
```

## The sidebar

### Groups

```lua
local Main = Window:Group("Main")
local Extra = Window:Group({Name = "Extra", Order = 2})
```

| Method | What it does |
|---|---|
| `SetName(text)` | renames it |
| `SetVisible(bool)` | hides or shows it with its tabs |
| `SetOrder(n)` | its place in the sidebar. Lower comes first. |
| `Destroy()` | removes it and its tabs |
| `GetTab(name)` | finds a tab by name |

### Tabs

```lua
local Aim = Main:Tab({
	Name = "Aim",
	Icon = "crosshair",
	Description = "Aim options",
	Order = 1,
})
```

| Option | What it does |
|---|---|
| `Name` | the name in the sidebar and the page title |
| `Icon` | see [Icons](icons.md) |
| `Description` | shown when the mouse is over the tab |
| `Order` | its place in the group |
| `Locked` | `true` or a reason. The tab can't be opened, and the reason shows as a notification when clicked. |
| `Visible` | `false` hides it |
| `ShowWhen` | only shown while a condition is true, see [Conditions](elements.md#conditions) |
| `Flag` | a fixed id for the tab. Useful if you rename tabs, because the last opened page is remembered by id. |

Change them later:

```lua
Aim:SetName("Combat")
Aim:SetIcon("swords")
Aim:SetDescription("Everything for fights")
Aim:Lock("Buy the full version")
Aim:Unlock()
Aim:SetVisible(false)
Aim:SetOrder(3)
Aim:Select()
Aim:Destroy()
```

Sub-tabs have the same options and methods, plus `MoveTo(index)` to change their place under the parent tab.

### Sections

```lua
local Movement = Player:Section({Name = "Movement", Side = "Left", Order = 1})

Movement:SetName("Motion")
Movement:SetSide("Right")
Movement:SetOrder(2)
Movement:SetShowWhen("advanced_mode")
Movement:SetVisible(false)
Movement:Destroy()
```

Find tabs and sections again by name, including the built-in ones:

```lua
local tab = Window:GetTab("Player")
local section = tab:GetSection("Movement")
local sub = tab:GetSubTab("Camera")
```

## Built-in pages

The built-in pages are General, Appearance, Overlays, Profile, Music, Sounds, Configs, and the optional Dashboard, Server and Tools.

Rename, re-icon or hide them when making the window:

```lua
Broly:CreateWindow({
	Title = "My Script",
	Groups = {Main = "Home", Utility = "Extras", Settings = "Options"},
	Pages = {
		General = "Menu",
		Appearance = {Name = "Look", Icon = "brush"},
		Profile = false,
		Sounds = false,
	},
})
```

Or change them any time, like your own tabs:

```lua
Window:GetGroup("Settings"):SetName("Options")
Window:GetTab("Appearance"):SetName("Look"):SetIcon("brush")
Window:GetTab("Sounds"):SetVisible(false)
```

You can add sections and elements to a built-in page too:

```lua
local general = Window:GetTab("General")
general:Section("My Script"):Toggle({Name = "Auto Update", Flag = "auto_update"})
```

The About section and the broly lib credit can't be removed.

## Themes and colors

### Pick a theme

Built in: `Dark`, `Gray`, `Blue`, `Green`, `Purple`, `Orange`, `Pink` and `Light`.

```lua
Broly:CreateWindow({Title = "My Script", Theme = "Blue"})
Broly.Theme:Set("Green")
print(table.concat(Broly.Theme:List(), ", "))
```

Each theme has its own accent. `Accent` sets your own:

```lua
Broly:CreateWindow({Title = "My Script", Theme = "Dark", Accent = Color3.fromRGB(255, 140, 60)})
Window:SetAccent(Color3.fromRGB(80, 200, 255))
```

### Make your own theme

```lua
Broly.Theme:Register("Ocean", {
	Background = Color3.fromRGB(10, 16, 24),
	Panel = Color3.fromRGB(14, 22, 32),
	Card = Color3.fromRGB(20, 30, 44),
	Text = Color3.fromRGB(235, 242, 250),
	Subtext = Color3.fromRGB(130, 150, 175),
	Accent = Color3.fromRGB(80, 170, 255),
})

Broly:CreateWindow({Title = "My Script", Theme = "Ocean"})
```

The theme also shows in the players' theme list.

| Color | Used for |
|---|---|
| `Background` | the window |
| `Panel` | the sidebar and the header |
| `Card` | the cards that hold elements |
| `Field` | boxes, dropdowns and inputs |
| `Hover` | the color under the mouse |
| `Popup` | dropdowns, pickers and menus |
| `Text` | titles and values |
| `Label` | element names |
| `Subtext` | icons and secondary text |
| `Dim` | the faintest text, like section titles |
| `Accent` | switches, sliders and highlights |

Only `Background` is needed. Colors you leave out are worked out from the others. Colors can be a `Color3` or a hex string.

### Change single colors

Change one color on top of whatever theme is picked:

```lua
Broly.Theme:SetColor("Card", Color3.fromRGB(30, 30, 36))
Broly.Theme:SetColors({Text = "#FFFFFF", Accent = "#FF4070"})
Broly.Theme:ResetColor("Card")
Broly.Theme:ResetColor()
```

The same works when making the window with `Colors = {Card = ..., Text = ...}`.

### What players can do

In Settings > Appearance players can:

- pick a theme and an accent
- change the Background, Panel, Cards, Text and Muted Text colors. Changing any of them switches to the `Custom` theme. The menu updates while they drag in the color picker.
- reset any single color, or a whole section, with the small reset buttons. When every color is back to the theme's, the menu switches back to that theme.

### Share a theme

```lua
local code = Broly.Theme:Export()
Broly.Theme:Import(code)
Broly.Theme:Import(code, "Friend's Theme")
```

### React to theme changes

```lua
local theme = Broly.Theme:Get()
print(theme.Name, theme.Accent, theme.Card)

Broly.Theme:OnChanged(function(theme)
	print("now using", theme.Name)
end)
```

## Fonts

```lua
Broly:CreateWindow({Title = "My Script", Font = "GothamSSm"})
Window:SetFont("Montserrat")
```

Built in: `BuilderSans`, `GothamSSm`, `Montserrat`, `Arimo`, `Roboto`, `Ubuntu`, `Nunito`, `Oswald`, `TitilliumWeb` and `Michroma`.

Add any Roblox font family:

```lua
Broly:AddFont("Fredoka", "rbxasset://fonts/families/FredokaOne.json")
Window:SetFont("Fredoka")
```

## Size and shape

```lua
Broly:CreateWindow({
	Title = "My Script",
	Width = 960,
	Height = 680,
	SidebarWidth = 210,
	Scale = 90,
	ToggleStyle = "Square",
	Defaults = {ui_radius = 6, ui_density = "Compact"},
})
```

- `Scale` resizes everything at once. Players change it in Settings > Appearance > Size.
- `ui_radius` is how round corners are, from `4` to `20`.
- `ui_density = "Compact"` puts rows closer together.
- `Resizable = false` stops players from dragging the corner.

Change them while the script runs:

```lua
Window:SetSize(1000, 700)
Window:SetScale(110)
Window:Center()
Window:Minimize(true)
```

## Logo and background

`Logo` shows in the sidebar, the watermark and the UI button.

```lua
Broly:CreateWindow({Title = "My Script", Logo = "https://files.catbox.moe/logo.png"})
Broly:CreateWindow({Title = "My Script", Logo = 1234567})
Broly:CreateWindow({Title = "My Script", Logo = "MS"})
Window:SetLogo("rbxassetid://1234567")
```

`Background` puts an image behind the menu:

```lua
Broly:CreateWindow({
	Title = "My Script",
	Background = {Image = "https://files.catbox.moe/bg.png", Opacity = 0.5, Darken = 0.4, Fit = "Crop"},
})

Window:SetBackground({Image = "rbxassetid://1234567"})
Window:SetBackground({Enabled = false})
```

| Option | What it does |
|---|---|
| `Image` | an image link, an asset id or a number |
| `Opacity` | how visible it is, `0` to `1` |
| `Darken` | how much darker it is made so text stays readable, `0` to `0.9` |
| `Fit` | `"Crop"`, `"Fit"`, `"Stretch"` or `"Tile"` |

Links must point straight to a PNG or JPG. They are downloaded once and saved. Players can set their own background and profile picture in Settings > Profile.

## UI button

A small button on screen that opens and closes the menu. It's on by default, players can drag it, and they can turn it off in Settings.

```lua
Broly:CreateWindow({Title = "My Script", UIButton = {Icon = "menu"}})
Broly:CreateWindow({Title = "My Script", UIButton = {Text = "MS"}})
Broly:CreateWindow({Title = "My Script", UIButton = false})
```

## Watermark

```lua
Broly:CreateWindow({Title = "My Script", WatermarkText = "My Script v1"})
Broly:SetWatermark({Text = "My Script | Farming"})
Broly:SetWatermark({Visible = false})
```

Add your own live values. `Get` is called every second:

```lua
local kills = 0
Broly:AddWatermarkPart("kills", {Icon = "swords", Get = function() return kills .. " kills" end})
Broly:RemoveWatermarkPart("kills")
```

Players pick which parts show in Settings > Overlays: frame rate, ping, location, session time, clock, executor and account.

## Notifications

```lua
Broly:Notify({Title = "Saved", Content = "Your config was saved."})
Broly:Notify({Title = "Error", Content = "Could not load.", Kind = "Error"})
```

| Option | What it does |
|---|---|
| `Title`, `Content` | the text |
| `Kind` | `"Info"`, `"Success"`, `"Warning"` or `"Error"`. Sets the icon and color. |
| `Icon` | any [icon](icons.md) |
| `Color` | your own color, as a `Color3` or hex string |
| `Duration` | seconds on screen |
| `Persist` | `true` keeps it until clicked |
| `Buttons` | buttons on the notification: `{{Name = "Yes", Callback = fn}, {Name = "No"}}` |
| `Callback` | runs when the notification is clicked |
| `Sound` | `false` for no sound |
| `Compact` | a slim one-line style |

It returns a handle for live updates:

```lua
local n = Broly:Notify({Title = "Downloading", Content = "0%", Persist = true})
for i = 1, 10 do
	task.wait(0.2)
	n:SetProgress(i / 10)
	n:SetBody(i * 10 .. "%")
end
n:SetTitle("Done")
task.wait(1)
n:Dismiss()
```

Players pick the corner, the style, the duration and how many show at once in Settings > Overlays. `Broly:SetNotifySide("Bottom Left")` changes the corner from code.

Every notification is also kept in the bell menu in the header.

## Music card

The menu ships with a Spotify overlay. Players paste a playlist, album or track link in Settings > Music and press Load Playlist, and a card shows up on screen with the cover, the track name, the artist, the playlist name, the real length of the track in seconds and minutes, a progress bar and previous / play / next buttons. It behaves like every other overlay: drag it while the menu is open, Lock Positions holds it still, Reset Positions puts it back, Hide In Menu hides it while the menu is open and Clean Screenshot hides it for five seconds.

```lua
Broly.Music:Load("https://open.spotify.com/playlist/37i9dQZF1DXcBWIGoYBM5M")
Broly.Music:Next()
Broly.Music:SetVisible(false)

Broly:OnFlag("__music", function()
	local track = Broly.Music:Track()
	if track then print(track.title, "-", track.artist) end
end)
```

The audio is downloaded and played through the executor, so it works like a normal sound. Spotify only shares the short preview of each song, so the card loops that preview until the real length of the track is over. If you would rather not use Spotify audio at all, put a Roblox asset id in Sound ID and that sound plays instead, through Roblox itself, with no ads. Test Sound tells you right away whether your executor can play audio.

```lua
Broly:CreateWindow({
	Title = "My Script",
	Defaults = {
		sp_link = "https://open.spotify.com/playlist/37i9dQZF1DXcBWIGoYBM5M",
		sp_size = "Large",
		sp_style = "Solid",
		sp_sound = "rbxassetid://1843529634",
	},
})

Broly:SetFlag("sp_on", false)
Broly:SetFlag("sp_cover", true)
```

The link, every option and the read playlist are saved with your config, so the card is already on screen the next time the script runs.

| Method | What it does |
|---|---|
| `Broly.Music:Load(link)` | reads a playlist, album or track link |
| `Broly.Music:Next()`, `:Previous()` | skip a track |
| `Broly.Music:Play()`, `:Pause()`, `:Toggle()` | playback |
| `Broly.Music:Shuffle()` | new random order, same track |
| `Broly.Music:Clear()` | forget the playlist |
| `Broly.Music:SetVisible(on)` | show or hide the card |
| `Broly.Music:Track()` | the current `{title, artist, index, length, elapsed, preview}` |
| `Broly.Music:Playlist()` | `{title, owner, kind, id, count, cover}` |
| `Broly.Music:IsPlaying()`, `:Status()` | playback state, status text |

## Render

Visuals, Render collects everything that changes how the game looks and feels. Every option here is undone when **Apply Live** is turned off, when you reset the section, or when you eject.

| Option | What it does |
|---|---|
| `gx_level` | graphics level, 0 is the lowest |
| `gx_texture` | texture quality, 0 to 6 |
| `gx_mesh` | mesh detail, 0 to 4 |
| `gx_aa` | anti aliasing, 0, 2, 4 or 8 |
| `gx_dist` | how far you can see, in studs |
| `gx_terrain` | `Default`, `Low` or `High` ground quality |
| `gx_water` | `Default`, `Reflective` or `Matte` water |
| `gx_shadowmode` | `Default`, `Force Quality` or `Force Hard` |
| `gx_globalshadows` | shadows from every light |
| `gx_shadowsoft` | how blurry the shadows are |
| `gx_live` | keep everything applied while you play |
| `px_gravity` | gravity for everything |
| `px_fps` | physics frames per second, lower saves CPU |
| `px_network` | make this client own the physics |
| `px_collide` | turn collisions off for every part |
| `cm_shift` | move the view up or down |
| `wd_gravity` | baseplate gravity |
| `wd_wave_size`, `wd_wave_speed` | water waves |
| `wd_water_trans`, `wd_water_refl`, `wd_water_color` | water look |
| `wd_wind_x`, `wd_wind_y`, `wd_wind_z` | constant force from each direction |

```lua
Window:GetTab("Render"):Select()
Broly:SetFlag("gx_level", 1)
Broly:SetFlag("px_fps", 40)
```

## Roblox GUI

Visuals, Roblox GUI turns the interfaces Roblox itself draws on or off. Turning off core chat also hides messages, so use the music card or the watermark if you need text.

| Option | What it does |
|---|---|
| `rb_topbar` | the Roblox top bar |
| `rb_corechat` | the chat window |
| `rb_emotes` | the emote button |
| `rb_health` | health in the player list |
| `rb_backpack` | the inventory |
| `rb_camera` | the camera view button |
| `rb_microphone` | the voice button |
| `rb_leaderboard` | the scoreboard |
| `act_rb_reset` | turns all of them back on |

```lua
Window:GetTab("Roblox GUI"):Select()
Broly:RunAction("act_rb_reset")
```

## Dialogs and prompts

A dialog is a popup in the middle of the menu:

```lua
Broly:Dialog({
	Title = "Delete save?",
	Content = "This can't be undone.",
	Icon = "trash-2",
	Buttons = {
		{Name = "Cancel"},
		{Name = "Delete", Style = "Danger", Callback = function() print("deleted") end},
	},
})
```

- Button `Style` is `"Primary"`, `"Danger"` or `"Default"`. The last button is primary unless you say otherwise.
- `Keep = true` on a button keeps the dialog open after it's clicked.
- `Dismissable = false` stops players from closing it by clicking outside.

A prompt asks for text:

```lua
Broly:Prompt({
	Title = "Rename",
	Placeholder = "New name",
	Default = "My Save",
	Validate = function(text)
		if #text < 3 then return false, "At least 3 letters." end
		return true
	end,
	Callback = function(text) print(text) end,
})
```

## Widgets

A widget is a small panel on screen that stays visible with the menu closed. Players can drag it.

```lua
local stats = Broly:Widget({Name = "Stats", Icon = "chart-column", Rows = {{"Coins", 0}, {"Level", 1}}})

stats:SetRow("Coins", 150)
stats:SetRow("Status", "Farming", Color3.fromRGB(80, 220, 140))
stats:RemoveRow("Level")
stats:SetTitle("Farm Stats")
stats:SetVisible(false)
stats:Clear()
stats:Destroy()
```

## Tooltips

Elements and tabs get tooltips from `Description`. For your own UI:

```lua
Broly:AddTooltip(myButton, "Opens the shop")
```

## Reset buttons

Settings > Appearance has small reset buttons. A reset icon shows next to any option that isn't at its default, and a `Reset` link shows next to the title of any section with changes.

Give your own elements and sections the same buttons:

```lua
local Aim = Tab:Section({Name = "Aim", ResetButton = true})
Aim:Slider({Name = "Smoothness", Min = 1, Max = 20, Default = 5})

Other:Slider({Name = "Range", Min = 1, Max = 500, Default = 100, ResetButton = true})
```

## Locking the menu

Disable every element on your pages, for example while waiting for something:

```lua
Window:LockAll("Loading, please wait")
task.wait(3)
Window:UnlockAll()
```

Settings pages stay usable.

## Your own elements

`Custom` gives you an empty frame inside a card. Build anything in it.

```lua
Section:Custom({Name = "Health", Height = 30, Build = function(frame, ui)
	local back = ui.Frame({Size = UDim2.fromScale(1, 1), BackgroundColor3 = ui.Theme.field, Parent = frame})
	ui.Corner(back, 6)

	local bar = ui.Frame({Size = UDim2.fromScale(0.7, 1), BackgroundColor3 = ui.Accent(), Parent = back})
	ui.Corner(bar, 6)
	ui.OnAccent(function(color) bar.BackgroundColor3 = color end)

	ui.Connect(game:GetService("RunService").Heartbeat, function()
		local h = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
		if h then bar.Size = UDim2.fromScale(h.Health / h.MaxHealth, 1) end
	end)
end})
```

`ui` has:

| Name | What it is |
|---|---|
| `ui.Theme` | the current colors: `win`, `panel`, `card`, `field`, `hover`, `pop`, `text`, `label`, `sub`, `dim` |
| `ui.Accent()` | the accent color |
| `ui.Frame(props)`, `ui.Text(props)`, `ui.Button(props)` | make a frame, a text label or a button in the menu's style |
| `ui.Icon(name, size, color, props)` | an icon |
| `ui.Corner(obj, radius)`, `ui.Stroke(obj, transparency)` | round corners and an outline |
| `ui.Tween(obj, seconds, props)` | animate |
| `ui.Font(weight)` | the menu font, `"reg"`, `"med"`, `"semi"` or `"bold"` |
| `ui.Tip(obj, text)` | a tooltip |
| `ui.Play(sound)` | a menu sound, like `"click"` |
| `ui.Connect(signal, fn)` | a connection that is cleaned up when the menu redraws |
| `ui.Cleanup(fn)` | runs when the menu redraws |
| `ui.OnAccent(fn)` | runs when the accent changes |
| `ui.Get()`, `ui.Set(value)`, `ui.OnChanged(fn)` | the element's own saved value, when you give it a `Flag` or `Default` |

`Build` runs again whenever the menu redraws, for example after a theme change. Keep your state outside of `Build`.

### Reusable element types

`RegisterElement` turns a builder into a new element every section has:

```lua
Broly:RegisterElement("Meter", {Height = 20, Default = 0, Build = function(frame, ui, options)
	local fill = ui.Frame({Size = UDim2.fromScale(ui.Get(), 1), BackgroundColor3 = options.Color or ui.Accent(), Parent = frame})
	ui.Corner(fill, 4)
	ui.OnChanged(function(value) ui.Tween(fill, 0.3, {Size = UDim2.fromScale(value, 1)}) end)
end})

local load = Section:Meter({Name = "Load", Flag = "load", Color = Color3.fromRGB(80, 220, 140)})
load:Set(0.8)
```

## Your own pages

A tab can be one big frame you fill yourself:

```lua
Main:Tab({Name = "Canvas", Icon = "image"}):CustomPage(function(frame, ui)
	ui.Text({Text = "Anything goes here", Size = UDim2.new(1, 0, 0, 30), Parent = frame})
end)
```

It gets the same `ui` helpers as `Custom`.

## Keep your UI in theme colors

For UI you made outside the menu, `Bind` keeps its colors in sync with the theme:

```lua
Broly.Theme:Bind(myFrame, {BackgroundColor3 = "Card", BorderColor3 = "Accent"})
Broly.Theme:Bind(myLabel, {TextColor3 = "Text"})
Broly.Theme:Unbind(myFrame)
```
