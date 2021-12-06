# Overview
This is my configuration for both dotfiles and userland applications/services based on Nix and Home Manager.
Only Emacs configuration is managed separately.

# Getting started
```bash
# get the repository
git clone https:/github.com/MuguMugu/dotfiles
# run the appropriate bootstrap file
./bootstrap_ubuntu.sh
# activate the configuration
home-manager switch
```

# Manual operations
Some manual operations can't be automated:
- start dropbox and authenticate
- start firefox and synchronize
