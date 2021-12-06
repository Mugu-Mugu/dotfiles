{ config, pkgs, ... }:
{
  imports = [./nur.nix];
  programs.firefox = {
    enable = true;
    package = pkgs.firefox.override {
      # See nixpkgs' firefox/wrapper.nix to check which options you can use
      cfg = {
        # Gnome shell native connector
        enableGnomeExtensions = true;
      };
    };
    extensions = with pkgs.nur.repos.rycee.firefox-addons; [
      https-everywhere
      bitwarden
      ublock-origin
      reduxdevtools
      vimium
      lastpass-password-manager
    ];
  };}
