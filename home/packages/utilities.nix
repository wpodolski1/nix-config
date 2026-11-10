{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nautilus
    yazi

    # Brightness keys
    brightnessctl

    # Nix tools
    nh

    btop

    basedpyright
    ruff
    uv
  ];
}
