{ config, ... }:
{
  virtualisation.docker = {
  	enable = true;
	package = pkgs.docker_29;

	daemon.settings = {
		dns = [
			"1.1.1.1"
			"8.8.8.8"
		];
	};

	rootless.enable = true;
	rootless.setSocketVariable = true;
  };
}
