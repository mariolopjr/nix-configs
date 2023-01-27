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
| **GTK Theme:** | [Node](https://github.com/catppuccin)                          |

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

4. Format and install these dotfiles:
   ```sh
   # faster to use nix-shell than nix shell --experimental-bullshit blah
   nix-shell -p git nixFlakes

   git clone https://github.com/mariolopjr/nix-configs /etc/dotfiles && cd $_

   # Do your partitions and mount your root to `/mnt`. Since I want impermeance, you can use my setup of UEFI boot + LUKS2 + btrfs
   ./format.sh

   # install nixOS
   nixos-install --no-root-passwd --root /mnt --flake .#<HOST>
   exit

   # Then move the dotfiles to the mounted drive!
   cd ..
   mv /etc/dotfiles /mnt/persist/dotfiles

   # nixos-enter to chroot into install and set password (for now)
   nixos-enter
   export USER=<user>
   passwd $USER
   mkdir -p /persist/home/$USER
   chown -R $USER:users /persist/home/$USER
   chmod -R 700 /persist/home/$USER
   exit
   ```

6. Reboot and you're good to go!
