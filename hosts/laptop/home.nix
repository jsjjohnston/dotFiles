{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ../../modules/nixvim
  ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "jay";
  home.homeDirectory = "/home/jay";

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      decoration = {
        shadow_offset = "0 5";
        "col.shadow" = "rgba(00000099)";
      };

      input = {
        kb_layout = "us";
      };

      "$mod" = "SUPER";
      "$terminal" = "kitty";
      "$menu" = "rofi -show drun";
      "$fileManager" = "dolphin";
      monitor = ",preferred,auto,auto";

      bind = [
        "$mod, q, exec, $terminal"
        "$mod, c, killactive"
        "$mod, m, exit"
        "$mod, e, exec, $fileManager"
        "$mod, v, togglefloating"
        "$mod, r, exec, $menu"
        "$mod, p, exec, pseudo"
        "$mod, j, togglesplit"
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"
      ];
      exec-once = [
        "$terminal"
        "waybar"
      ];
    };
  };
  home.stateVersion = "24.05"; # Please read the comment before changing.

  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
  };

  programs.git-credential-oauth = {
    hosts = [
      "https://github.com"
    ];
    enable = true;
  };

  programs.git = {
    enable = true;
    userName = "Jay Johnston";
    userEmail = "jsjjohnston@gmail.com";
    lfs.enable = true;
    extraConfig = {
      push = {autoSetupRemote = true;};
    };
  };

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;
    #".config/nvim".source = ./nvim;
    # "test.txt".source = dotfiles/test.txt;
    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/jay/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
