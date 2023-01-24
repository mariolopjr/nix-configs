![Neovim](https://img.shields.io/badge/NeoVim-%2357A143.svg?&style=for-the-badge&logo=neovim&logoColor=white)
[![NixOS Unstable](https://img.shields.io/badge/NixOS-unstable-blue.svg?style=flat-square&logo=NixOS&logoColor=white)](https://nixos.org)

**Sup!** Always wanted to get NixOS running, but was overwhelmed by analysis paralysis? Wello hopefully this repo has got your back!

> **Disclaimer:** _This likely will not work. I'm impressed it works for me_ To be honest, it's not working right now...yet! :lolsob:

------

|                |                                                          |
|----------------|----------------------------------------------------------|
| **Shell:**     | fish + tide                                              |
| **DM:**        | gnome                                                    |
| **WM:**        | gnome                                                    |
| **Editor:**    | neovim                                                   |
| **Terminal:**  | kitty                                                    |
| **Launcher:**  |                                                          |
| **Browser:**   | firefox                                                  |
| **GTK Theme:** | [Node](https://github.com/Nord)                          |

-----

## Quick start

1. Acquire NixOS 22.11 or newer:
   ```sh
   # nixos-unstable
   wget -O nixos.iso https://channels.nixos.org/nixos-unstable/latest-nixos-minimal-x86_64-linux.iso

   # create flash drive
   cp nixos.iso /dev/sdX
   ```

2. Boot into the installer.

3. Switch to root user: `sudo su -`

4. Do your partitions and mount your root to `/mnt`. Since I want impermeance, you can use my setup of UEFI boot + LUKS2 + btrfs, see `format.sh`

5. Install these dotfiles:
   ```sh
   # faster to use nix-shell than nix shell --experimental-bullshit blah
   nix-shell -p git nixFlakes

   # xet HOST to the desired hostname of this system
   HOST=...
   # xet USER to your desired username
   USER=...

   git clone https://github.com/mariolopjr/nix-configs /etc/dotfiles
   cd /etc/dotfiles

   # install nixOS
   nixos-install --root /mnt --flake .#$HOST

   # nix-shell to perform home manager config
   nix-shell
   home-manager --flake .#$USER@$HOST switch

   # Then move the dotfiles to the mounted drive!
   mv /etc/dotfiles /mnt/etc/dotfiles
   ```

6. Then reboot and you're good to go!
