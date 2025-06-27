{ pkgs, ... }:
{
  programs = {
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
#(pkgs.waybar.overrideAttrs (oldAttrs: { mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];}))
    waybar.enable = true;
    hyprlock.enable = true;
    nm-applet.indicator = true;

    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-volman
        tumbler
      ];
    };

    xwayland.enable = true;
    seahorse.enable = true;
  };

  powerManagement = {
    enable = true;
    cpuFreqGovernor = "schedutil";
  };

  security.pam.services.swaylock = {
    text = ''
      auth include login
    '';
  };

  services = {
    hypridle.enable = true;
    gnome.gnome-keyring.enable = true;

    # smartmontools
    smartd = {
      enable = false;
      autodetect = true;
    };
    gvfs.enable = true;
    tumbler.enable = true;
    udev.enable = true;
    envfs.enable = true;
    dbus.enable = true;

    fstrim = {
      enable = true;
      interval = "weekly";
    };

    rpcbind.enable = false;
    nfs.server.enable = false;
    blueman.enable = true;
    fwupd.enable = true;
    upower.enable = true;

  };

  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
        command = "${pkgs.hyprland}/bin/Hyprland";
	      user = "ves";
      };
      default_session = initial_session;
    };
  };

  environment.systemPackages = with pkgs; [
    cava
    cliphist
    loupe
    gnome-system-monitor
    grim
    gtk-engine-murrine #for gtk themes
    hyprpolkitagent
    imagemagick 
    inxi
    jq
    kitty
    libsForQt5.qtstyleplugin-kvantum #kvantum
    (mpv.override {scripts = [mpvScripts.mpris];}) # with tray
    networkmanagerapplet
    nwg-displays
    nwg-look
    pamixer
    pavucontrol
    playerctl
    pyprland
    libsForQt5.qt5ct
    kdePackages.qt6ct
    kdePackages.qtwayland
    kdePackages.qtstyleplugin-kvantum #kvantum
    rofi-wayland
    slurp
    swappy
    swaynotificationcenter
    swww
    unzip
    wallust
    wl-clipboard
    wlogout
    wlsunset
    xarchiver
    yad
    yt-dlp
  ];
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
  };
}
