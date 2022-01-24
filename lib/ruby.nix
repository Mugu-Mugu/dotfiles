{
  mkRubyVersionOverlay = version@{ major, minor, patch } : self : super :
    let
      version_branch = "${major}.${minor}";
      version_full = "${version_branch}.${patch}";
      src = builtins.fetchurl {
        url = "https://cache.ruby-lang.org/pub/ruby/${version_branch}/ruby-${version_full}.tar.gz";
      };
      in
    {
      ruby = super.ruby.overrideAttrs (old: {
        version = version_full;
        src = src;
        patches = [];
        postPatch = "";
      });
    };
}
