# NixOS config

Niri + Noctalia, Kitty, Fish, Zen. Home Manager is included in system rebuilds.
Flake target: `user`. Hostname: `nixos`. Hardware: x86_64, AMD, UEFI.

## What's where

- `flake.nix`: inputs, host target, Home Manager wiring.
- `flake.lock`: pinned dependency versions; commit it.
- `configuration.nix`: boot, networking, locale, users, system programs.
- `hardware-configuration.nix`: generated disks/mounts and hardware settings.
- `modules/`: system modules (Bluetooth/audio).
- `home/default.nix`: username, home directory, program imports.
- `home/<program>.nix`: program settings; assets in the matching directory.
- `home/packages/`: desktop, development, utilities, work (Citrix).

## Commands

Run from the checkout:

```bash
sudo nixos-rebuild build --flake .#user    # build only
sudo nixos-rebuild switch --flake .#user   # apply system + home
nix flake update                         # upgrade pinned dependencies
nix fmt ./flake.nix ./configuration.nix ./home ./modules
```

To pull changes: save local edits, `git pull --ff-only`, review, rebuild.
Don't update `flake.lock` when restoring the same versions. Don't bump
`system.stateVersion` / `home.stateVersion` just to upgrade packages.

## Fresh install

1. Install and boot NixOS (UEFI), create your account with sudo access.
2. Back up `/etc/nixos` and personal data before changing anything.
3. Clone (replace the URL):

   ```bash
   nix-shell -p git
   git clone https://github.com/YOUR-USER/YOUR-REPO.git "$HOME/nix-config"
   cd "$HOME/nix-config"
   cp /etc/nixos/hardware-configuration.nix ./hardware-configuration.nix
   ```

4. If using a different account, replace `wojt` in `configuration.nix`, `flake.nix`
   (Home Manager user), and `home/default.nix` (username + home path).
   Keep `#user` as the flake target, or rename it and update `home/fish.nix` too.
5. Review the new hardware file and preserve required boot/encryption settings
   from the installer configuration. Stage new files with `git add <path>`.
6. Build, then install for the next boot:

   ```bash
   sudo nixos-rebuild build --flake .#user --option experimental-features 'nix-command flakes'
   sudo nixos-rebuild boot --flake .#user --option experimental-features 'nix-command flakes'
   sudo reboot
   ```

Log in on a TTY and run `niri-session` (no graphical login manager configured).
Home Manager file conflicts: back up the reported file, then retry.

## Umbriel experiment (disabled)

Niri is the active compositor again because Umbriel failed with mixed
NVIDIA/AMD outputs. The Umbriel flake input and configuration files are kept
for future testing, but neither `modules/umbriel.nix` nor `home/umbriel.nix`
is currently imported. The notes below apply only if Umbriel is re-enabled.

- Apply this checkout with `sudo nixos-rebuild switch --flake .#user`.
  Confirm `~/.config/umbriel/config.toml` exists; without it, Umbriel uses
  its packaged defaults instead of this checkout's monitors and shortcuts.
- Noctalia provides the bar, launcher, wallpaper, and notifications; Waybar
  is not configured. When re-enabling Umbriel, bind Noctalia's service to
  `umbriel-session.target` rather than the shared graphical target, which
  can stay active across compositor changes. Launch with `start-umbriel`.
- If Noctalia is missing in a running Umbriel session:

  ```bash
  systemctl --user status umbriel.service noctalia.service
  systemctl --user restart noctalia.service
  journalctl --user -b -u noctalia.service -n 80 --no-pager
  ```

- Validate configuration with
  `umbriel config validate -c home/umbriel/config.toml`.
- Inspect displays with `umbriel outputs`. Rendering errors such as
  `Failed to pick primary buffer format` / `Failed to create swapchain`
  are a separate graphics problem, not a missing bar. Inspect
  `journalctl --user -b -u umbriel.service` and `~/.cache/umbriel/umbriel.log`.
  With multiple GPUs, check which GPU each monitor is connected to before
  excluding devices: excluding a GPU also loses its connected displays.
- Upstream: https://docs.noctalia.dev/umbriel/installation/ and
  https://docs.noctalia.dev/umbriel/configuration/.

## Things to remember

- Monitors/keybinds: `home/niri/config.kdl`.
- Zen profile name: `home/zen.nix`; browser data needs a separate backup.
- Lock wallpaper: `~/Wallpaper/evening_sky.png` (not in Git).
- Themes: Tokyo Night for Noctalia/Hyprlock; Catppuccin Mocha for Kitty/Zen.
- Fish rebuild shortcuts use `/home/wojt/nix-config-umbriel`; change paths in
  `home/fish.nix` if using a different account or checkout location.
- Restore documents, keys, passwords, and app data separately. Keep plaintext
  secrets outside this tree: `.gitignore` does not protect the Nix store.
- Recovery: choose an older boot generation, or
  `sudo nixos-rebuild switch --rollback`. Keep a known-good generation.
