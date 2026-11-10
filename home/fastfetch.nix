{ ... }:

{
  # The module provides the binary; this keeps the hand-maintained themed config.
  programs.fastfetch.enable = true;
  xdg.configFile."fastfetch/config.jsonc".source = ./fastfetch/fastfetch.jsonc;
}
