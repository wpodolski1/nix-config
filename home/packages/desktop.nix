{ pkgs, ... }:

{
  home.packages = with pkgs; [
    adw-gtk3
    bibata-cursors
    chromium
    discord
    nwg-look
    papirus-icon-theme

    # XWayland
    xwayland-satellite
  ];
}
