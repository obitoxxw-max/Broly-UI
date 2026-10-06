
<h1 align="center">broly lib</h1>

<p align="center">UI library for Roblox.</p>

<p align="center">
  <a href="docs/getting-started.md">Getting started</a>
  &nbsp;·&nbsp;
  <a href="docs/elements.md">Elements</a>
  &nbsp;·&nbsp;
  <a href="docs/customization.md">Customization</a>
  &nbsp;·&nbsp;
  <a href="docs/icons.md">Icons</a>
  &nbsp;·&nbsp;
  <a href="docs/examples.md">Examples</a>
  &nbsp;·&nbsp;
  <a href="docs/reference.md">Reference</a>
  &nbsp;·&nbsp;
  <a href="example.lua">Example</a>
</p>

<br>

```lua
local Broly = loadstring(game:HttpGet("https://raw.githubusercontent.com/obitoxxw-max/Broly-UI/refs/heads/main/broly.lua"))()
```

<br>


## Example

```lua
local Broly = loadstring(game:HttpGet("https://raw.githubusercontent.com/obitoxxw-max/Broly-UI/refs/heads/main/broly.lua"))()

local Window = Broly:CreateWindow({Title = "My Script", Author = "you", Folder = "MyScript"})

local Main = Window:Group("Main")
local Player = Main:Tab({Name = "Player", Icon = "user"})
local Movement = Player:Section("Movement")

local speed = Movement:Toggle({Name = "Speed", Keybind = "V", Callback = function(on) end})
Movement:Slider({Name = "Walk Speed", Min = 16, Max = 100, Default = 32, ShowWhen = speed})
Movement:Button({Name = "Reset", Callback = function() end})
```

The full example is in [example.lua](example.lua).

## Music overlay

Paste a Spotify playlist, album or track link in **Settings > Music** and press Load Playlist. A card with the cover art, the track name, the artist and a progress bar shows up on screen like the watermark or the keybind list, with previous, play and next buttons you can click.

The music is downloaded and played through your executor. The card shows the real length of each track in seconds and minutes, loops Spotify's short preview until the track is over, and can play a Roblox sound id instead if you want audio with no third party at all.

Everything about it is an option: card style, size, roundness, transparency, accent color, playlist colors, spinning cover, auto refresh, and switches for the cover, the track name, the artist, the playlist name, the progress bar, the times, the track number, the buttons, shuffling and repeat. The link and the playlist are saved with your config, so the card is already there the next time you run the script.

```lua
Broly.Music:Load("https://open.spotify.com/playlist/37i9dQZF1DXcBWIGoYBM5M")
Broly.Music:Next()
local track = Broly.Music:Track()
```

More in [the docs](docs/customization.md#music-card).

## Game look

**Visuals → Render** holds the graphics level, texture, mesh, anti aliasing, render distance, terrain, water, shadows, physics, camera and world tweaks. Every change goes back to normal when you turn **Apply Live** off or eject.

**Visuals → Roblox GUI** turns the topbar, core chat, emote menu, health, backpack, camera, microphone and leaderboard on or off, with one button to restore all of them.

More in [the docs](docs/customization.md#render).

## Credits

broly lib by [psych0pat3](https://github.com/obitoxxw-max/Broly-UI). Icons by [Lucide](https://lucide.dev).
