{ pkgs, ... }:
{
  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    gnome-tour
  ]) ++ (with pkgs.gnome; [
    cheese
    geary
    gnome-characters
    yelp
    gnome-contacts
    gnome-initial-setup
  ]);
  services = {
    xserver = {
      enable = true;
      desktopManager.gnome = {
        enable = true;
      };
      displayManager.gdm = {
        enable = true;
        autoSuspend = false;
        # disable wayland for now
        # wayland = true;
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
