{ inputs, lib, pkgs, config, outputs, ... }:
let
  inherit (inputs.nix-colors) colorSchemes;
in
{
  imports = [
    inputs.impermanence.nixosModules.home-manager.impermanence
    inputs.nix-colors.homeManagerModule
    ../features/desktop/common/kitty.nix
    ../features/cli
    ../features/nvim
  ] ++ (builtins.attrValues outputs.homeManagerModules);

  nixpkgs = {
    # overlays = builtins.attrValues outputs.overlays; # not working, dunno why
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  nix = {
    package = lib.mkDefault pkgs.nix;
    settings = {
      experimental-features = [ "nix-command" "flakes" "repl-flake" ];
      warn-dirty = false;
    };
  };

  systemd.user.startServices = "sd-switch";

  programs = {
    home-manager.enable = true;
    git.enable = true;
  };

  home = {
    username = lib.mkDefault "snow";
    homeDirectory = lib.mkDefault "/home/${config.home.username}";
    stateVersion = lib.mkDefault "23.05";

    persistence = {
      "/persist/home/snow" = {
        directories = [
          "Documents"
          "Downloads"
          "Pictures"
          "Videos"
        ];
        allowOther = true;
      };
    };
  };

  colorscheme = lib.mkDefault colorSchemes.catppuccin;
  home.file.".colorscheme".text = config.colorscheme.slug;
}
