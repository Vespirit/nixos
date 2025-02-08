{ config, pkgs, ... }:
{
  programs.hyprland.enable = true;

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
  ];
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
