inputs@{ config, projectsRootDir , ... } :
{
  define = {
    name ? "the name of the project",
    gitLink ? "an url to a git repository",
    files ? []
  } :
    let
      projectDir = "${projectsRootDir}/${name}";
      projectDirGit = "${projectDir}/.git";
      addFile = all : file :
        all // { "${projectDir}/${builtins.baseNameOf file}".source = file; };
      linkAllFiles = builtins.foldl' addFile {};
    in  {
      home.file = {
        "${projectDir}/.envrc".source = ../templates/.envrc;
      } // linkAllFiles files;
      home.activation =
          {
            "initializeProject[${name}]" = config.lib.dag.entryAfter ["linkGeneration"] ''
                if [[ ! -d  ${projectDirGit} ]]; then
                   $DRY_RUN_CMD shopt -s dotglob
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
