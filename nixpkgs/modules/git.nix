{ config, pkgs, ... }:

{

  programs.git = {
    enable = true;
    userName = "MuguMugu";
    userEmail = "amardavid3241@gmail.com";
    # TODO maybe interesting
    # delta.enable = true;
  };

  home.packages = with pkgs; [
    git-crypt
  ];

}
