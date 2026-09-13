---@module 'hl'

-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓

-- ┃                    Windowrules Configuration                ┃

-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

-- Windows Rules https://wiki.hyprland.org/Configuring/Window-Rules/ #

-- Float necessary windows

hl.window_rule({
    name  = "float-pavucontrol",
    match = {
        class = "^org.pulseaudio.pavucontrol$",
    },
    float = true,
})

hl.window_rule({
    name  = "fs25",
    match = {
        class = "^steam_app_0$",
        title = "^Farming Simulator 25$",
    },
    float = false,
    fullscreen = true,
    immediate = true,
    no_shadow = true,
    no_blur = true,
    no_anim = true,
    workspace = 1,
})

hl.window_rule({
    name  = "wow",
    match = {
        class = "^steam_app_0$",
        title = "^World of Warcraft$",
    },
    float = false,
    fullscreen = true,
    immediate = true,
    no_shadow = true,
    no_blur = true,
    no_anim = true,
    workspace = 1,
})

hl.window_rule({
    name  = "float-picture-in-picture-title",
    match = {
        title = "^Picture in picture$",
    },
    float = true,
})

hl.window_rule({
    name  = "float-save-open",
    match = {
        title = "^(Save File|Open File)$",
    },
    float = true,
})

hl.window_rule({
    name  = "float-librewolf-pip",
    match = {
        class = "^LibreWolf$",
        title = "^Picture-in-Picture$",
    },
    float = true,
})

hl.window_rule({
    name  = "float-blueman-manager",
    match = {
        class = "^blueman-manager$",
    },
    float = true,
})

hl.window_rule({
    name  = "float-xdg-desktop-portals",
    match = {
        class = "^xdg-desktop-portal-(gtk|kde|hyprland).*",
    },
    float = true,
})

hl.window_rule({
    name  = "float-polkit-agents",
    match = {
        class = "^(polkit-gnome-authentication-agent-1|hyprpolkitagent|org.kde.polkit-kde-authentication-agent-1).*",
    },
    float = true,
})

hl.window_rule({
    name  = "float-cachyoshello",
    match = {
        class = "^CachyOSHello$",
    },
    float = true,
})

hl.window_rule({
    name  = "float-zenity",
    match = {
        class = "^zenity$",
    },
    float = true,
})

hl.window_rule({
    name  = "float-steam-self-updater",
    match = {
        title = "^Steam - Self Updater$",
    },
    float = true,
})

-- Opacity rules

hl.window_rule({
    name  = "opacity-files-terminals",
    match = {
        class = "^(thunar|nemo)$",
    },
    opacity = 0.92,
})

hl.window_rule({
    name  = "opacity-discord-clients",
    match = {
        class = "^(discord|armcord|webcord)$",
    },
    opacity = 0.96,
})

hl.window_rule({
    name  = "opacity-messaging",
    match = {
        title = "^(QQ|Telegram)$",
    },
    opacity = 0.95,
})

hl.window_rule({
    name  = "opacity-netmusic",
    match = {
        title = "^NetEase Cloud Music Gtk4$",
    },
    opacity = 0.95,
})

-- Floats with sizing and move

hl.window_rule({
    name  = "pip-size-and-move",
    match = {
        title = "^Picture-in-Picture$",
    },
    float = true,
    size = { 960, 540 },
    move = { "(monitor_w*0.5 - window_w*0.5)", "(monitor_h*0.5 - window_h*0.5)" },
})

hl.window_rule({
    name  = "media-floats",
    match = {
        title = "^(imv|mpv|danmufloat|termfloat|nemo|ncmpcpp)$",
    },
    float = true,
    size = { 960, 540 },
    move = { "(monitor_w*0.5 - window_w*0.5)", "(monitor_h*0.5 - window_h*0.5)" },
})

hl.window_rule({
    name  = "pin-danmufloat",
    match = {
        title = "^danmufloat$",
    },
    pin = true,
})

hl.window_rule({
    name  = "rounding-for-floats",
    match = {
        title = "^(danmufloat|termfloat)$",
    },
    rounding = 5,
})

-- Animations & special effects

hl.window_rule({
    name  = "animate-terms",
    match = {
        class = "^(kitty|Alacritty)$",
    },
    animation = "slide right",
})

hl.window_rule({
    name  = "no-blur-firefox",
    match = {
        class = "^org.mozilla.firefox$",
    },
    no_blur = true,
})

-- Decoration defaults for floating windows on certain workspaces

hl.window_rule({
    name  = "border-float-workspaces",
    match = {
        workspace = "w[fv1-10]",
        float = 1,
    },
    border_size = 2,
    border_color = cachylblue,
    rounding = 8,
})

-- Decoration defaults for tiled windows

hl.window_rule({
    name  = "border-tiled-workspaces",
    match = {
        workspace = "f[1-10]",
        float = 0,
    },
    border_size = 3,
    rounding = 4,
})
