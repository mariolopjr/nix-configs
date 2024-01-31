# system configuration for desktop
{ config, pkgs, inputs, ... }: {
  imports = [
    inputs.hardware.nixosModules.common-cpu-intel
    inputs.hardware.nixosModules.common-gpu-nvidia-nonprime
    inputs.hardware.nixosModules.common-pc-ssd

    ./hardware-configuration.nix

    ../common/global
    ../common/users/snow

    ../common/optional/kde.nix
    ../common/optional/quietboot.nix
  ];

  networking = {
    hostName = "winterfell";
    interfaces.enp7s0 = {
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

  system.stateVersion = "23.11";
}
