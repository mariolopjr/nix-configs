{ pkgs, ... }: {
  imports = [
    ./bash.nix
    ./bat.nix
    ./fish.nix
    ./git.nix
    ./ssh.nix
    ./nix.nix
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

    # build
    clang-tools

    # lsp
    nil
    ltex-ls

    # formatters
    nixfmt
  ];
}
