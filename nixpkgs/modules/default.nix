{ config, pkgs, ... }:
{
  # This directory contains modular package of configuration that may be included as a whole or separately.

  # This file aggregates:
  # - child packages which solves a particular problem or implement a identified feature
  # - all configuration for which no other child package exist yet

  # By default, all new configurations goes there

  # A child package should be created when:
  # - a service or program require configuration in addition of its activation
  # - it is not necessary to include it by default but its default configuration is agnostic of a work context;
  #   in this case, it should go as a package into the optional sub-module

  # Child packages may be aggregated in a sub-module when there is enough child packages dealing about the
  # same topic
  imports = [
    ./git.nix
    ./emacs.nix
    ./dropbox.nix
    ./security.nix
    ./fonts.nix
    ./home_manager.nix
    ./shells
  ];

  home.packages = with pkgs; [
    # hardware tools
    hwinfo
    pciutils
  ];

  programs.ssh = {
    enable = true;
  };

  programs.firefox = {
    enable = true;
  };
}
