{ config, pkgs, ... }:

{
  # This package contains configuration required to start Emacs and the dependencies of my .emacs.d configuration

  # required dependencies
  home.packages = with pkgs; [
    git
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
    extraPackages = epkgs: with epkgs; [ vterm org ];
    package = pkgs.emacsGcc;
  };

  services.emacs.enable = true;

  # Configuring emacs in home-manager would make no sense.
  # My configuration has too much features and I don't want to manage both at the same time
  home.activation = {
    ensureEmacsD = config.lib.dag.entryAfter ["writeBoundary"] "
    if ! [ -f ~/.emacs.d/init.el ]; then
      $DRY_RUN_CMD rm -rf ~/.emacs.d
      $DRY_RUN_CMD git clone https://github.com/Mugu-Mugu/.emacs.d ~/.emacs.d
    fi
  ";
  };

  # Required for activation which is done in a different context that my home-manager configuration
  # git may be absent from the host system
  home.extraActivationPath = with pkgs; [
    git
  ];
}
