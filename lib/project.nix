inputs@{ config, projectsRootDir , ... } :
{
  define = {
    name ? "the name of the project",
    gitLink ? "an url to a git repository",
    shell ? "the nix shell file describing project environment"
  } :
    let
      projectDir = "${projectsRootDir}/${name}";
      projectDirGit = "${projectDir}/.git";
    in  {
      home.file."${projectDir}/shell.nix".source = shell;
      home.file."${projectDir}/.envrc".source = ../templates/.envrc;
      home.activation =
          {
            "initializeProject[${name}]" = config.lib.dag.entryAfter ["linkGeneration"] ''
                if [[ ! -d  ${projectDirGit} ]]; then
                   $DRY_RUN_CMD shopt -s dotglo
                   $DRY_RUN_CMD git clone ${gitLink} /tmp/${name}
                   $DRY_RUN_CMD mv /tmp/${name}/* ${projectDir}/
                   $DRY_RUN_CMD rm -rf /tmp/${name}
                   $DRY_RUN_CMD cd ${projectDir}
                   $DRY_RUN_CMD direnv allow
                fi
            '';
          };
    };
}
