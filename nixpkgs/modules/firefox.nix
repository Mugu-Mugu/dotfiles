{ config, pkgs, ... }:

{

  home.packages = with pkgs; [ firefox ];

  # Copied from nix wiki but it looks like it doesn't work
  # home.packages = with pkgs; [ firefox-wayland ];

  # configuration required for screensharing
  # services.pipewire.enable = true;
  # xdg = {
  #   portal = {
  #     enable = true;
  #     extraPortals = with pkgs; [
  #       xdg-desktop-portal-wlr
  #       xdg-desktop-portal-gtk
  #     ];
  #     gtkUsePortal = true;
  #   };
  # };
  # # Home Manager setup
  # home.sessionVariables = {
  #   MOZ_ENABLE_WAYLAND = 1;
  #   XDG_CURRENT_DESKTOP = "sway";
  # };

}
