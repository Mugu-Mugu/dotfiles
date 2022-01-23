{
  bootstrap = { config, pkgs, ... }:
    {
      imports = [./profiles/bootstrap.nix];
    };
  default = { config, pkgs, ... }:
    {
      imports = [./profiles/base.nix];
    };
  wakeo = { config, pkgs, ... }:
    {
      imports = [./profiles/wakeo.nix];
  };
}
