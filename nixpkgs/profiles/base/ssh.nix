inputs@{ config, pkgs, ... }:

let secretDir = "../../../secrets/ssh/base";
    keyName = "id_rsa";
    ssh = "${config.home.homeDirectory}/.ssh";
    lib = import ../../../lib/ssh.nix inputs;
in
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

  home.activation = lib.generateSshKeyActivation {
    privateKeyPath = ./${secretDir}/id_rsa;
    publicKeyPath = ./${secretDir}/id_rsa.pub;
    keyName = keyName;
  };
}
