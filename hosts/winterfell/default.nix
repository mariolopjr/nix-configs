# system configuration for desktop
{ pkgs, inputs, ... }: {
  imports = [
    # inputs.hardware.nixosModules.common-cpu-amd
    # inputs.hardware.nixosModules.common-gpu-nvidia
    # inputs.hardware.nixosModules.common-pc-ssd

    ./hardware-configuration.nix

    ../common/global
    ../common/users/snow
  ];

  # environment.persistence.enable = true;

  networking = {
    hostName = "winterfell";
    interfaces.enp0s1 = {
      wakeOnLan.enable = true;
    };
  };

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
  };

  programs = {
    dconf.enable = true;
  };

  services = {
    dbus.packages = [ pkgs.gcr ];
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };

  hardware = {
    nvidia = {
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      modesetting.enable = true;
    };
    opengl.enable = true;
    openrgb.enable = true;
  };

  virtualisation.libvirtd = {
    enable = true;
  };
  environment.systemPackages = with pkgs; [ virt-manager ];

  # necessary for libvirtd
  security.polkit.enable = true;

  system.stateVersion = "22.11";
}
