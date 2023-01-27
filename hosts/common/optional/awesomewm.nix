{ config, pkgs, ... }:
{
  services.xserver = {
    enable = true;

    displayManager = {
      sddm.enable = true;
      defaultSession = "none+awesome";
    };

    windowManager.awesome = {
      enable = true;
      luaModules = with pkgs.luaPackages; [
        ldbus
        lgi
        luaposix
        luarocks
        luadbi-mysql
      ];
    };
  };
  # fix broken stuff
  services.avahi.enable = false;
  networking.networkmanager.enable = false;
}
