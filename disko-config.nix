{ disks ? [ "/dev/sda" ], ... }: {
  disko.devices.disk.nvme = {
    type = "disk";
    device = builtins.elemAt disks 0;
    content = {
      type = "gpt";
      partitions = {
        esp = {
          priority = 1;
          name = "ESP";
          start = "1MiB";
          end = "513MiB";
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
              name = "system"
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
}
