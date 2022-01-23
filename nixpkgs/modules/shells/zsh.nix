{ config, pkgs, ... }:

{

  programs.zsh = {
    enable = true;
    enableVteIntegration = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    autocd = true;
    defaultKeymap = "emacs";
    history = {
      ignorePatterns = ["rm *"];
      ignoreSpace = true;
      save = 10000;
      size = 10000;
      share = true;
    };

    envExtra = ''
    function hm_switch {
      (
        cd ~/dotfiles
        home-manager switch --flake ".#$1"
      )
      source ~/.bashrc
    }
'';
  };

  programs.zsh.oh-my-zsh = {
    enable = true;
    theme = "robbyrussell";
    plugins = [
      # "aws" # maybe this could be useful?
      "bundler" # may need additional configuration
      "common-aliases"
      "command-not-found"
      "colored-man-pages"
      "copybuffer"
      "direnv"
      "docker"
      "fd"
      "fzf" # may need additional configuration
      "ripgrep"
      "rsync-copy"
      "safe-paste"
      "zsh-interactive-cd"

      # this should probably be activated on a per-project basis
      "pipenv"
      "pip"
      "npm"
      "rails" # this would be better to activate no relevant project
      "redis-cli"
      "virtualenv"
      "yarn"
      "zoxide"
    ];
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
}
