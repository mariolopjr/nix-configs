{ config, pkgs, lib, ... }:
{
  home = {
    packages = with pkgs; [ neovim ];
    sessionVariables.EDITOR = "nvim";
    file."./.config/nvim/" = {
      source = ./config;
      recursive = true;
    };
  };
}
