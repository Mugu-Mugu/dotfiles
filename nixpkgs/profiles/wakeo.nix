{ config, pkgs, ... }:

{
  imports = [
    ../modules
    ../languages
    ./wakeo
  ];
}
