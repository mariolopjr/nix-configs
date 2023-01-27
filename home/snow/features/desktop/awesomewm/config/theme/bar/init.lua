local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")

local helpers = require("helpers")
local color = require("theme.config.colors")
local utils = require("theme.bar.utils")

local dpi = xresources.apply_dpi

local widgets = {
  get_taglist    = require("theme.bar.modules.tags"),
  get_tasklist   = require("theme.bar.modules.tasks"),
  get_layoutbox  = require("theme.bar.modules.layoutbox"),

  clock          = require("theme.bar.modules.clock"),
  volume         = require("theme.bar.modules.volume"),
  battery        = require("theme.bar.modules.battery"),
  brightness     = require("theme.bar.modules.brightness"),

  power          = require("theme.bar.modules.power"),
  dashboard      = require("theme.bar.modules.dashboard"),
}

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- Wibar

awful.screen.connect_for_each_screen(function(s)
  -- Tags
  awful.tag({'', '', '', '', ''}, s, awful.layout.layouts[1] )

  -- Create the wibox
  s.wibox = awful.wibar({
    position = "top",
    type     = "toolbar",
    screen   = s,
    width    = s.geometry.width - beautiful.useless_gap * 4,
    height   = dpi(40),
    bg       = color["base"],
    shape    = helpers.mkroundedrect(beautiful.useless_gap)
  })

  -- Gap at the top
  s.wibox.y = beautiful.useless_gap

  -- Add widgets to the wibox
  s.wibox:setup {
    layout = wibox.layout.align.horizontal,

    { -- Left widgets
      layout = wibox.layout.fixed.horizontal,

      utils.spacer,
      utils.spacerXL,
      utils.widget_margin(widgets.dashboard),
      utils.spacerL,

      utils.spacerXL,
      widgets.get_taglist(s),
    },

    nil, -- Nothing in the middle

    -- {-- Middle widget
    --   layout = wibox.container.place,
    --   align = "center",

    --   widgets.clock,
    -- },


    { -- Right widgets
      layout = wibox.layout.fixed.horizontal,

      utils.widget_margin(widgets.brightness.icon, 0, 0),
      utils.widget_margin(widgets.brightness.perc, 0, 0),
      utils.spacerXL,

      utils.spacerL,
      utils.widget_margin(widgets.volume.icon, 0, 0),
      utils.widget_margin(widgets.volume.perc, 0, 0),
      utils.spacerXL,

      utils.widget_margin(widgets.battery.icon, 1, 0),
      utils.widget_margin(widgets.battery.perc, 0, 2),
      utils.spacerXL,

      utils.spacerXL,
      utils.systray_wrap(wibox.widget.systray()),
      utils.spacerXL,

      widgets.clock,
      utils.spacerXL,

      utils.spacer,
      utils.widget_margin(widgets.get_layoutbox(s)),
      utils.spacerXL,

      utils.spacer,
      utils.widget_margin(widgets.power),
      utils.spacerXL,
      utils.spacer,
    },
  }
end)

