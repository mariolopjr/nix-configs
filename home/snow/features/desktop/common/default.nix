{ pkgs, lib, outputs, ... }:
{
  imports = [
    ./discord.nix
    ./firefox.nix
    ./fonts.nix
    ./gtk.nix
    ./qt.nix
    ./vscode.nix
  ];
}
