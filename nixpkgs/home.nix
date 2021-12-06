{ config, pkgs, ... }:

{
  imports = [
    ./modules
  ];

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

  home.packages = with pkgs; [
    git
    fira-code
    fira-code-symbols
    gnumake
    libvterm
    libtool
    cmake
    gcc
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Required to get the fonts installed by home-manager to be picked up by OS.
  fonts.fontconfig.enable = true;
}
