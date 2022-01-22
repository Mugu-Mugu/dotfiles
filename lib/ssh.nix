{ config, ...} :
{
  generateSshKeyActivation = { privateKeyPath,
                               publicKeyPath,
                               keyName ? "id_rsa"} : {
    loadSshKeys = config.lib.dag.entryAfter ["writeBoundary"] ''
      $DRY_RUN_CMD chmod 600 ${privateKeyPath}
      $DRY_RUN_CMD chmod 644 ${publicKeyPath}
      $DRY_RUN_CMD chmod 700 ~/.ssh
      $DRY_RUN_CMD cp ${privateKeyPath} ~/.ssh/${keyName}
      $DRY_RUN_CMD cp ${publicKeyPath} ~/.ssh/${keyName}.pub
    '';
  };
}
