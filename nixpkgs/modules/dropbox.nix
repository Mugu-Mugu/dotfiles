{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  services.dropbox = {
    enable = true;
    path = "${config.home.homeDirectory}/Dropbox";
  };

  home.file."org".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Dropbox/org/";

  # automatically start dropbox
  xdg.configFile."autostart/dropbox.desktop".text = ''
    [Desktop Entry]
    Type=Application
    Exec=${pkgs.dropbox}/bin/dropbox
    Terminal=false
    Name=Dropbox
    Categories=Network;FileTransfer;
    Comment=Sync your files across computers and to the web
    GenericName=File Synchronizer
    StartupNotify=false
  '';
}
