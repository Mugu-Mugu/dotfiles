{ config, pkgs, ... }:

{

  programs.git = {
    enable = true;
  };

  home.packages = with pkgs; [
    git-crypt
  ];

}
