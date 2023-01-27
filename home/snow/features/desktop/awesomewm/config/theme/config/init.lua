local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- Themes define colours, icons, font and wallpapers
beautiful.init(gears.filesystem.get_configuration_dir() .. "theme/config/theme.lua")
