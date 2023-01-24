{ pkgs, ... }: {
  imports = [
    ./bash.nix
    ./bat.nix
    ./fish.nix
    ./git.nix
    ./ssh.nix
  ];
  home.packages = with pkgs; [
    distrobox

    # tools
    comma
    bc
    bottom
    ncdu
    exa
    ripgrep
    fd
    curl
    jq

    # lsp
    nil
    ltex-ls

    # formatters
    nixfmt
  ];
}
