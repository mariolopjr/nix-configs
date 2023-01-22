{
  environment.gnome.excludePackages = (with pkgs; [
    gnome-music
    gnome-photos
    gnome-tour
  ]) ++ (with pkgs.gnome; [
    cheese # webcam tool
    # gedit # text editor
    # epiphany # web browser
    geary # email reader
    gnome-characters
    yelp # help view
    gnome-contacts
    gnome-initial-setup
  ]);
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
  # fix broken stuff
  services.avahi.enable = false;
  networking.networkmanager.enable = false;
}
