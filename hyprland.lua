-- This is an example Hyprland Lua config file.
-- Refer to the wiki for more information.
-- https://wiki.hypr.land/Configuring/Start/

-- Please note not all available settings / options are set here.
-- For a full list, see the wiki

-- You can (and should!!) split this configuration into multiple files
-- Create your files separately and then require them like this:
-- require("myColors")


-- Import riced modules
local options = require("core.options")
local decoration = require("ui.decoration")
local animations = require("ui.animations")
local monitor = require("ui.monitor")
local binds = require("core.binds")
local rules = require("events.rules")
local power = require("core.power")
--local autostart =code  require("events.autostart")

-- Run setups
power.setup()
rules.setup()
binds.setup()
options.setup()
decoration.setup()
animations.setup()
monitor.setup()

hl.on("hyprland.start", function()
    hl.exec_cmd("waybar -c $HOME/.config/hypr/waybar/config -s $HOME/.config/hypr/waybar/style.css &")
    hl.exec_cmd("hyprpaper&")
    hl.exec_cmd("swaync &")
    hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &")
end)
