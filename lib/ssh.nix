{ config, ...} :
{
  configureKey =
    storeKeysPath :
    {
      keyName ? "id_rsa",
      permission ? "600"
    } :
    let
      sshDir = "${config.home.homeDirectory}/.ssh";
      sshKeyPath = "${sshDir}/${keyName}";
      storeKeyPath = "${storeKeysPath}/${keyName}";
    in
    {
      # this hack is required because there are some very strict requirements about key permissions
      # there are no other way to configure permission in home-manager
      home.activation = {
        "clear[${keyName}]SshKey" = config.lib.dag.entryBefore ["checkFilesChanged"] ''
            $DRY_RUN_CMD rm -f  ${sshKeyPath}
        '';
        "load[${keyName}]SshKey" = config.lib.dag.entryAfter ["writeBoundary"] ''
            $DRY_RUN_CMD chmod 600 ${storeKeyPath}
            $DRY_RUN_CMD chmod 700 ~/.ssh
            $DRY_RUN_CMD cp ${storeKeyPath} ${sshKeyPath}
        '';
      };
    };
}
