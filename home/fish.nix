{ pkgs, ... }:

{
  programs.fish = {
    enable = true;
    preferAbbrs = true;

    interactiveShellInit = ''
      set -g fish_greeting
      '';

    # Commands that expand when pressing Space
    shellAbbrs = {
      ns = "nh os switch /home/wojt/nix-config-umbriel -H user";
      nb = "nh os boot /home/wojt/nix-config-umbriel -H user";
      nt = "nh os test /home/wojt/nix-config-umbriel -H user";
      nu = "sudo nix flake update --flake /home/wojt/nix-config-umbriel";
      nq = "sudo nix-collect-garbage --delete-old";
      v = "nvim";
      svim = "sudoedit";

      # Navigation
      ".." = "cd ..";
      "..." = "cd ../..";
    };

    # Commands that stay shortened
    shellAliases = {
      ls = "eza --icons=auto";
      ll = "eza -lah --icons=auto --group-directories-first";
      lt = "eza --tree --icons=auto";
      ff = "fastfetch";
      lg = "lazygit";
    };
  };

  home.packages = with pkgs; [
    eza
    lazygit
  ];
}
