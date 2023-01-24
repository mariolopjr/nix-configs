{ inputs, pkgs, ... }: {
  imports = [
    ./global
    ./features/desktop/gnome
  ];

#   wallpaper = (import ./wallpapers).aenami-bright-planet;
  colorscheme = inputs.nix-colors.colorSchemes.nord;
}
