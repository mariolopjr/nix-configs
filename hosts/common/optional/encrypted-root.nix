{ config, ... }: {
  boot.initrd ={
    luks.devices.cryptroot.device = "/dev/disk/by-partlabel/disk-nvme-luks";
  };
}
