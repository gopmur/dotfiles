{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "ali";
  home.homeDirectory = "/home/ali";

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
  home.packages = [
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

    # You can also set the file content immediately.
    ".config/oh-my-posh/themes/bubblesextra.omp.json".text = ''
      {
        "$schema": "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/schema.json",
        "blocks": [
          {
            "alignment": "right",
            "segments": [
              {
                "background": "#29315A",
                "foreground": "#3EC669",
                "leading_diamond": "\ue0b6",
                "properties": {
                  "style": "folder"
                },
                "style": "diamond",
                "template": "\ue5ff {{ .Path }}",
                "trailing_diamond": "\ue0b4",
                "type": "path"
              },
              {
                "background": "#29315A",
                "foreground": "#43CCEA",
                "foreground_templates": [
                  "{{ if or (.Working.Changed) (.Staging.Changed) }}#FF9248{{ end }}",
                  "{{ if and (gt .Ahead 0) (gt .Behind 0) }}#ff4500{{ end }}",
                  "{{ if gt .Ahead 0 }}#B388FF{{ end }}",
                  "{{ if gt .Behind 0 }}#B388FF{{ end }}"
                ],
                "leading_diamond": " \ue0b6",
                "properties": {
                  "branch_max_length": 25,
                  "fetch_stash_count": true,
                  "fetch_status": true,
                  "fetch_upstream_icon": true
                },
                "style": "diamond",
                "template": " {{ .UpstreamIcon }}{{ .HEAD }}{{if .BranchStatus }} {{ .BranchStatus }}{{ end }}{{ if .Working.Changed }} \uf044 {{ .Working.String }}{{ end }}{{ if and (.Working.Changed) (.Staging.Changed) }} |{{ end }}{{ if .Staging.Changed }} \uf046 {{ .Staging.String }}{{ end }}{{ if gt .StashCount 0 }} \ueb4b {{ .StashCount }}{{ end }} ",
                "trailing_diamond": "\ue0b4",
                "type": "git"
              },
              {

                "background": "#29315A",
                "foreground": "#E4F34A",
                "leading_diamond": " \ue0b6",
                "properties": {
                  "fetch_version": false
                },
                "style": "diamond",
                "template": "\ue235 {{ if .Error }}{{ .Error }}{{ else }}{{ if .Venv }}{{ .Venv }} {{ end }}{{ .Full }}{{ end }}",
                "trailing_diamond": "\ue0b4",
                "type": "python"
              },
              {
                "background": "#29315A",
                "foreground": "#7FD5EA",
                "leading_diamond": " \ue0b6",
                "properties": {
                  "fetch_version": false
                },
                "style": "diamond",
                "template": "\ue626{{ if .Error }}{{ .Error }}{{ else }}{{ .Full }}{{ end }}",
                "trailing_diamond": "\ue0b4",
                "type": "go"
              },
              {
                "background": "#29315A",
                "foreground": "#42E66C",
                "leading_diamond": " \ue0b6",
                "properties": {
                  "fetch_version": false
                },
                "style": "diamond",
                "template": "\ue718{{ if .PackageManagerIcon }}{{ .PackageManagerIcon }} {{ end }}{{ .Full }}",
                "trailing_diamond": "\ue0b4",
                "type": "node"
              },
              {
                "background": "#29315A",
                "foreground": "#E64747",
                "leading_diamond": " \ue0b6",
                "properties": {
                  "fetch_version": false
                },
                "style": "diamond",
                "template": "\ue791{{ if .Error }}{{ .Error }}{{ else }}{{ .Full }}{{ end }}",
                "trailing_diamond": "\ue0b4",
                "type": "ruby"
              },
              {
                "background": "#29315A",
                "foreground": "#E64747",
                "leading_diamond": " \ue0b6",
                "properties": {
                  "fetch_version": false
                },
                "style": "diamond",
                "template": "\ue738{{ if .Error }}{{ .Error }}{{ else }}{{ .Full }}{{ end }}",
                "trailing_diamond": "\ue0b4",
                "type": "java"
              },
              {
                "background": "#29315A",
                "foreground": "#9B6BDF",
                "leading_diamond": " \ue0b6",
                "properties": {
                  "fetch_version": false
                },
                "style": "diamond",
                "template": "\ue624{{ if .Error }}{{ .Error }}{{ else }}{{ .Full }}{{ end }} ",
                "trailing_diamond": "\ue0b4",
                "type": "julia"
              },
              {
                "type": "php",
                "style": "diamond",
                "foreground": "#ffffff",
                "background": "#4063D8",
                "leading_diamond": " \ue0b6",
                "properties": {
                  "fetch_version": false
                },
                "template": "\ue73d {{ .Full }} ",
                "trailing_diamond": "\ue0b4"
              },
              {
                "background": "#29315A",
                "foreground": "#9B6BDF",
                "foreground_templates": [
                  "{{if eq \"Charging\" .State.String}}#40c4ff{{end}}",
                  "{{if eq \"Discharging\" .State.String}}#ff5722{{end}}",
                  "{{if eq \"Full\" .State.String}}#4caf50{{end}}"
                ],
                "leading_diamond": " \ue0b6",
                "properties": {
                  "charged_icon": " ",
                  "charging_icon": "\u21e1 ",
                  "discharging_icon": "\u21e3 "
                },
                "style": "diamond",
                "template": "{{ if not .Error }}{{ .Icon }}{{ .Percentage }}{{ end }}{{ .Error }}",
                "trailing_diamond": "\ue0b4",
                "type": "battery"
              }
            ],
            "type": "prompt"
          },
          {
            "alignment": "left",
            "newline": true,
            "segments": [
              {
                "background": "#29315A",
                "foreground": "#AEA4BF",
                "leading_diamond": "\ue0b6",
                "properties": {
                  "style": "austin",
                  "threshold": 150
                },
                "style": "diamond",
                "template": "{{ .FormattedMs }}",
                "trailing_diamond": "\ue0b4 ",
                "type": "executiontime"
              },
              {
                "background": "#29315A",
                "foreground": "#E64747",
                "leading_diamond": "\ue0b6",
                "style": "diamond",
                "template": "{{ .UserName }} \u276f",
                "trailing_diamond": "\ue0b4",
                "type": "text"
              }
            ],
            "type": "prompt"
          }
        ],
        "final_space": true,
        "version": 2
      }
    '';
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
  #  /etc/profiles/per-user/ali/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "code";
    FZF_DEFAULT_COMMAND = "find .";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      enableAutosuggestions = true;
      syntaxHighlighting.enable = true;

      shellAliases = {
        nixswitch = "sudo nixos-rebuild switch";
        nixboot = "sudo nixos-rebuild switch";
        nixconfig = "$EDITOR /etc/nixos/configuration.nix";
        hmconfig = "$EDITOR ~/.config/home-manager/home.nix";
        hmswitch = "home-manager switch";
        hyprconfig = "$EDITOR ~/.config/hypr/hyprland.conf";
        ls = "eza --icons --group-directories-first";
        ll = "eza --icons -l --group-directories-first";
        tree = "eza --tree --icons";
        cat = "bat";
        clip = "wl-copy";
        whatismyip = "curl https://ipinfo.io/ip";
        logout = "hyprctl dispatch exit";
      };

      oh-my-zsh = {
        enable = true;
        plugins = [ "git" "node" "npm" ];
      };

      zplug = {
        enable = true;
        plugins = [{ name = "jirutka/zsh-shift-select"; }];
      };

      initExtra = ''
        eval "$(oh-my-posh init zsh --config '~/.config/oh-my-posh/themes/bubblesextra.omp.json')"
        eval "$(direnv hook zsh)"
      '';
    };
  };

  programs.vscode.keybindings = [
    {
      key = "ctrl+alt+up";
      command = "editor.action.insertCursorAbove";
      when = "editorTextFocus";
    }
    {
      key = "ctrl+shift+up";
      command = "-editor.action.insertCursorAbove";
      when = "editorTextFocus";
    }
    {
      key = "ctrl+alt+down";
      command = "editor.action.insertCursorBelow";
      when = "editorTextFocus";
    }
    {
      key = "ctrl+shift+down";
      command = "-editor.action.insertCursorBelow";
      when = "editorTextFocus";
    }
    {
      key = "shift+alt+down";
      command = "editor.action.copyLinesDownAction";
      when = "editorTextFocus && !editorReadonly";
    }
    {
      key = "ctrl+shift+alt+down";
      command = "-editor.action.copyLinesDownAction";
      when = "editorTextFocus && !editorReadonly";
    }
    {
      key = "shift+alt+up";
      command = "editor.action.copyLinesUpAction";
      when = "editorTextFocus && !editorReadonly";
    }
    {
      key = "ctrl+shift+alt+up";
      command = "-editor.action.copyLinesUpAction";
      when = "editorTextFocus && !editorReadonly";
    }
    {
      key = "ctrl+shift+up";
      command = "cursorUpSelect";
      when = "textInputFocus";
    }
    {
      key = "ctrl+shift+down";
      command = "cursorDownSelect";
      when = "textInputFocus";
    }
  ];

  programs.git = {
    enable = true;
    userName = "Ali Jafari";
    userEmail = "ali81jafari@outlook.com";
    extraConfig = {
      pull.rebase = true;
      credential.helper = "store";
      core.editor = "code";
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {

      exec-once = [
        "swww init"
        "swww img /home/ali/Downloads/paul-pastourmatzis-KT3WlrL_bsg-unsplash.jpg"
        "swww img /home/ali/Downloads/paul-pastourmatzis-KT3WlrL_bsg-unsplash.jpg"
        "hyprctl setcursor Nordic-cursors 24"
        "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1"
        "waybar"
        "nm-applet --indicator"
        "blueman-applet"
        "dunst"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
      ];
      monitor = "eDP-1, 1920x1080@144, 0x0, 1";
      env = [ "HYPRCURSOR_SIZE, 24" "HYPRCURSOR_THEME, Nordic-cursors" ];

      input = {
        kb_layout = "us,ir,de";
        # kb_variant =
        # kb_model =
        kb_options = "grp:win_space_toggle";
        # kb_rules =

        follow_mouse = 0;

        touchpad = { natural_scroll = "yes"; };

        sensitivity = 0;
      };

      general = {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more
        gaps_in = 5;
        gaps_out = [ 5 20 20 20 ];
        border_size = 2;
        "col.active_border" = "rgb(88C0D0)";
        "col.inactive_border" = "rgb(4C566A)";

        layout = "dwindle";

        # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
        allow_tearing = false;
      };

      decoration = {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more

        rounding = 10;

        blur = {
          enabled = true;
          size = 3;
          passes = 1;
        };

        drop_shadow = "yes";
        shadow_range = 4;
        shadow_render_power = 3;
        "col.shadow" = "rgba(1a1a1aee)";
      };

      animations = {
        enabled = "yes";

        # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      dwindle = {
        # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
        # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        pseudotile = "yes";
        # you probably want this
        preserve_split = "yes";
      };

      master = {
        # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
        new_is_master = true;
      };
      gestures = {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more
        workspace_swipe = "on";
      };

      misc = {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more
        force_default_wallpaper =
          -1; # Set to 0 to disable the anime mascot wallpapers
      };
      # Example per-device config
      # See https://wiki.hyprland.org/Configuring/Keywords/#executing for more
      "device:epic-mouse-v1" = { sensitivity = -0.5; };

      # Example windowrule v1
      # windowrule = float, ^(kitty)$
      # Example windowrule v2
      # windowrulev2 = float,class:^(kitty)$,title:^(kitty)$
      # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
      windowrule = [
        "float,polkit-gnome-authentication-agent-1"
        "center,polkit-gnome-authentication-agent-1"
        "size 400 500,polkit-gnome-authentication-agent-1"
        "noblur,^(Google-chrome)$"
      ];

      layerrule = "ignorezero, notifications";
      blurls = "notifications";

      # See https://wiki.hyprland.org/Configuring/Keywords/ for more
      "$mainMod" = "SUPER";
      bind = [
        "$mainMod, T, exec, kitty"
        # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
        "$mainMod, W, killactive,"
        "$mainMod, Q, togglefloating,"
        "$mainMod, R, exec, rofi -show drun"
        "$mainMod, F, fullscreen, 1"
        "$mainMod, V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"
        '', Print, exec, grim -g "$(slurp -d)" - | wl-copy''

        # Move focus with mainMod + arrow keys
        "$mainMod, H, movefocus, l"
        "$mainMod, L, movefocus, r"
        "$mainMod, K, movefocus, u"
        "$mainMod, J, movefocus, d"

        # Switch workspaces with mainMod + [0-9]
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        # ? I don't need it (I think)
        # Example special workspace (scratchpad)
        # "$mainMod, S, togglespecialworkspace, magic"
        # "$mainMod SHIFT, S, movetoworkspace, special:magic"

        # Scroll through existing workspaces with mainMod + scroll
        "$mainMod, right, workspace, e+1"
        "$mainMod, left, workspace, e-1"

        "$mainMod SHIFT, right, movetoworkspace, +1"
        "$mainMod SHIFT, left, movetoworkspace, -1"

        # Move Windows
        "$mainMod SHIFT, H, movewindow, l"
        "$mainMod SHIFT, L, movewindow, r"
        "$mainMod SHIFT, K, movewindow, u"
        "$mainMod SHIFT, J, movewindow, d"

        # Resize window
        "$mainMod CTRL, l, resizeactive, 50 0"
        "$mainMod CTRL, h, resizeactive, -50 0"
        "$mainMod CTRL, k, resizeactive, 0 -50"
        "$mainMod CTRL, j, resizeactive, 0 50"

      ];

      bindm = [
        # Move/resize windows with mainMod + LMB/RMB and dragging
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      binde = [
        ", XF86AudioRaiseVolume, exec, pamixer -i 5"
        ", XF86AudioLowerVolume, exec, pamixer -d 5"
        ", XF86AudioMute, exec, pamixer -t"
        ", XF86MonBrightnessUp, exec, brightnessctl s +5%"
        ", XF86MonBrightnessDown, exec, brightnessctl s 5%-"
      ];

      misc = {
        disable_hyprland_logo = true;
        force_hypr_chan = false;
      };

    };
  };

  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        output = [ "eDP-1" "HDMI-A-1" ];
        margin = "20 20 0 20";

        battery = {
          format-charging =
            "{capacity}% <span rise='250' size='large'> {icon}</span> <span rise='250' size='large'>  </span>";
          format-plugged =
            "{capacity}% <span rise='250' size='large'> {icon}</span> <span rise='250' size='large'>  </span>";
          format = "{capacity}% <span rise='250' size='large'> {icon}</span>";
          format-icons = [ "" "" "" "" "" ];
          max-length = 25;
          interval = 1;
        };

        backlight = {
          # device = "intel_backlight",
          format = "{percent}% <span rise='250' size='large'> {icon}</span>";
          format-icons = "";
        };

        pulseaudio = {
          format-muted = "<span size='large'>󰸈</span>";
          format = "{volume}% <span size='large'> {icon}</span>";
          format-icons = {
            headphones = "";
            handsfree = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [ "" ];
          };
        };

        "hyprland/language" = { format = "{short}"; };

        clock = {
          format = "{:%I:%M %p} <span rise='250' size='large'> </span>";
        };

        tray = { spacing = 10; };

        modules-right =
          [ "backlight" "pulseaudio" "battery" "hyprland/language" "tray" ];
        modules-center = [ "clock" ];
        modules-left = [ "hyprland/workspaces" ];

      };
    };
    style = ''
      /* colors */
      /* #5E81AC
      #81A1C1
      #88C0D0
      #8FBCBB */

      * {
      	border-radius: 0;
      	font-size: 12px;
      	min-height: 0;
      }

      window#waybar {
      	background: #4c566a;
      	color: #ECEFF4;
      	border-radius: 25;
      }

      .modules-left {
      	padding: 5 0 5 5;
      	border-bottom-right-radius: 20px;
      }

      .modules-right {
      	padding: 5 1 5 0;
      	border-bottom-left-radius: 20px;
      }

      #workspaces {
      	border: none;
      	background-color: rgba(0, 0, 0, 0);
      	border: solid 1px #8FBCBB;
      	padding: 0 10px;
      	padding-left: 0px;
      	padding-right: 5px;
      	border-radius: 19px;
      }

      #workspaces button {
      	font-size: 10px;
      	color: rgba(0, 0, 0, 0);
      	background-color: #ECEFF4;
      	padding: 0;
        padding-top: 1px;
      	padding-left: 1px;
      	margin-left: 5px;
      	margin-top: 5px;
      	margin-bottom: 5px;
      	border-radius: 100%;
      }

      #workspaces button.active {
      	background: #8FBCBB;
      	padding-left: 15px;
      	border-radius: 30px;
      }

      #workspaces button:hover {
      	color: #ECEFF4;
      	background: #8FBCBB;
      	text-shadow: none;
      	border: solid 1px #8FBCBB;
      }

      #workspaces button.active:hover {
      	color: rgba(0, 0, 0, 0);
      }

      #network {
      	background: #8FBCBB;
      }

      #workspaces button.urgent {
      }

      #mode {
      	background: #64727d;
      	border-bottom: 3px solid #ECEFF4;
      }

      #clock,
      #battery,
      #cpu,
      #memory,
      #temperature,
      #backlight,
      #network,
      #wireplumber,
      #pulseaudio,
      #custom-media,
      #tray,
      #mode,
      #language,
      #idle_inhibitor {
      	padding: 0 15px;
      	margin-right: 5px;
      	margin-left: 5px;
      	border-radius: 2rem;
      }

      #language {
        background: #8FBCBB;
      }

      #battery {
      	background: #88C0D0;
      	color: #ECEFF4;
      	padding-right: 25px;
      }

      #battery.plugged {
      	color: #ECEFF4;
      	background: #A3BE8C;
      }

      #battery.charging {
        color: #ECEFF4;
      	background: #A3BE8C;
      }

      #backlight {
      	color: #ECEFF4;
      	background: #5E81AC;
      	padding-right: 20px;
      }

      #pulseaudio {
      	padding-right: 20px;
      	background: #81A1C1;
      }

      #pulseaudio.muted {
      	padding-right: 16px;
      	padding-left: 15px;
      	padding-top: 2px;
      	background: #BF616A;
      }

      #tray {
      	border: solid 1px #8FBCBB;
      	color: #ECEFF4;
      }
    '';
  };

  programs.kitty = {
    enable = true;
    theme = "Nord";
    settings = {
      shell = "zsh";
      enable_audio_bell = "no";
      cursor_shape = "beam";
      window_padding_width = 15;
      background_opacity = "0.7";
      background_blur = 5;
      macos_thicken_font = "0";
    };
  };

  programs.rofi = {
    enable = true;
    theme = let
      # Use `mkLiteral` for string-like values that should show without
      # quotes, e.g.:
      # {
      #   foo = "abc"; => foo: "abc";
      #   bar = mkLiteral "abc"; => bar: abc;
      # };
      inherit (config.lib.formats.rasi) mkLiteral;
    in {

      #
      # Nordic rofi theme
      # Adapted by undiabler <undiabler@gmail.com>
      #
      # Nord Color palette imported from https://www.nordtheme.com/
      #
      configuration = {
        font = "Envy Code R 10";
        line-margin = mkLiteral "10";

        display-ssh = "";
        display-run = "";
        display-drun = "";
        display-window = "";
        display-combi = "";
        show-icons = mkLiteral "true";
      };

      listview = {
        lines = mkLiteral "6";
        columns = mkLiteral "2";
      };

      "*" = {
        nord0 = mkLiteral "#2e3440";
        nord1 = mkLiteral "#3b4252";
        nord2 = mkLiteral "#434c5e";
        nord3 = mkLiteral "#4c566a";

        nord4 = mkLiteral "#d8dee9";
        nord5 = mkLiteral "#e5e9f0";
        nord6 = mkLiteral "#eceff4";

        nord7 = mkLiteral "#8fbcbb";
        nord8 = mkLiteral "#88c0d0";
        nord9 = mkLiteral "#81a1c1";
        nord10 = mkLiteral "#5e81ac";
        nord11 = mkLiteral "#bf616a";

        nord12 = mkLiteral "#d08770";
        nord13 = mkLiteral "#ebcb8b";
        nord14 = mkLiteral "#a3be8c";
        nord15 = mkLiteral "#b48ead";

        foreground = mkLiteral "@nord9";
        backlight = mkLiteral "#ccffeedd";
        background-color = mkLiteral "transparent";

        highlight = mkLiteral "underline bold #eceff4";

        transparent = mkLiteral "rgba(46,52,64,0)";
      };

      window = {
        width = mkLiteral "50%";
        location = mkLiteral "center";
        anchor = mkLiteral "center";
        transparency = "real";
        padding = mkLiteral "1px";
        border = mkLiteral "0px";
        border-radius = mkLiteral "6px";

        background-color = mkLiteral "@transparent";
        spacing = mkLiteral "0";
        children = mkLiteral "[mainbox]";
        orientation = mkLiteral "horizontal";
      };

      mainbox = {
        spacing = mkLiteral "0";
        children = mkLiteral "[ inputbar, message, listview ]";
      };

      message = {
        color = mkLiteral "@nord0";
        padding = mkLiteral "5";
        border-color = mkLiteral "@foreground";
        border = mkLiteral "0px 2px 2px 2px";
        background-color = mkLiteral "@nord7";
      };

      inputbar = {
        color = mkLiteral "@nord6";
        padding = mkLiteral "11px";
        background-color = mkLiteral "#3b4252";

        border = mkLiteral "1px";
        border-radius = mkLiteral "6px 6px 0px 0px";
        border-color = mkLiteral "@nord10";
      };

      "entry, prompt, case-indicator" = {
        text-font = mkLiteral "inherit";
        text-color = mkLiteral "inherit";
      };

      prompt = { margin = mkLiteral "0px 1em 0em 0em"; };

      listview = {
        padding = mkLiteral "8px";
        border-radius = mkLiteral "0px 0px 6px 6px";
        border-color = mkLiteral "@nord10";
        border = mkLiteral "0px 1px 1px 1px";
        background-color = mkLiteral "rgba(46,52,64,0.9)";
        dynamic = mkLiteral "false";
      };

      element = {
        padding = mkLiteral "3px";
        vertical-align = mkLiteral "0.5";
        border-radius = mkLiteral "4px";
        background-color = mkLiteral "transparent";
        color = mkLiteral "@foreground";
        text-color = mkLiteral "rgb(216, 222, 233)";
      };

      "element selected.normal" = {
        background-color = mkLiteral "@nord7";
        text-color = mkLiteral "#2e3440";
      };

      "element-text, element-icon" = {
        background-color = mkLiteral "inherit";
        text-color = mkLiteral "inherit";
      };

      button = {
        padding = mkLiteral "6px";
        color = mkLiteral "@foreground";
        horizontal-align = mkLiteral "0.5";

        border = mkLiteral "2px 0px 2px 2px";
        border-radius = mkLiteral "4px 0px 0px 4px";
        border-color = mkLiteral "@foreground";
      };

      "button selected normal" = {
        border = mkLiteral "2px 0px 2px 2px";
        border-color = mkLiteral "@foreground";
      };

    };
  };

  programs.helix = {
    enable = true;
    settings = { theme = "nord"; };
    themes = {
      nord = {
        inherits = "nord";
        "ui.background" = "none";
      };
    };
  };

  services.dunst = {
    enable = true;
    settings = {
      global = {
        frame_color = "#ECEFF4";
        separator_color = "#ECEFF4";
        corner_radius = "10";
        gap_size = "15";
        frame_width = "1";
        origin = "top-right";
        offset = "20x20";
      };

      base16_low = {
        msg_urgency = "low";
        background = "#3b4252a0";
      };

      base16_normal = {
        msg_urgency = "normal";
        background = "#4C566AA0";
      };

      base16_critical = {
        msg_urgency = "critical";
        background = "#bf616aa0";
      };
    };
  };

  programs.btop = {
    enable = true;
    settings = {
      color_theme = "Default";
      theme_background = false;
    };
  };

  gtk = {
    enable = true;
    cursorTheme.name = "Nordic-cursors";
    cursorTheme.package = pkgs.nordic;
    iconTheme.name = "Vimix";
    iconTheme.package = pkgs.vimix-icon-theme;
    theme.name = "Nordic";
    theme.package = pkgs.nordic;
  };

}
