{
  pkgs,
  config,
  inputs,
  ...
}: {
  imports = [
    # Mostly user-specific configuration
    ./variables.nix

    # Programs
    ../../home/programs/ghostty
    ../../home/programs/nvf
    ../../home/programs/shell
    ../../home/programs/fetch
    ../../home/programs/git
    ../../home/programs/lazygit
    ../../home/programs/media
    #./../home/programs/spicetify

    # System (Desktop environment like stuff)
    ../../home/system/mime
    ../../home/system/udiskie
    ../../home/system/niri
    ../../home/system/gtk

    inputs.dankMaterialShell.homeModules.dankMaterialShell.default
    inputs.dankMaterialShell.homeModules.dankMaterialShell.niri

    # ./secrets # CHANGEME: You should probably remove this line, this is where I store my secrets
  ];

  home = {
    inherit (config.var) username;
    homeDirectory = "/home/" + config.var.username;

    packages = with pkgs; [
      # Apps
      #bitwarden-desktop # Password manager
      blanket # White-noise app
      obsidian # Note taking app
      # planify # Todolists
      gnome-calendar # Calendar
      textpieces # Manipulate texts
      curtail # Compress images
      resources
      gnome-clocks
      gnome-text-editor
      figma-linux
      google-chrome # Web browser
      libreoffice # Office suite
      vesktop # Discord desktop app
      nautilus
      xdg-user-dirs
      xdg-user-dirs-gtk

      # Dev
      go
      bun
      #nodejs
      python3
      jq
      just
      pnpm
      air

      # Utils
      zip
      unzip
      optipng
      jpegoptim
      pfetch
      btop
      fastfetch
      imagemagick
      inkscape

      # Just cool
      peaclock
      cbonsai
      pipes
      cmatrix
      spotify

      # Backup
      #brave
      vscode
    ];

    # Import my profile picture, used by the hyprpanel dashboard
    file.".face.icon" = {source = ./profile_picture.png;};

    # Don't touch this
    stateVersion = "24.05";
  };

  stylix.image = ../../walls/w11.jpg;
  stylix.targets = {
    ghostty.enable = false;
    gtk.enable = true; #setting 4now b/c false breaks themeing
    kitty.enable = false;
    neovim.enable = false;
    nvf.enable = false;
    nixvim.enable = false;
    qt = {
      enable = false;
      platform = "qtct";
    };
    vscode.enable = false;
  };
  programs.home-manager.enable = true;

  programs.dankMaterialShell = {
    enable = true;

    niri = {
      enableKeybinds = true;
      #enableSpawn = true;
    };
    default.settings = {
      theme = "dark";
      dynamicTheming = true;

      # Core features
      enableSystemMonitoring = true; # System monitoring widgets (dgop)
      enableClipboard = true; # Clipboard history manager
      enableVPN = true; # VPN management widget
      enableBrightnessControl = true; # Backlight/brightness controls
      enableColorPicker = true; # Color picker tool
      enableDynamicTheming = true; # Wallpaper-based theming (matugen)
      enableAudioWavelength = true; # Audio visualizer (cava)
      enableCalendarEvents = true; # Calendar integration (khal)
      enableSystemSound = true; # System sound effects
    };
  };
}
