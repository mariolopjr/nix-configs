local awful = require("awful")

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

local function run_once(cmd)
  local findme = cmd
  local firstspace = cmd:find(' ')
  if firstspace then findme = cmd:sub(0, firstspace - 1) end
  awful.spawn.with_shell(string.format(
                             'pgrep -u $USER -x %s > /dev/null || (%s)',
                             findme, cmd), false)
end

-- run_once("picom")                 -- Compositor
-- run_once("lxsession")             -- PolKit
-- run_once("nm-applet")             -- NetworkManager
-- run_once("flameshot")             -- Screenshot tool
-- run_once("pasystray")             -- PulseAudio
-- run_once("xfce4-power-manager")   -- Power Management
