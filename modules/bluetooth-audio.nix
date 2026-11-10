{ pkgs, ... }:

{
  # Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;

    # Enable BlueZ experimental features for device compatibility.
    settings.General.Experimental = true;
  };

  # Audio
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };

  # Audio utilities
  environment.systemPackages = with pkgs; [
    pamixer
    pavucontrol
  ];
}
