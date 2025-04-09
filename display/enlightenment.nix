{ pkgs, ... }:
{
  services.xserver = {
    enable = true;
    displayManager = {
      autoLogin.enable = true;
      autoLogin.user = "ves";
      lightdm.enable = true;
      lightdm.greeters.gtk.enable = true;
      defaultSession = "enlightenment";
    };
    desktopManager.enlightenment.enable = true;
  };
  environment.systemPackages = with pkgs; [
    kitty
  ];
}
