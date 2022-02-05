inputs@{ config, projectsRootDir , ... } :
{
  define = {
    name ? "the name of the project",
    gitLink ? "an url to a git repository",
    shellSpec ? "shell spec to load",
    files ? []
  } :
    let
      projectDir = "${projectsRootDir}/${name}";
      projectDirGit = "${projectDir}/.git";
      addFile = all : file :
        all // { "${projectDir}/${builtins.baseNameOf file}".source = file; };
      linkAllFiles = builtins.foldl' addFile {};
      projectShellSpec = "${projectDir}/${builtins.baseNameOf shellSpec}";
    in  {
      home.file = linkAllFiles files;
      home.activation =
          {
            "initializeProject[${name}]" = config.lib.dag.entryAfter ["linkGeneration"] ''
                $DRY_RUN_CMD rm -f ${projectShellSpec}
                $DRY_RUN_CMD cp ${shellSpec} ${projectShellSpec}
                if [[ ! -d  ${projectDirGit} ]]; then
                   $DRY_RUN_CMD shopt -s dotglob
                   $DRY_RUN_CMD git clone ${gitLink} /tmp/${name}
                   $DRY_RUN_CMD mv /tmp/${name}/* ${projectDir}/
                   $DRY_RUN_CMD rm -rf /tmp/${name}
                fi
                $DRY_RUN_CMD cd ${projectDir}
                $DRY_RUN_CMD direnv allow
            '';
          };
    };
}
