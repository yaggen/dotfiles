---@module 'hl'

hl.layer_rule({
    match = {
        namespace = "waybar",
    },
    blur = true,
})

-- Autostart
hl.on("hyprland.start", function()
    hl.exec_cmd("nextcloud")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("swaync")
    hl.exec_cmd("waybar")
    hl.exec_cmd("wl-paste --type text")
    hl.exec_cmd("wl-paste --type image")
end)
