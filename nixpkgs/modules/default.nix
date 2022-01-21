{ config, pkgs, ... }:
{
  imports = [
    ./terminal.nix
    ./git.nix
    ./emacs.nix
    ./dropbox.nix
    ./firefox.nix
    ./docker.nix
    ./security.nix
    ./fonts.nix
    ./home_manager.nix
    ./ssh.nix
    ./misc.nix
  ];
}
