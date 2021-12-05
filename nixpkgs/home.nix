{ config, pkgs, ... }:

{
  imports = [

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
  programs.git = {
    enable = true;
    userName = "Mugu";
    userEmail = "amardavid3241@gmail.com";
    
    # TODO maybe interesting 
    # delta.enable = true;
    };
  

  programs.home-manager.enable = true;
  programs.emacs = {
    enable = true;
    extraPackages = epkgs: with epkgs; [ vterm org org-plus-contrib ];
  };

  services.emacs.enable = true;
  services.emacs.package = pkgs.emacsUnstableGcc;
  programs.emacs.package = pkgs.emacsUnstableGcc;

  # Required to get the fonts installed by home-manager to be picked up by OS.
  fonts.fontconfig.enable = true;

  home.activation.ensureEmacsD = config.lib.dag.entryAfter ["writeBoundary"] "
    if ! [ -f ~/.emacs.d/init.el ]; then
      $DRY_RUN_CMD rm -rf ~/.emacs.d
      $DRY_RUN_CMD git clone https://github.com/Mugu-Mugu/.emacs.d ~/.emacs.d
    fi
  ";
  home.extraActivationPath = with pkgs; [
     git
  ];

  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/emacs-overlay/archive/master.tar.gz;
    }))
  ];
}
