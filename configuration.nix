{ config, pkgs, lib, ... }:
{
  boot.loader.grub.enable = false;
  boot.loader.generic-extlinux-compatible.enable = true;
  boot.kernelPackages = pkgs.linuxPackages_rpi4;

  services.openssh.enable = true;

  networking.hostName = "msfyre-nixos-server";
  networking.networkmanager.enable = true;
  
  imports = [
    ./hardware-configuration.nix
    ./configuration.docker.nix
  ];

  environment.systemPackages = with pkgs; [
	neovim
	git
	gh
  ];

  users.users = {
  	administrator = {
		isNormalUser = true;
		description = "Server Administrator";
		extraGroups = [
			"wheel"
			"docker"
		];
	};
  };

}
