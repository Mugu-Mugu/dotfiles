#!/bin/bash

# install bootstrap dependencies
sudo apt install -y git

(

cd ~ 

# ensure installation in a standardized location
git clone https://github.com/Mugu-Mugu/dotfiles
cd dotfiles
# because I use ssh keys authentication
git remote set-url origin git@github.com:Mugu-Mugu/dotfiles.git

# install nix toolchain in single user
sh <(curl -L https://nixos.org/nix/install) --no-daemon
. ~/.nix-profile/etc/profile.d/nix.sh

# install home manager in standalone mode
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
export NIX_PATH=$HOME/.nix-defexpr/channels${NIX_PATH:+:}$NIX_PATH
nix-shell '<home-manager>' -A install

# activate flake support
nix-env -iA nixpkgs.nixUnstable
mkdir -p ~/.config/nix/
echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf

# home-manager is ready to handle the rest
home-manager switch --flake ".#bootstrap"

)
