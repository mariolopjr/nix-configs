{ config, pkgs, ... }:
{
    programs.vscode = {
        enable = true;
        package = pkgs.vscode;
        # extensions = with pkgs.vscode-extensions; [
        #    bbenoist.Nix
        # ];
        userSettings = {
            "terminal.integrated.fontFamily" = config.fontProfiles.monospace.family;
        };
    };
}
