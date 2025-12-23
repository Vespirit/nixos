{ pkgs, ... }:
{
  virtualisation = {
    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
  };

  environment.systemPackages = with pkgs; [
  ];

  users.groups.libvirtd.members = [ "ves" ];

  programs.virt-manager.enable = true;
}
