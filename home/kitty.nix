{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;

    font = {
      name = "CaskaydiaCove Nerd Font Mono";
      size = 12;
      package = pkgs.nerd-fonts.caskaydia-cove;
    };

    settings = {
      # Font
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";

      # General
      enable_audio_bell = false;
      window_padding_width = 25;
      cursor_trail = 1;
      shell = "${pkgs.fish}/bin/fish";
      hide_window_decorations = "yes";

      # Tab bar
      tab_bar_edge = "bottom";
      tab_bar_style = "powerline";
      tab_powerline_style = "slanted";
      tab_title_template = "{title}{' :{}:'.format(num_windows) if num_windows > 1 else ''}";

      # Catppuccin Mocha
      foreground = "#CDD6F4";
      background = "#1E1E2E";

      # Selection and cursor
      selection_foreground = "#1E1E2E";
      selection_background = "#F5E0DC";

      cursor = "#F5E0DC";
      cursor_text_color = "#1E1E2E";

      # Borders
      url_color = "#B4BEFE";

      active_border_color = "#CBA6F7";
      inactive_border_color = "#8E95B3";
      bell_border_color = "#EBA0AC";

      wayland_titlebar_color = "system";

      # Tabs
      active_tab_foreground = "#11111B";
      active_tab_background = "#CBA6F7";
      inactive_tab_foreground = "#CDD6F4";
      inactive_tab_background = "#181825";
      tab_bar_background = "#11111B";

      # Marks
      mark1_foreground = "#1E1E2E";
      mark1_background = "#87B0F9";
      mark2_foreground = "#1E1E2E";
      mark2_background = "#CBA6F7";
      mark3_foreground = "#1E1E2E";
      mark3_background = "#74C7EC";

      # Terminal colors
      color0 = "#43465A";
      color8 = "#43465A";

      color1 = "#F38BA8";
      color9 = "#F38BA8";

      color2 = "#A6E3A1";
      color10 = "#A6E3A1";

      color3 = "#F9E2AF";
      color11 = "#F9E2AF";

      color4 = "#87B0F9";
      color12 = "#87B0F9";

      color5 = "#F5C2E7";
      color13 = "#F5C2E7";

      color6 = "#94E2D5";
      color14 = "#94E2D5";

      color7 = "#CDD6F4";
      color15 = "#A1A8C9";
    };
  };
}
