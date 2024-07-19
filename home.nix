{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "eise";
  home.homeDirectory = "/home/eise";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    wofi
    kitty
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/eise/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

    # ZSH
    # Remove no config message
    home.file.".zshrc".text = "";
    programs.zsh.enable = true;

    # Fuzzyfinder
    programs.fzf = {
        enable = true;
        enableZshIntegration = true;
    };

    # Hyprland
    wayland.windowManager.hyprland = {
      enable = true;
      systemd.enable = false;
      settings = {};
    };
    xdg.configFile."hypr/hyprland.conf".source = ./config/hyprland.conf;

    # Kitty
    xdg.configFile."kitty/kitty.conf".source = ./config/kitty.conf;

    # Neovim
    programs.neovim = {
      enable = true;
    };
    xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink ~/.config/home-manager/config/nvim;

    # Firefox
    programs.firefox = {
      enable = true;
      policies = {
        DefaultDownloadDirectory = "~/downloads";
        BlockAboutConfig = true;
        DisableTelemetry = true;
        EnableTrackingProtection.Value = true;
      };
      profiles."Eise" = {
        search.default = "DuckDuckGo";
        # extensions = with pkgs.nur.repos.rycee.firefox-addons; [
          # bitwarden
          # darkreader
          # ublock-origin
          # enhancer-for-youtube
        # ];
        settings = {
          "ui.systemUsesDarkTheme" = 1;
        };
        bookmarks = [
          {
            name = "Toolbar";
            toolbar = true;
            bookmarks = [
              {
                name = "Wikipedia";
                url = "https://en.wikipedia.org/wiki";
              }
            ];
          }
        ];
      };
    };
}