{ lib, config, ... }:
with lib;
let
  wipeScript = ''
    mkdir -p /btrfs
    mount -o subvol=/ /dev/disk/by-label/main /btrfs
    if [ -e "/btrfs/root/dontwipe" ]; then
      echo "Not wiping root"
    else
      echo "Cleaning subvolume"
      btrfs subvolume list -o /btrfs/root | cut -f9 -d ' ' |
      while read subvolume; do
        btrfs subvolume delete "/btrfs/$subvolume"
      done && btrfs subvolume delete /btrfs/root
      echo "Restoring blank subvolume"
      btrfs subvolume snapshot /btrfs/root-blank /btrfs/root
    fi
    umount /btrfs
    rm /btrfs
  '';
in
{
  options.rootDisk = mkOption {
    type = types.str;
    default = "/dev/nvme0n1";
  };

  config = {
    # TODO: enable wipe command with create-root systemd service

    # persisted filesystems
    fileSystems."/persist".neededForBoot = true;

    disko.devices.disk.nvme = {
      type = "disk";
      device = config.rootDisk;
      content = {
        type = "table";
        format  = "gpt";
        partitions = {
          esp = {
            priority = 1;
            type =  "partition";
            name = "ESP";
            start = "1MiB";
            end = "512MiB";
            bootable = true;
            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot";
            };
          };
          luks = {
            name = "luks";
            size = "100%";
            content = {
              type = "luks";
              name = "cryptroot";
              content = {
                type = "btrfs";
                subvolumes = {
                  "@root" = {
                    mountpoint = "/";
                    mountOptions = [ "compress=zstd" "ssd" "noatime" "discard=async" ];
                  };
                  "@nix" = {
                    mountpoint = "/nix";
                    mountOptions = [ "compress=zstd" "ssd" "noatime" "discard=async" ];
                  };
                  "@persist" = {
                    mountpoint = "/persist";
                    mountOptions = [ "compress=zstd" "ssd" "noatime" "discard=async" ];
                  };
                };
              };
            };
          };
        };
      };
    };
  };
}
