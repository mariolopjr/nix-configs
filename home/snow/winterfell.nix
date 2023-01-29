{ inputs, pkgs, ... }: {
  imports = [
    ./global
    ./features/desktop/kde
    ./features/games/default.nix
  ];

  home.file."./.local/wallpapers/".source = ./wallpapers;
  colorscheme = inputs.nix-colors.colorSchemes.catppuccin;
}
