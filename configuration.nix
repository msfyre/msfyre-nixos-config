{ config, pkgs, lib, ... }:
{
  boot.loader.grub.enable = true;
  boot.loader.generic-extlinux-compatible.enable = true;

  boot.kernelPackages = pkgs.linuxPackages_rpi4;

  services.displayManager.sddm = {
  	enable = true;
	wayland.enable = true;
  };


  networking.hostName = "msfyre-nixos-server";
  
  imports = [ ./hardware-configuration.nix ];

  programs.hyprland.enable = true;
  
  environment.systemPackages = [
	pkgs.neovim
	pkgs.git
	pkgs.gh
  ];


  users.users = {
  	administrator = {
		isNormalUser = true;
		home = "/home/admin/";
		description = "Server Administrator";
		extraGroups = [
			"wheel"
		];
	};
  };
}
