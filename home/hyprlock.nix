{ ... }:

{
  programs.hyprlock = {
    enable = true;

    settings = {
      # Tokyo Night palette
      "$base" = "rgb(1a1b26)";
      "$surface" = "rgb(24283b)";
      "$text" = "rgb(c0caf5)";
      "$muted" = "rgb(565f89)";
      "$accent" = "rgb(7aa2f7)";

      general = {
        hide_cursor = true;
        ignore_empty_input = true;
      };

      background = [
        {
          monitor = "";
          path = "~/Wallpaper/evening_sky.png";
          blur_passes = 0;
          brightness = 0.7;
          contrast = 0.9;
          vibrancy = 0.17;
        }
      ];

      label = [
        {
          monitor = "";
          text = "$TIME";
          color = "$text";
          font_family = "CaskaydiaCove Nerd Font Mono";
          font_size = 72;
          position = "0, 160";
          halign = "center";
          valign = "center";
        }
        {
          monitor = "";
          text = "Locked";
          color = "$muted";
          font_family = "CaskaydiaCove Nerd Font Mono";
          font_size = 18;
          position = "0, 80";
          halign = "center";
          valign = "center";
        }
      ];

      "input-field" = [
        {
          monitor = "";
          size = "320, 52";
          position = "0, -60";
          halign = "center";
          valign = "center";
          rounding = 12;
          outline_thickness = 2;
          outer_color = "$accent";
          inner_color = "$surface";
          font_color = "$text";
          placeholder_text = "<span foreground=\"##565f89\">Password...</span>";
          dots_size = 0.2;
          dots_spacing = 0.2;
          dots_center = true;
          fade_on_empty = false;
        }
      ];
    };
  };
}
