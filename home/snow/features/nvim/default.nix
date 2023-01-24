{ config, pkgs, lib, ... }:
{
  home = {
    packages = with pkgs; [ neovim ];
    sessionVariables.EDITOR = "nvim";
    file."./.config/nvim/" = {
      source = ./config;
      recursive = true;
      onChange = ''
        XDG_RUNTIME_DIR=''${XDG_RUNTIME_DIR:-/run/user/$(id -u)}
        for server in $XDG_RUNTIME_DIR/nvim.*; do
        nvim --server $server --remote-send ':source $MYVIMRC<CR>' &
        done
      '';
    };
  };
}
