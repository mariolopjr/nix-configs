# shell for bootstrapping flake-enabled nix and other tooling
{ pkgs ?
  # if pkgs is not defined, instantiate nixpkgs from locked commit
  let
    lock = (builtins.fromJSON (builtins.readFile ./flake.lock)).nodes.nixpkgs.locked;
    nixpkgs = fetchTarball {
      url = "https://github.com/nixos/nixpkgs/archive/${lock.rev}.tar.gz";
      sha256 = lock.narHash;
    };
  in import nixpkgs { overlays = [ ]; }
, ...
}: pkgs.mkShell {
  NIX_CONFIG = "extra-experimental-features = nix-command flakes repl-flake";
  nativeBuildInputs = with pkgs; [
    nix
    home-manager
    git

    sops
    gnupg
    age
  ];
}
