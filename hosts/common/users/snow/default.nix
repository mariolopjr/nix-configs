{ pkgs, config, lib, outputs, ... }:
let ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in
{
#   users.mutableUsers = false;
  users.users.snow = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [
      "wheel"
      "video"
      "audio"
    ] ++ ifTheyExist [
      "network"
      "i2c"
      "podman"
      "git"
      "libvirtd"
    ];

    # openssh.authorizedKeys.keys = [
    #   ""
    # ];
    # passwordFile = config.sops.secrets.snow-password.path;
    packages = [ pkgs.home-manager ];
  };

#   sops.secrets.snow-password = {
#     sopsFile = ../../secrets.yaml;
#     neededForUsers = true;
#   };

#   home-manager.users.snow = import home/${config.networking.hostName}.nix;

  services.geoclue2.enable = true;
}
