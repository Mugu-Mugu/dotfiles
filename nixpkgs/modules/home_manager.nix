{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "david";
  home.homeDirectory = "/home/david";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # On some non-nixos system, the installation is not persistent
  xsession.profileExtra = ''
    if [ -f ~/.nix-profile/etc/profile.d/nix.sh ]; then
      . ~/.nix-profile/etc/profile.d/nix.sh
    fi;
'';

  # Necessary for nix application to be visible by some non-nixos system UI (like Ubuntu for instance)
  targets.genericLinux.enable = true;
}
