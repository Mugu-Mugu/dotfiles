{ config, pkgs, ... }:

{
  imports = [
    ../modules
    ../languages/python.nix
    ./base
  ];

}
