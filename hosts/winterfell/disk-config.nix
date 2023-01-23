{ disks ? [ "/dev/nvme0n1" ], ... }:
let
  hostname = config.networking.hostName;
in
{
  disk = {
    nvme0n1 = {
      type = "disk";
      device = builtins.elemAt disks 0;
      content = {
        type = "table";
        format = "gpt";
        partitions = [
          {
            name = "ESP";
            type = "partition";
            start = "1MiB";
            end = "512MiB";
            fs-type = "fat32";
            bootable = true;
            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot";
            };
          }
          {
            name = "root";
            type = "partition";
            start = "512MiB";
            end = "100%";
            content = {
              type = "luks";
              name = "${hostname}_crypt";
              content = {
                name = ${hostname};
                type = "partition";
                start = "512MiB";
                end = "100%";
                content = {
                  type = "btrfs";
                  extraArgs = "-f";
                  subvolumes = {
                    "@" = {
                      mountpoint = "/";
                      mountOptions = [ "ssd" "noatime" "compress-force=zstd:3" "discard=async" ];
                    };
                    "@nix" = {
                      mountpoint = "/nix";
                      mountOptions = [ "ssd" "noatime" "compress-force=zstd:3" "discard=async" ];
                    };
                    "@persist" = {
                      mountpoint = "/persist";
                      mountOptions = [ "ssd" "noatime" "compress-force=zstd:3" "discard=async" ];
                    };
                  };
                };
              };
            };
          }
        ];
      };
    };
  };
}
