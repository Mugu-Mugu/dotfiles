{ config, pkgs, ... }:

{
  # This package gather my default configuration for git. It may be overridden in work profiles.

  programs.git = {
    enable = true;
    userName = "MuguMugu";
    userEmail = "amardavid3241@gmail.com";
  };

  home.packages = with pkgs; [
    git-crypt
  ];

}
