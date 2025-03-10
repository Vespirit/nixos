{ config, pkgs, ... }:
{
  programs = {
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
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
    dconf.enable = true;
    seahorse.enable = true;
    fuse.userAllowOther = true;
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
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
    kitty
    rofi-wayland
  ];
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
  };
}
