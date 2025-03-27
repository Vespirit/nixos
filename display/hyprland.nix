{ config, pkgs, ... }:
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
        exo
        thunar-archive-plugin
        thunar-volman
        tumbler
      ];
    };

    xwayland.enable = true;
    seahorse.enable = true;
  };


  services = {
    hypridle.enable = true;
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
    polkit_gnome
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
    xarchiver
    yad
    yt-dlp
  ];
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
  };
}
