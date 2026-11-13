{ ... }:

{
  programs.noctalia = {
    enable = true;
    systemd.enable = true;

    settings.theme = {
      mode = "dark";
      source = "builtin";
      builtin = "Tokyo-Night"; # Noctalia built-in palette.
    };
  };

}
