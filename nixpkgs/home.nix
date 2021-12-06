{
  bootstrap = { config, pkgs, ... }:
    {
      imports = [./profiles/bootstrap.nix];
    };
  default = { config, pkgs, ... }:
    {
      imports = [./profiles/base_conf.nix];
    };
  wakeo = { config, pkgs, ... }:
    {
      imports = [./profiles/wakeo.nix];
  };
}
