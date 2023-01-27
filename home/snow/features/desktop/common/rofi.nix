{ config, pkgs, ... }:
{
  programs.rofi = {
    enable = true;
    font = config.fontProfiles.monospace.family;
    theme = "catppuccin";
    plugins = [
      pkgs.rofi-emoji
      pkgs.rofi-calc
      pkgs.rofi-power-menu
    ];

    extraConfig = {
      modi = "drun,filebrowser,window";
      show-icons = true;
      sort = true;
      matching = "fuzzy";
    };
  };
}
