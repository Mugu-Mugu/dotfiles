{
  description = "A Home Manager flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs: {
    homeConfigurations = {
      david-bootstrap = inputs.home-manager.lib.homeManagerConfiguration {
        system = "x86_64-linux";
        homeDirectory = "/home/david";
        username = "david";
        configuration.imports = [ ./nixpkgs/profiles/bootstrap.nix ];
      };
    };
  };
}
