{
  description = "A Home Manager flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    emacs-overlay.url = "github:nix-community/emacs-overlay";
  };

  outputs = inputs:
    let makeStandardConf = profile_file: {
          nixosModules.${profile_file} = ./. + "/nixpkgs/profiles/${profile_file}.nix";
          homeConfigurations.${profile_file} = inputs.home-manager.lib.homeManagerConfiguration {
            system = "x86_64-linux";
            homeDirectory = "/home/david";
            username = "david";
            stateVersion = "22.05";
	    extraModules =  [ ];
            configuration = {config, pkgs, ...}: {
              imports = [./nixpkgs/profiles/${profile_file}.nix];
              nixpkgs.overlays = [ inputs.emacs-overlay.overlay ];
            };
          };
        };
        in
           builtins.foldl' inputs.nixpkgs.lib.recursiveUpdate {} [
             (makeStandardConf "bootstrap")
             (makeStandardConf "base")
             (makeStandardConf "wakeo")
	   ];
}
