{ config, pkgs, ... }:

{
  imports = [
    ../modules/home_manager.nix
    ../modules/git.nix
    ../modules/security.nix
  ];
}
