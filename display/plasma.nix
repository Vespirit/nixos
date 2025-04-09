{ pkgs, ... }:
{
  services = {
    xserver.enable = true;
    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
      };
      #defaultSession = "plasmax11";
    };
    desktopManager.plasma6.enable = true;
  };
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    plasma-browser-integration
    konsole
    oxygen
    kate
    khelpcenter
    discover
  ];

  environment.systemPackages = with pkgs; [
    kitty
    (mpv.override {scripts = [mpvScripts.mpris];})
    kdePackages.applet-window-buttons6
  ];
}
