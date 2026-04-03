{
  pkgs,
  config,
  inputs,
  lib,
  ...
}: {
  imports = [
    # Mostly user-specific configuration
    ./variables.nix

    # Programs
    ../../home/programs/ghostty
    #../../home/programs/editors/nvf
    ../../home/programs/editors/nixvim.nix
    ../../home/programs/shell
    ../../home/programs/fetch
    ../../home/programs/git
    ../../home/programs/lazygit
    ../../home/programs/media
    #../../home/programs/spicetify
    ../../home/programs/editors/antigravity.nix

    # System (Desktop environment like stuff)
    ../../home/system/mime
    ../../home/system/udiskie
    ../../home/system/niri
    #../../home/system/gtk

    # Scripts
    ../../home/scripts # All scripts

    inputs.catppuccin.homeModules.catppuccin
    #inputs.dms.homeModules.dank-material-shell
    #inputs.dms.homeModules.niri
  ];

  home = {
    inherit (config.var) username;
    homeDirectory = "/home/" + config.var.username;

    packages = with pkgs; [
      # Apps
      blanket # White-noise app
      obsidian # Note taking app
      gnome-calendar # Calendar
      textpieces # Manipulate texts
      curtail # Compress images
      resources
      gnome-clocks
      gnome-text-editor
      figma-linux
      google-chrome # Web browser
      waypaper # Wallpaper manager
      libreoffice # Office suite
      vesktop # Discord desktop app
      nautilus
      xdg-user-dirs
      xdg-user-dirs-gtk
      spotify

      # Dev
      go
      bun
      #nodejs
      python3
      jq
      just
      pnpm
      air
      vscode

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
    starship.enable = false;
    qt = {
      enable = false;
      platform = "qtct";
    };
    vscode.enable = false;
  };

  catppuccin = {
    enable = true;
    accent = "lavender";
    flavor = "mocha";
    gtk = {
      icon = {
        enable = true;
        flavor = "mocha";
      };
    };
    ghostty = {
      enable = true;
    };
  };

  programs.home-manager.enable = true;
  

  /*programs.dank-material-shell = {
    enable = true;
    systemd.enable = true;
    niri = {
      enableKeybinds = true;
      enableSpawn = false;
      includes = {
        enable = true;
        override = true;
        originalFileName = "hm";
        filesToInclude = [
          "alttab"
          "binds"
          "colors"
          "layout"
          "outputs"
        ];
      };
    };
    settings = {
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
      #dockTransparency = lib.mkForce "0.7";
      useAutoLocation = true;
      powerActionConfirm = false;
      launcherLogoMode = "os";

      
    };
  };*/
}
