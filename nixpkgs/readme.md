# Overview
This is my configuration for both dotfiles and userland applications/services based on Nix and Home Manager.
Only Emacs configuration is managed separately.


# Installation
## Bootstrapping
```bash
# get the repository
git clone https:/github.com/MuguMugu/dotfiles
# run the relevant bootstrap file
# it will install home-manager in standalone mode
./bootstrap_ubuntu.sh
# activate the bootstrap configuration
home-manager switch -a bootstrap
# load an authorized private key
gpg --import {path_to_a_private_key}
# activate any configuration
home-manager switch -a default
```

## Manual operations
Some manual operations can't be automated:
- start dropbox and authenticate
- start firefox and synchronize

# Usage
```bash
# start my default config
home-manager switch -A default
# start my Wakeo config
home-manager switch -A wakeo
```
