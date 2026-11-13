{ ... }:

{
  services.hypridle = {
    enable = true;

    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";
        before_sleep_cmd = "pidof hyprlock || hyprlock";
        after_sleep_cmd = "umbriel msg dpms-on";
      };

      listener = [
        {
          timeout = 150;
          on-timeout = "brightnessctl -s set 10%";
          on-resume = "brightnessctl -r";
        }
        {
          timeout = 300;
          on-timeout = "pidof hyprlock || hyprlock";
        }
        {
          timeout = 900;
          on-timeout = "umbriel msg dpms-off";
          on-resume = "umbriel msg dpms-on";
        }
      ];
    };
  };
}
