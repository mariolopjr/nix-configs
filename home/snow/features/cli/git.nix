{ pkgs, ... }:
let
  ssh = "${pkgs.openssh}/bin/ssh";
in
{
  programs.git = {
    enable = true;
    package = pkgs.gitAndTools.gitFull;
    userName = "Mario Lopez";
    userEmail = "mario@techmunchies.net";
    extraConfig = {
      feature.manyFiles = true;
      init.defaultBranch = "main";
    };
    lfs = { enable = true; };
    ignores = [ ".direnv" "result" ];
    signing = {
      signByDefault = true;
      key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILLW/ZvXc3A4Y1RXENFhlgWgMHZJjJZhshg7+8yDBM2B";
    };
  };
}
