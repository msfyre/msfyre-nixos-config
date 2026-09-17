{ config, pkgs, lib, ... }:
{
  boot.loader.grub.enable = true;
  boot.loader.generic-extlinux-compatible.enable = true;
 
  boot.kernelPackages = pkgs.linuxPackages_rpi;
  
  imports = [ ./hardware-configuration.nix ];
}
