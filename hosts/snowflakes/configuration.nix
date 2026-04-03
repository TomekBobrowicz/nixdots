{
  config,
  pkgs,
  ...
}: {
  imports = [
    # Mostly system related configuration
    ../../nixos/audio.nix
    ../../nixos/bluetooth.nix
    ../../nixos/fonts.nix
    ../../nixos/home-manager.nix
    ../../nixos/nix.nix
    ../../nixos/systemd-boot.nix
    ../../nixos/dmsgreet.nix
    ../../nixos/users.nix
    ../../nixos/utils.nix
    ../../nixos/niri.nix

    # You should let those lines as is
    ./hardware-configuration.nix
    ./variables.nix
  ];
  system.activationScripts.script.text = ''
    mkdir -p /var/lib/AccountsService/{icons,users}

     set -eu
             for user in /home/*; do
                 username=$(basename "$user")
                 if [ -f "$user/.face.icon" ]; then
                     if [ ! -f "/var/lib/AccountsService/icons/$username" ]; then
                         cp "$user/.face.icon" "/var/lib/AccountsService/icons/$username"
                     else
                         if [ "$user/.face.icon" -nt "/var/lib/AccountsService/icons/$username" ]; then
                             cp "$user/.face.icon" "/var/lib/AccountsService/icons/$username"
                         fi
                     fi
                 fi
             done

  '';
  services.accounts-daemon.enable = true;
  stylix.targets.chromium.enable = false;
  home-manager.users."${config.var.username}" = import ./home.nix;

  programs.dms-shell = {
    enable = true;
    quickshell.package = pkgs.quickshell;

    systemd = {
      enable = true; # Systemd service for auto-start
      restartIfChanged = true; # Auto-restart dms.service when dms-shell changes
    };

    # Core features
    enableSystemMonitoring = true; # System monitoring widgets (dgop)
    enableVPN = true; # VPN management widget
    enableDynamicTheming = true; # Wallpaper-based theming (matugen)
    enableAudioWavelength = true; # Audio visualizer (cava)
    enableCalendarEvents = true; # Calendar integration (khal)
    enableClipboardPaste = true; # Pasting from the clipboard history (wtype)
  };

  # Don't touch this
  system.stateVersion = "26.05";
}
