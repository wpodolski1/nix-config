{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/bluetooth-audio.nix
    ./modules/nvidia.nix
  ];

  # Boot
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  # Networking and locale
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  time.timeZone = "Europe/Warsaw";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pl_PL.UTF-8";
    LC_IDENTIFICATION = "pl_PL.UTF-8";
    LC_MEASUREMENT = "pl_PL.UTF-8";
    LC_MONETARY = "pl_PL.UTF-8";
    LC_NAME = "pl_PL.UTF-8";
    LC_NUMERIC = "pl_PL.UTF-8";
    LC_PAPER = "pl_PL.UTF-8";
    LC_TELEPHONE = "pl_PL.UTF-8";
    LC_TIME = "pl_PL.UTF-8";
  };

  # Keyboard layout (shared with Wayland through xkb)
  services.xserver.xkb.layout = "us";

  users.users.wojt = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  # System-wide package policy and Nix features
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # User-facing configuration lives in home/; enable the programs here.
  programs.fish.enable = true;
  programs.niri.enable = true;
  programs.nix-ld.enable = true; # Run dynamically linked prebuilt binaries.

  # Hyprlock needs a PAM service to authenticate and unlock the session.
  security.pam.services.hyprlock = { };

  # System essentials only; user packages are declared in home/packages/.
  environment.systemPackages = with pkgs; [
    git
    neovim
    wget
  ];

  # Do not change without reviewing NixOS release upgrade notes.
  system.stateVersion = "26.05";
}
