{ inputs, pkgs, ... }: {
  imports = [
    ./global
    ./features/desktop/awesomewm
    ./features/desktop/common/rofi.nix
  ];

  colorscheme = inputs.nix-colors.colorSchemes.catppuccin;
}
