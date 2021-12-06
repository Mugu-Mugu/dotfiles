{ config, pkgs, ... }:

{
  # required dependencies
  home.packages = with pkgs; [
    git
    fira-code
    fira-code-symbols
    libvterm
    libtool
    cmake
    fd
    ripgrep
    fzf
    sqlite
    gcc
  ];

  programs.emacs = {
    enable = true;
    extraPackages = epkgs: with epkgs; [ vterm org org-plus-contrib ];
    package = pkgs.emacsUnstableGcc;
  };

  services.emacs.enable = true;

  # Configuring emacs in home-manager would make no sense.
  # My configuration has too much feature
  home.activation = {
    ensureEmacsD = config.lib.dag.entryAfter ["writeBoundary"] "
    if ! [ -f ~/.emacs.d/init.el ]; then
      $DRY_RUN_CMD rm -rf ~/.emacs.d
      $DRY_RUN_CMD git clone https://github.com/Mugu-Mugu/.emacs.d ~/.emacs.d
    fi
  ";
  };

  home.extraActivationPath = with pkgs; [
    git
  ];

  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/emacs-overlay/archive/master.tar.gz;
    }))
  ];
}
