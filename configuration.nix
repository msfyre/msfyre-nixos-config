{ config, pkgs, lib, ... }:
{
  boot.loader.grub.enable = true;
  boot.loader.generic-extlinux-compatible.enable = true;

  boot.kernelPackages = pkgs.linuxPackages_rpi;

  services.displayManager.sddm = {
  	enable = true;
	wayland.enable = true;
  };

  networking.hostName = "msfyre-nixos-server";
  
  imports = [ ./hardware-configuration.nix ];

  programs.hyprland.enable = true;
  
  environment.systemPackages = [
  	pkgs.kitty,
	inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default,
  ];

  inputs = {
  	noctalia = {
		url = "github:noctalia-dev/noctalia";
	}
  }

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
