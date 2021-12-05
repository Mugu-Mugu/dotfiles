#!/bin/bash

# install bootstrap dependencies
sudo apt install curl

# install nix toolchain
curl -L https://nixos.org/nix/install | sh
. ~/.nix-profile/etc/profile.d/nix.sh

# install home manager in standalone mode
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager

nix-channel --update

export NIX_PATH=$HOME/.nix-defexpr/channels${NIX_PATH:+:}$NIX_PATH
nix-shell '<home-manager>' -A install

# allow home manager to handle the shell configuration
source $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh

# link the nix configuration to this repository
rm -rf $HOME/.config/nixpkgs 2>/dev/null
ln -fs $PWD/nixpkgs $HOME/.config/nixpkgs
