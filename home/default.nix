{ ... }:

{
  imports = [
    ./fastfetch.nix
    ./fish.nix
    ./hypridle.nix
    ./hyprlock.nix
    ./kitty.nix
    ./niri.nix
    ./noctalia.nix
    ./zen.nix
    ./packages
  ];

  home = {
    username = "user";
    homeDirectory = "/home/user";
    stateVersion = "26.05";
    sessionVariables = {
      EDITOR = "nvim";
      SUDO_EDITOR = "nvim";
      VISUAL = "nvim";
    };
  };
}
