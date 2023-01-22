{
  imports = [
    ../common/optional/btrfs-optin-persistence.nix
    ../common/optional/encrypted-root.nix
  ];

  boot = {
    initrd = {
      # availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" ];
      availableKernelModules = [ "virtio_pci" "nvme" "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" "virtio_blk" ];
      # kernelModules = [ "kvm-amd" ];
    };
    loader = {
      systemd-boot = {
        enable = true;
        consoleMode = "max";
      };
      efi.canTouchEfiVariables = true;
    };
  };

  # fileSystems."/" =
  #   { device = "/dev/disk/by-uuid/f10fd9f8-b326-4a35-966c-2c7a8ee21b22";
  #     fsType = "btrfs";
  #     options = [ "subvol=root" "ssd" "noatime" "compress-force=zstd:3" "discard=async" ];
  #   };

  # boot.initrd.luks.devices."stark_crypt".device = "/dev/disk/by-uuid/e6def295-365c-467a-a6d7-64280b192f0b";

  # fileSystems."/nix" =
  #   { device = "/dev/disk/by-uuid/f10fd9f8-b326-4a35-966c-2c7a8ee21b22";
  #     fsType = "btrfs";
  #     options = [ "subvol=nix" "ssd" "noatime" "compress-force=zstd:3" "discard=async" ];
  #   };

  # fileSystems."/persist" =
  #   { device = "/dev/disk/by-uuid/f10fd9f8-b326-4a35-966c-2c7a8ee21b22";
  #     fsType = "btrfs";
  #     options = [ "subvol=persist" "ssd" "noatime" "compress-force=zstd:3" "discard=async" ];
  #   };

  # fileSystems = {
  #   "/boot" = {
  #     device = "/dev/disk/by-label/ESP";
  #     fsType = "vfat";
  #   };

  networking.useDHCP = true;

  nixpkgs.hostPlatform = "x86_64-linux";
  # hardware.cpu.amd.updateMicrocode = true;
  hardware.cpu.intel.updateMicrocode = true;
}
