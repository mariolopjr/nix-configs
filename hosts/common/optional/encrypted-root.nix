{ config, ... }:
let hostname = config.networking.hostName;
in {
  boot.initrd ={
    luks.devices."${hostname}_crypt".device = "/dev/disk/by-partlabel/${hostname}";
  };
}
