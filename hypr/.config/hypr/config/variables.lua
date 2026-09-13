---@module 'hl'

-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓

-- ┃                    Variables Configuration                  ┃

-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

local mocha = require("themes.catppuccin.mocha")

-- https://wiki.hyprland.org/Configuring/Variables/#general

hl.config({
    general = {
        gaps_in = 3,
        gaps_out = 5,
        border_size = 3,
        layout = "dwindle",
        -- master|dwindle
        -- https://wiki.hyprland.org/Configuring/Variables/#snap
        snap = {
            enabled = true,
        },
        col = {
            active_border = { colors = { "rgba(" .. mocha.maroonAlpha .. "ee)", "rgba(" .. mocha.mauveAlpha .. "ee)" }, angle = 45 },
            inactive_border = "rgba(" .. mocha.lavenderAlpha .. "ee)",
        },
    },
})

-- removed old gestures {} block — Hyprland 0.39+ uses gesture = … lines

-- https://wiki.hyprland.org/Configuring/Variables/#group

hl.config({
    group = {
        groupbar = {
            font_family = "Fira Sans",
            text_color = "rgba(" .. mocha.greenAlpha .. "ee)",
            ["col.active"] = "rgba(" .. mocha.greenAlpha .. "ee)",
            ["col.inactive"] = "rgba(" .. mocha.yellowAlpha .. "ee)",
            ["col.locked_active"] = "rgba(" .. mocha.peachAlpha .. "ee)",
            ["col.locked_inactive"] = "rgba(" .. mocha.skyAlpha .. "ee)",
        },
        col = {
            border_active = "rgba(" .. mocha.mauveAlpha .. "ee)",
            border_inactive = "rgba(" .. mocha.baseAlpha .. "aa)",
            border_locked_active = "rgba(" .. mocha.maroonAlpha .. "ee)",
            border_locked_inactive = "rgba(" .. mocha.mauveAlpha .. "ee)",
        },
    },
})

-- https://wiki.hyprland.org/Configuring/Variables/#misc

hl.config({
    misc = {
        font_family = "Fira Sans",
        splash_font_family = "Fira Sans",
        disable_hyprland_logo = true,
        background_color = "rgba(" .. mocha.maroonAlpha .. "ee)",
        enable_swallow = true,
        swallow_regex = "^(nautilus|nemo|thunar|btrfs-assistant.)$",
        focus_on_activate = true,
        vrr = 2,
        col = {
            splash = "rgba(" .. mocha.mauveAlpha .. "ee)",
        },
    },
})

-- https://wiki.hyprland.org/Configuring/Variables/#render

hl.config({
    render = {
        direct_scanout = true,
    },
})

-- See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more

hl.config({
    dwindle = {
        special_scale_factor = 0.8,
        preserve_split = true,
    },
})

-- See https://wiki.hyprland.org/Configuring/Master-Layout/ for more

hl.config({
    master = {
        new_status = "master",
        special_scale_factor = 0.8,
    },
})

-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓

-- ┃                    Gestures                                 ┃

-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

-- 4-finger horizontal swipe to switch workspaces

hl.gesture({
    ["fingers"] = 4,
    ["direction"] = "horizontal",
    ["action"] = "workspace",
})

-- 3-finger swipe down closes active window

hl.gesture({
    ["fingers"] = 3,
    ["direction"] = "down",
    ["action"] = "close",
})

-- 3-finger swipe up toggles fullscreen

hl.gesture({
    ["fingers"] = 3,
    ["direction"] = "up",
    ["action"] = "fullscreen",
})

-- 3-finger swipe left toggles float/tile

hl.gesture({
    ["fingers"] = 3,
    ["direction"] = "left",
    ["action"] = "float",
})
