---@module 'hl'

-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓

-- ┃                         Keybinds                            ┃

-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

local defaults = require("config.defaults")
local mainMod = "SUPER"


-- https://wiki.hyprland.org/Configuring/Binds/

hl.bind(mainMod .. " + " .. "RETURN", hl.dsp.exec_cmd(defaults.terminal))

hl.bind(mainMod .. " + " .. "E", hl.dsp.exec_cmd(defaults.filemanager))

hl.bind(mainMod .. " + " .. "Q", hl.dsp.window.close())

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "M", hl.dsp.exec_cmd("loginctl terminate-user \"\""))

hl.bind(mainMod .. " + " .. "V", hl.dsp.window.float())

hl.bind(mainMod .. " + " .. "SPACE", hl.dsp.exec_cmd(defaults.applauncher))

hl.bind(mainMod .. " + " .. "F", hl.dsp.window.fullscreen())

hl.bind(mainMod .. " + " .. "Y", hl.dsp.window.pin())

hl.bind(mainMod .. " + " .. "J", hl.dsp.layout("togglesplit"))

-- dwindle

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "S", hl.dsp.exec_cmd("flameshot screen -n 1 --edit"))

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "D", hl.dsp.exec_cmd("flameshot screen -n 0 --edit"))

hl.bind("CTRL + Print", hl.dsp.exec_cmd(defaults.shotwindow))

hl.bind("ALT + Print", hl.dsp.exec_cmd(defaults.shotscreen))

-- ======= Grouping Windows =======

hl.bind(mainMod .. " + " .. "K", hl.dsp.group.toggle())

hl.bind(mainMod .. " + " .. "Tab", hl.dsp.group.next())

-- ======= Toggle Gaps =======

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "G", hl.dsp.exec_cmd("hyprctl --batch \"keyword general:gaps_out 5;keyword general:gaps_in 3\""))

hl.bind(mainMod .. " + " .. "G", hl.dsp.exec_cmd("hyprctl --batch \"keyword general:gaps_out 0;keyword general:gaps_in 0\""))

-- ======= Volume Control =======

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +5% && pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\\d+(?=%)' | awk '{if($1>100) system(\"pactl set-sink-volume @DEFAULT_SINK@ 100%\")}' && pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\\d+(?=%)' | awk '{print $1}' | head -1 >/tmp/" .. os.getenv("HYPRLAND_INSTANCE_SIGNATURE") .. ".wob"), { repeating = true, locked = true })

-- Raise Volume

hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -5% && pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\\d+(?=%)' | awk '{print $1}' | head -1 >/tmp/" .. os.getenv("HYPRLAND_INSTANCE_SIGNATURE") .. ".wob"), { repeating = true, locked = true })

-- Lower Volume

hl.bind("XF86AudioMute", hl.dsp.exec_cmd("amixer sset Master toggle | sed -En '/\\[on\\]/ s/.*\\[([0-9]+)%\\].*/\\1/ p; /\\[off\\]/ s/.*/0/p' | head -1 >/tmp/" .. os.getenv("HYPRLAND_INSTANCE_SIGNATURE") .. ".wob"), { repeating = true, locked = true })

--Mutes player audio

-- ======= Playback Control =======

hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))

hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))

-- ======= Screen Brightness =======

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s +5%"), { repeating = true, locked = true })

--Increases brightness 5%

hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 5%-"), { repeating = true, locked = true })

--Decreases brightness 5%

hl.bind(mainMod .. " + " .. "L", hl.dsp.exec_cmd("hyprlock"))

hl.bind(mainMod .. " + " .. "O", hl.dsp.exec_cmd("killall -SIGUSR2 waybar"))

-- ======= Window Actions =======

--# Move window with mainMod + LMB/RMB and dragging

--# Move window towards a direction

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "left", hl.dsp.window.move({ direction = "left" }))

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "right", hl.dsp.window.move({ direction = "right" }))

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "up", hl.dsp.window.move({ direction = "up" }))

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "down", hl.dsp.window.move({ direction = "down" }))

--# Move focus with mainMod + arrow keys

hl.bind(mainMod .. " + " .. "left", hl.dsp.focus({ direction = "left" }))

hl.bind(mainMod .. " + " .. "right", hl.dsp.focus({ direction = "right" }))

