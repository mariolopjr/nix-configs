{ inputs, pkgs, ... }: {
  imports = [
    ./global
  ];

#   wallpaper = (import ./wallpapers).aenami-bright-planet;
  colorscheme = inputs.nix-colors.colorSchemes.nord;
}
