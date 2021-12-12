{
  description = "A Home Manager flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs:
    let makeStandardConf = profile_file: {
          nixosModules."${profile_file}" = ./. + "/nixpkgs/profiles/${profile_file}.nix";
          homeConfigurations.${profile_file} = inputs.home-manager.lib.homeManagerConfigurations {
            system = "x86_64-linux";
            homeDirectory = "/home/david";
            username = "david";
            configuration.imports = [ (./. +  "./nixpkgs/profiles/${profile_file}.nix") ];
          };
        }; in
      # makeStandardConf("bootstrap") // makeStandardConf("base");
      {nixosModules.bootstrap = import ./nixpkgs/profiles/bootstrap.nix;
          homeConfigurations.bootstrap = inputs.home-manager.lib.homeManagerConfiguration {
            system = "x86_64-linux";
            homeDirectory = "/home/david";
            username = "david";
            configuration.imports = [ ./nixpkgs/profiles/bootstrap.nix ];
          };
      };
}
