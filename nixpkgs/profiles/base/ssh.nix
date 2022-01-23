inputs@{ config, pkgs, lib, ... }:

let secretDir = "../../../secrets/ssh/base";
    keyName = "id_rsa";
    ssh = "${config.home.homeDirectory}/.ssh";
    sshTools = import ../../../lib/ssh.nix inputs;
    configureKey = sshTools.configureKey ./${secretDir};
in
lib.mkMerge [
  {
    programs.ssh = {
      matchBlocks = {
        "github.com" = {
          hostname = "github.com";
          user = "MuguMugu";
          identityFile = "${ssh}/${keyName}";
          identitiesOnly = true;
        };
      };
    };
  }
  ( configureKey { keyName = "id_rsa"; } )
  ( configureKey { keyName = "id_rsa.pub"; })
]
