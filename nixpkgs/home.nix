{
  bootstrap = { config, pkgs, ... }:
    {
      imports = [./profiles/bootstrap.nix];
      home.file.".config/nixpkgs/home.nix".source = ./profiles/bootstrap.nix;
    };
  default = { config, pkgs, ... }:
    {
      imports = [./profiles/base.nix];
      home.file.".config/nixpkgs/home.nix".source = ./profiles/base.nix;
    };
  wakeo = { config, pkgs, ... }:
    {
      imports = [./profiles/wakeo.nix];
      home.file.".config/nixpkgs/home.nix".source = ./profiles/wakeo.nix;
  };
}
