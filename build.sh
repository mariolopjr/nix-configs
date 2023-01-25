#! /usr/bin/env bash

# Shows the output of every command
set +x

build_ci_home() {
  nix build .#homeConfigurations.snow@winterfell.activationPackage -L
}

build_ci_system() {
  nix build .#nixosConfigurations.winterfell.config.system.build.toplevel -L
}

fresh_install() {
  nix-shell -p cachix --command '
    cachix use mariolopjr
    ./switch system
    ./build pre-home
    ./switch home
    ./build post-home
  '
}

case $1 in
  "ci-home")
    build_ci_home;;
  "ci-system")
    build_ci_system;;
  "fresh-install")
    fresh_install;;
  *)
    echo "Invalid option. Expected 'ci-home', 'ci-system', 'pre_home', 'post_home' or 'fresh-install'";;
esac
