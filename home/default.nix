{ ... }:

{
  imports = [
    ./fastfetch.nix
    ./fish.nix
    ./hypridle.nix
    ./hyprlock.nix
    ./kitty.nix
    ./umbriel.nix
    ./noctalia.nix
    ./zen.nix
    ./packages
  ];

  home = {
    username = "wojt";
    homeDirectory = "/home/wojt";
    stateVersion = "26.05";
    sessionVariables = {
      EDITOR = "nvim";
      SUDO_EDITOR = "nvim";
      VISUAL = "nvim";
    };
  };
}