hl.bind(mainMod .. " + " .. "up", hl.dsp.focus({ direction = "up" }))

hl.bind(mainMod .. " + " .. "down", hl.dsp.focus({ direction = "down" }))

--# Resizing windows

-- Activate keyboard window resize mode

-- https://wiki.hyprland.org/Configuring/Binds/#submaps

hl.bind(mainMod .. " + " .. "R", hl.dsp.submap("resize"))

hl.define_submap("resize", function()
    hl.bind("right", hl.dsp.window.resize({ x = 15, y = 0, relative = true }))
    hl.bind("left", hl.dsp.window.resize({ x = -15, y = 0, relative = true }))
    hl.bind("up", hl.dsp.window.resize({ x = 0, y = -15, relative = true }))
    hl.bind("down", hl.dsp.window.resize({ x = 0, y = 15, relative = true }))
    hl.bind("l", hl.dsp.window.resize({ x = 15, y = 0, relative = true }))
    hl.bind("h", hl.dsp.window.resize({ x = -15, y = 0, relative = true }))
    hl.bind("k", hl.dsp.window.resize({ x = 0, y = -15, relative = true }))
    hl.bind("j", hl.dsp.window.resize({ x = 0, y = 15, relative = true }))
    hl.bind("escape", hl.dsp.submap("reset"))
end)


-- Quick resize window with keyboard

-- !!! added $mainMod here because CTRL + SHIFT is used for word selection in various text editors

hl.bind(mainMod .. " + " .. "CTRL + SHIFT" .. " + " .. "right", hl.dsp.window.resize({ x = 15, y = 0, relative = true }))

hl.bind(mainMod .. " + " .. "CTRL + SHIFT" .. " + " .. "left", hl.dsp.window.resize({ x = -15, y = 0, relative = true }))

hl.bind(mainMod .. " + " .. "CTRL + SHIFT" .. " + " .. "up", hl.dsp.window.resize({ x = 0, y = -15, relative = true }))

hl.bind(mainMod .. " + " .. "CTRL + SHIFT" .. " + " .. "down", hl.dsp.window.resize({ x = 0, y = 15, relative = true }))

hl.bind(mainMod .. " + " .. "CTRL + SHIFT" .. " + " .. "l", hl.dsp.window.resize({ x = 15, y = 0, relative = true }))

hl.bind(mainMod .. " + " .. "CTRL + SHIFT" .. " + " .. "h", hl.dsp.window.resize({ x = -15, y = 0, relative = true }))

hl.bind(mainMod .. " + " .. "CTRL + SHIFT" .. " + " .. "k", hl.dsp.window.resize({ x = 0, y = -15, relative = true }))

hl.bind(mainMod .. " + " .. "CTRL + SHIFT" .. " + " .. "j", hl.dsp.window.resize({ x = 0, y = 15, relative = true }))

-- Resize window with mainMod + LMB/RMB and dragging

hl.bind(mainMod .. " + " .. "mouse:273", hl.dsp.window.resize(), { mouse = true })

--Resize the window towards a direction

hl.bind(mainMod .. " + " .. "mouse:272", hl.dsp.window.drag(), { mouse = true })

--Drag window

--# Resizing Windows End #

--# Move active window to a workspace with $mainMod + CTRL + [0-9]

hl.bind(mainMod .. " + " .. "CTRL" .. " + " .. 1, hl.dsp.window.move({ workspace = 1 }))

hl.bind(mainMod .. " + " .. "CTRL" .. " + " .. 2, hl.dsp.window.move({ workspace = 2 }))

hl.bind(mainMod .. " + " .. "CTRL" .. " + " .. 3, hl.dsp.window.move({ workspace = 3 }))

hl.bind(mainMod .. " + " .. "CTRL" .. " + " .. 4, hl.dsp.window.move({ workspace = 4 }))

hl.bind(mainMod .. " + " .. "CTRL" .. " + " .. 5, hl.dsp.window.move({ workspace = 5 }))

hl.bind(mainMod .. " + " .. "CTRL" .. " + " .. 6, hl.dsp.window.move({ workspace = 6 }))

hl.bind(mainMod .. " + " .. "CTRL" .. " + " .. 7, hl.dsp.window.move({ workspace = 7 }))

