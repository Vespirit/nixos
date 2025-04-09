{ pkgs, ... }:
{
  imports = [
    ./nvidia.nix
    ./gaming
    ./hyprland.nix
    ./obs.nix
    ./vesktop.nix
  ];
  hardware.enableRedistributableFirmware = true;

  hardware.graphics = { 
  	enable = true;
  	enable32Bit = true;
  };

  programs = {
    firefox.enable = true;
  };
  
  environment.systemPackages = with pkgs; [
    baobab
    xdg-user-dirs
    xdg-utils
    duf
    spotify
    processing
    yt-dlp
  ];

  # Security / Polkit
  security.polkit.enable = true;
  security.polkit.extraConfig = ''
    polkit.addRule(function(action, subject) {
      if (
        subject.isInGroup("users")
          && (
            action.id == "org.freedesktop.login1.reboot" ||
            action.id == "org.freedesktop.login1.reboot-multiple-sessions" ||
            action.id == "org.freedesktop.login1.power-off" ||
            action.id == "org.freedesktop.login1.power-off-multiple-sessions"
          )
        )
      {
        return polkit.Result.YES;
      }
    })
  '';
} 
