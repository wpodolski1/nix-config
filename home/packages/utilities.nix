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
    wl-clipboard

    basedpyright
    ruff
    uv
  ];
}
