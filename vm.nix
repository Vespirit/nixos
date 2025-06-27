{ pkgs, ... }:
{
    virtualisation = {
        libvirtd.enable = true;
        spiceUSBRedirection.enable = true;
    };

    users.groups.libvirtd.members = [ "ves" ];

    programs.virt-manager.enable = true;
}
