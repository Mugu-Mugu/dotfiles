{ config, pkgs, ... }:

let ssh = "${config.home.homeDirectory}/.ssh";
in
{
  programs.ssh = {
    matchBlocks = {
      "github.com" = {
        hostname = "github.com";
        user = "MuguMugu";
        # TODO the file is hardcoded and should come from a secret
        identityFile = "${ssh}/id_ed25519";
        identitiesOnly = true;
      };
    };
  };
}
