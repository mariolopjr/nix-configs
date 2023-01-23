{ pkgs, ... }: {
  fontProfiles = {
    enable = true;
    monospace = {
      family = "Meslo Nerd Font";
      package = pkgs.nerdfonts.override { fonts = [ "Meslo Nerd Font" ]; };
    };
    regular = {
      family = "Fira Sans";
      package = pkgs.fira;
    };
  };
}
