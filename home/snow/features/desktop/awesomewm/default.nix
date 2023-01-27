{ pkgs, ... }:
{
  imports = [ ../common ];
  home.file = {
    "./.config/awesome/" = {
      source = ./config;
      recursive = true;
    };
    "./.local/wallpapers/" = {
      source = ../../../wallpapers;
      recursive = true;
    };
  };
}
