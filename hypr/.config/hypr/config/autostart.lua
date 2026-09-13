---@module 'hl'

-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓

-- ┃                    Autostart Configuration                  ┃

-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
local defaults = require("config.defaults")

-- Autostart wiki https://wiki.hyprland.org/Configuring/Keywords/#executing

-- Autostart
hl.on("hyprland.start", function()
    hl.exec_cmd("swaybg -o \\* -i/usr/share/wallpapers/cachyos-wallpapers/Skyscraper.png -m fill")
    hl.exec_cmd("fcitx5 -d &")
    hl.exec_cmd("mako &")
    hl.exec_cmd("nm-applet --indicator &")
    hl.exec_cmd("bash -c \"mkfifo /tmp/" .. os.getenv("HYPRLAND_INSTANCE_SIGNATURE") .. ".wob && tail -f /tmp/" .. os.getenv("HYPRLAND_INSTANCE_SIGNATURE") .. ".wob | wob & disown\" &")
    hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1 &")
    hl.exec_cmd("systemctl --user import-environment &")
    hl.exec_cmd("hash dbus-update-activation-environment 2>/dev/null &")
    hl.exec_cmd("dbus-update-activation-environment --systemd &")
    hl.exec_cmd("$idlehandler")
end)
