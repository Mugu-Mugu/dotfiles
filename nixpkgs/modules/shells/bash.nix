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
    function hm_switch_debug {
      (
        cd ~/dotfiles
        home-manager switch --show-trace --flake ".#$1"
      )
    }
'';

  };

}
