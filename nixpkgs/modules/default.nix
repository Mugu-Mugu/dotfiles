{ config, pkgs, ... }:
{
  imports = [
    ./git.nix
    ./emacs.nix
    ./dropbox.nix
    ./firefox.nix
  ];
}
