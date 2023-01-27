local gfs = require("gears.filesystem")

local themes_path = gfs.get_themes_dir()

local _M = {
  -- This is used later as the default terminal and editor to run
  terminal = "kitty",

  -- Editors
  editor = os.getenv("EDITOR") or "v",
  editor_gui = "code",

  -- Default file manager
  file_manager = "nemo",

  -- Default modkey.
  -- Usually, Mod4 is the key with a logo between Control and Alt.
  modkey = "Mod4",

  -- Default wallpaper
  wallpaper = "~/.local/wallpapers/dark-cat.png",

  -- Default username
  username = os.getenv("USER"):gsub("^%l", string.upper),

  -- Default font
  font = "Roboto, Regular ",

  -- Max brightness
  -- Output of 'brightnessctl max'
  max_brightness = 26666,
}

return _M
