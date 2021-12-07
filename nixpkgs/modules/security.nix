{ config, pkgs, ... }:

{
  programs.gpg = {
    enable = true;
    mutableKeys = true;
    mutableTrust = true;
  };

  nixpkgs.config = {
    permittedInsecurePackages = [
      "electron-9.4.4"
    ];
  };

  home.packages = with pkgs; [
    authy
  ];
}
