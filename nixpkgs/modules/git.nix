{ config, pkgs, ... }:

{

  programs.git = {
    enable = true;
    userName = "Mugu";
    userEmail = "amardavid3241@gmail.com";

    # TODO maybe interesting
    # delta.enable = true;
  };
}
