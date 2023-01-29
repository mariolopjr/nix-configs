{ pkgs, ... }:
{
  services = {
    xserver = {
      enable = true;
      desktopManager.plasma5 = {
        enable = true;
        excludePackages = with pkgs.libsForQt5; [
          elisa
          oxygen
          khelpcenter
          konsole
        ];
      };
      displayManager = {
        sddm.enable = true;
        defaultSession = "plasmawayland";
      };
    };
    geoclue2.enable = true;
  };
  # fix broken stuff
  services.avahi.enable = false;
  networking.networkmanager.enable = false;
}

