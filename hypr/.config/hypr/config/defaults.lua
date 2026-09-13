---@module 'hl'

-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓

-- ┃                     Defaults Configuration                  ┃

-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

-- General
local mainMod = "SUPER"
local filemanager = "thunar"

local applauncher = "wofi"

local terminal = "alacritty"

local idlehandler = "swayidle -w timeout 300 'swaylock -f -c 000000' before-sleep 'swaylock -f -c 000000'"

-- Screenshots

local shotregion = "grimblast copy area"

local shotwindow = "grimblast copy active"

local shotscreen = "grimblast copy output"

return {
    mainMod = mainMod,
    filemanager = filemanager,
    applauncher = applauncher,
    terminal = terminal,
    idlehandler = idlehandler,
    shotregion = shotregion,
    shotwindow = shotwindow,
    shotscreen = shotscreen,
}
