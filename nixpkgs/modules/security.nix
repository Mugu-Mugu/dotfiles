{ config, pkgs, ... }:

{
  programs.gpg = {
    enable = true;
    mutableKeys = true;
    mutableTrust = true;
  };

  services.gpg-agent = {
    enable = true;
    pinentryFlavor = "gnome3";
    verbose = true;
  };

  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "electron-9.4.4"
    ];
  };

  home.packages = with pkgs; [
    authy
    bitwarden
  ];
}
