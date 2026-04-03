{
  description = ''
    DankOS simplifies and unifies the Niri WM and Dank Material shell with a modular, easily customizable setup.
    It provides a structured way to manage your system configuration and dotfiles with minimal effort.
  '';

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    stylix.url = "github:danth/stylix";
    catppuccin.url = "github:catppuccin/nix";
    apple-fonts.url = "github:Lyndeno/apple-fonts.nix";
    nvf.url = "github:notashelf/nvf";
    hourglass = {
      url = "gitlab:Alxhr0/hourglass";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dgop = {
      url = "github:AvengeMedia/dgop";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dms = {
      url = "github:AvengeMedia/DankMaterialShell/stable";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    antigravity-nix = {
      url = "github:jacopone/antigravity-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    mynixpkgs.url = "github:linuxmobile/mynixpkgs";
  };

  outputs = inputs @ {
    nixpkgs,
    antigravity-nix,
    catppuccin,
    ...
  }: {
    nixosConfigurations = {
      thinkpad =
        # CHANGEME: This should match the 'hostname' in your variables.nix file
        nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs;};
          modules = [
            {
              nixpkgs.overlays = [];
            }
            inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t460 # CHANGEME: check https://github.com/NixOS/nixos-hardware
            inputs.home-manager.nixosModules.home-manager
            inputs.stylix.nixosModules.stylix
            ./hosts/thinkpad/configuration.nix # CHANGEME: change the path to match your host folder
          ];
        };

      snowflakes =
        # CHANGEME: This should match the 'hostname' in your variables.nix file
        nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs;};
          modules = [
            {
              nixpkgs.overlays = [
                inputs.antigravity-nix.overlays.default
              ];
            }
            inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t14-amd-gen1 # CHANGEME: check https://github.com/NixOS/nixos-hardware
            inputs.home-manager.nixosModules.home-manager
            inputs.stylix.nixosModules.stylix

            ./hosts/snowflakes/configuration.nix # CHANGEME: change the path to match your host folder
          ];
        };
    };
  };
}
