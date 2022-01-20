{ config, pkgs, ... }:

let secretDir = "../../../secrets/ssh/base";
    ssh = "${config.home.homeDirectory}/.ssh";
in
{
  programs.ssh = {
    matchBlocks = {
      "github.com" = {
        hostname = "github.com";
        user = "MuguMugu";
        identityFile = "${ssh}/id_rsa";
        identitiesOnly = true;
      };
    };
  };

  home.file.".ssh/id_rsa".source = ./${secretDir}/id_rsa;
  home.file.".ssh/id_rsa.pub".source = ./${secretDir}/id_rsa.pub;
}
