{ inputs, pkgs, ... }:

let
  # Citrix Workspace is only available from nixpkgs master.
  # This is a separate nixpkgs instance, so allowUnfree is not inherited.
  citrixPkgs = import inputs.nixpkgs-citrix {
    system = pkgs.stdenv.hostPlatform.system;
    config.allowUnfree = true;
  };
in
{
  home.packages = [ citrixPkgs.citrix-workspace ];
}
