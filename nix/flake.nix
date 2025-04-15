{
  description = "Example Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:Homebrew/homebrew-cask";
      flake = false;
    };
    homebrew-bundle = {
      url = "github:homebrew/homebrew-bundle";
      flake = false;
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew, homebrew-core, homebrew-cask, homebrew-bundle }:
  let
    configuration = { pkgs, ... }: {
      nixpkgs.config.allowUnfree = true;
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages =
        [ 
            pkgs.neovim
            pkgs.aerospace
            pkgs.wezterm
            pkgs.raycast
            pkgs.mas
            pkgs.git
            pkgs.zoxide
            pkgs.eza
            pkgs.go
            pkgs.rustup
            pkgs.nodejs
            pkgs.fzf
            pkgs.python3
            pkgs.discord
            pkgs.ripgrep
            pkgs.fd
            pkgs.ast-grep
            pkgs.tableplus
            pkgs.bun
            pkgs.postman
            # pkgs.bruno
            pkgs.tmux
            pkgs.uv
            pkgs.jq
            pkgs.redis
            # pkgs.deno
        ];

    homebrew = {
      	enable = true;
        masApps = {
            "Klack" = 6446206067;
            "Hidden Bar" = 1452453066;
        };
        brews = [
            "docker"
            "docker-compose"
            "czg"
            "influxdb"
            "influxdb-cli"
        ];
        casks = [
            "ghostty"
        ];
        onActivation = {
          cleanup = "zap";
          autoUpdate = true;
          upgrade = true;
        };
    };

    fonts.packages = [
        pkgs.nerd-fonts.zed-mono
    ];

      # Auto upgrade nix package and the daemon service.
      services.nix-daemon.enable = true;
      # nix.package = pkgs.nix;
      services.redis.enable = true;

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Create /etc/zshrc that loads the nix-darwin environment.
      programs.zsh.enable = true;  # default shell on catalina
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      system = {
        defaults = {
            dock = {
                autohide = true;
                orientation = "right";
                persistent-apps  = [];
                tilesize = 32;
            };
            loginwindow.GuestEnabled = false;
            NSGlobalDomain.AppleICUForce24HourTime = true;
            NSGlobalDomain.AppleInterfaceStyle = "Dark";
            NSGlobalDomain.KeyRepeat = 2;
        };
      };

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 5;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#simple
    darwinConfigurations."szelam" = nix-darwin.lib.darwinSystem {
      modules = [
        ({ config, ... }: {                                                          # <--
          homebrew.taps = builtins.attrNames config.nix-homebrew.taps;               # <--
        })  
        configuration 
        nix-homebrew.darwinModules.nix-homebrew
        {
          nix-homebrew = {
            # Install Homebrew under the default prefix
            enable = true;
            # Apple Silicon Only: Also install Homebrew under the default Intel prefix for Rosetta 2
            enableRosetta = true;
            # User owning the Homebrew prefix
            user = "szelam";
            # Optional: Declarative tap management
            taps = {
              "homebrew/homebrew-core" = homebrew-core;
              "homebrew/homebrew-cask" = homebrew-cask;
              "homebrew/homebrew-bundle" = homebrew-bundle;
            };
            # Optional: Enable fully-declarative tap management
            #
            # With mutableTaps disabled, taps can no longer be added imperatively with `brew tap`.
            mutableTaps = false;
          };
        }
      ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."szelam".pkgs;
  };
}
