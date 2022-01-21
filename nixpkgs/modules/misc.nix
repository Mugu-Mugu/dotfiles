{ config, pkgs, ... }:

{
 # various misc tools that do not require extra configuration
 home.packages = with pkgs; [
   slack
   discord
   hwinfo
   pciutils
 ];
}
