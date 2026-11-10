{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gcc
    python3
    uv
    unzip
    nodejs

    # AI tools
    herdr
    opencode
    #codex
    gh

  ];
}
