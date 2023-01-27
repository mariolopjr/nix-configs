--[[
 _____ __ _ __ _____ _____ _____ _______ _____
|     |  | |  |  ___|  ___|     |       |  ___|
|  -  |  | |  |  ___|___  |  |  |  | |  |  ___|
|__|__|_______|_____|_____|_____|__|_|__|_____|
=============== @author cufta22 ===============
============= @author mariolopjr ==============
======= https://github.com/mariolopjr =========
--]]

-- awesome_mode: api-level=4:screen=on

-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

local awful = require("awful")
local menubar = require("menubar")

RC = {} -- global namespace, on top before require any modules
RC.vars = require("config.variables")
modkey = RC.vars.modkey

grequire("theme.config")

-- Layouts
require("config.layouts")

-- Menubar configuration
menubar.utils.terminal = RC.vars.terminal

-- Mouse and Key bindings
require("config.bindings-mouse")
require("config.bindings-keys")

-- Rules
require("config.rules")

-- UI
require("theme.bar")
require("theme.wallpaper")
require("theme.notifications")
-- require("theme.titlebar")
require("theme.powermenu")

-- Create a laucher widget and a main menu
local menu = require("theme.menu")
RC.mainmenu = awful.menu({ items = menu() }) -- Used in globalkeys

-- Signals
require("config.signals")
require("signal.network")

-- Autostart applications
require("config.autostart")
