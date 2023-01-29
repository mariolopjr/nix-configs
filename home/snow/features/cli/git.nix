{ pkgs, ... }:
let
  ssh = "${pkgs.openssh}/bin/ssh";
in
{
  programs.git = {
    enable = true;
    package = pkgs.gitAndTools.gitFull;
    aliases = {
      pushall = "!git remote | xargs -L1 git push --all";
      graph = "log --graph -10 --branches --remotes --tags  --format=format:'%Cgreen%h %Creset• %<(75,trunc)%s (%cN, %cr) %Cred%d' --date-order";
      add-nowhitespace = "!git diff -U0 -w --no-color | git apply --cached --ignore-whitespace --unidiff-zero -";
      branches = "branch -a";
      tags = "tag";
      stashes = "stash list";
      unstage = "reset -q HEAD --";
      discard = "checkout --";
      uncommit = "reset --mixed HEAD~";
      amend = "commit --amend";
      nevermind = "!git reset --hard HEAD && git clean -d -f";
      precommit = "diff --cached --diff-algorithm=minimal -w";
      unmerged = "diff --name-only --diff-filter=U";
      remotes = "remote -v";
    };
    userName = "Mario Lopez";
    userEmail = "mario@techmunchies.net";
    extraConfig = {
      feature.manyFiles = true;
      init.defaultBranch = "main";
      gpg.format = "ssh";
      user.signingkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILLW/ZvXc3A4Y1RXENFhlgWgMHZJjJZhshg7+8yDBM2B";
      commit.gpgsign = true;
    };
    lfs = { enable = true; };
    ignores = [ ".direnv" "result" ];
  };
}
