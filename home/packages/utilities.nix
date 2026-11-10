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
    pciutils
    ripgrep

    basedpyright
    ruff
    uv
  ];
}
