{ config, pkgs, ... }:

{
  imports = [
    ./zsh.nix
    ./bash.nix
  ];
}
