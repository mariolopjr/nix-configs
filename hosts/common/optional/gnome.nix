{
  services = {
    xserver = {
      desktopManager.gnome = {
        enable = true;
      };
      displayManager.gdm = {
        enable = true;
        autoSuspend = false;
        wayland = true;
        # nvidiaWayland = true;
      };
    };
    geoclue2.enable = true;
    gnome.games.enable = false;
  };
  # Fix broken stuff
  services.avahi.enable = false;
  networking.networkmanager.enable = false;
}
