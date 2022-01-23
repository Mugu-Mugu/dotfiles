{ config, pkgs, ... }:

{

  programs.bash = {
    enable = true;
    enableVteIntegration = true;
    bashrcExtra = ''
    function hm_switch {
      (
        cd ~/dotfiles
        home-manager switch --flake ".#$1"
      )
      source ~/.bashrc
    }
'';

  };

}