hl.bind(mainMod .. " + " .. "CTRL" .. " + " .. 8, hl.dsp.window.move({ workspace = 8 }))

hl.bind(mainMod .. " + " .. "CTRL" .. " + " .. 9, hl.dsp.window.move({ workspace = 9 }))

hl.bind(mainMod .. " + " .. "CTRL" .. " + " .. 0, hl.dsp.window.move({ workspace = 10 }))

hl.bind(mainMod .. " + " .. "CTRL" .. " + " .. "left", hl.dsp.window.move({ workspace = "-1" }))

hl.bind(mainMod .. " + " .. "CTRL" .. " + " .. "right", hl.dsp.window.move({ workspace = "+1" }))

--# Same as above, but doesn't switch to the workspace

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 1, hl.dsp.window.move({ workspace = 1 , follow = false}))

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 2, hl.dsp.window.move({ workspace = 2 , follow = false}))

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 3, hl.dsp.window.move({ workspace = 3 , follow = false}))

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 4, hl.dsp.window.move({ workspace = 4 , follow = false}))

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 5, hl.dsp.window.move({ workspace = 5 , follow = false}))

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 6, hl.dsp.window.move({ workspace = 6 , follow = false}))

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 7, hl.dsp.window.move({ workspace = 7 , follow = false}))

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 8, hl.dsp.window.move({ workspace = 8 , follow = false}))

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 9, hl.dsp.window.move({ workspace = 9 , follow = false}))

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 0, hl.dsp.window.move({ workspace = 10 , follow = false}))

-- Window actions End #

-- ======= Workspace Actions =======

-- Switch workspaces with mainMod + [0-9]

hl.bind(mainMod .. " + " .. 1, hl.dsp.focus({ workspace = 1 }))

hl.bind(mainMod .. " + " .. 2, hl.dsp.focus({ workspace = 2 }))

hl.bind(mainMod .. " + " .. 3, hl.dsp.focus({ workspace = 3 }))

hl.bind(mainMod .. " + " .. 4, hl.dsp.focus({ workspace = 4 }))

hl.bind(mainMod .. " + " .. 5, hl.dsp.focus({ workspace = 5 }))

hl.bind(mainMod .. " + " .. 6, hl.dsp.focus({ workspace = 6 }))

hl.bind(mainMod .. " + " .. 7, hl.dsp.focus({ workspace = 7 }))

hl.bind(mainMod .. " + " .. 8, hl.dsp.focus({ workspace = 8 }))

hl.bind(mainMod .. " + " .. 9, hl.dsp.focus({ workspace = 9 }))

hl.bind(mainMod .. " + " .. 0, hl.dsp.focus({ workspace = 10 }))

-- Scroll through existing workspaces with mainMod + , or .

hl.bind(mainMod .. " + " .. "PERIOD", hl.dsp.focus({ workspace = "e+1" }))

hl.bind(mainMod .. " + " .. "COMMA", hl.dsp.focus({ workspace = "e-1" }))

-- With $mainMod + scroll

hl.bind(mainMod .. " + " .. "mouse_down", hl.dsp.focus({ workspace = "e+1" }))

hl.bind(mainMod .. " + " .. "mouse_up", hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mainMod .. " + " .. "slash", hl.dsp.focus({ workspace = "previous" }))

-- Special workspaces (scratchpads)

hl.bind(mainMod .. " + " .. "minus", hl.dsp.window.move({ workspace = "special" }))

hl.bind(mainMod .. " + " .. "equal", hl.dsp.workspace.toggle_special("special"))

hl.bind(mainMod .. " + " .. "F1", hl.dsp.workspace.toggle_special("scratchpad"))

hl.bind(mainMod .. " + " .. "ALT + SHIFT" .. " + " .. "F1", hl.dsp.window.move({ workspace = "special:scratchpad" , follow = false}))

-- ======= Additional Settings =======

-- https://wiki.hyprland.org/Configuring/Binds

hl.config({
    binds = {
        allow_workspace_cycles = 1,
        workspace_back_and_forth = 1,
        workspace_center_on = 1,
        movefocus_cycles_fullscreen = true,
        window_direction_monitor_fallback = true,
    },
})
