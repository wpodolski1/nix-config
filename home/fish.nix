{ pkgs, ... }:

{
  programs.fish = {
    enable = true;
    preferAbbrs = true;

    # Commands that expand when pressing Space
    shellAbbrs = {
      ns = "nh os switch /home/wojt/nix-config -H user";
      nb = "nh os boot /home/wojt/nix-config -H user";
      nt = "nh os test /home/wojt/nix-config -H user";
      nu = "sudo nix flake update --flake /home/wojt/nix-config";
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
