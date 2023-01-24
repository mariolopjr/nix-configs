{ pkgs, ... }: {
  fontProfiles = {
    enable = true;
    monospace = {
      family = "Meslo Nerd Font";
      package = pkgs.nerdfonts.override { fonts = [ "Meslo" ]; };
    };
    regular = {
      family = "Fira Sans";
      package = pkgs.fira;
    };
  };
}
