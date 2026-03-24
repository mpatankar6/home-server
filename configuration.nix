{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;



services.logind.settings.Login.HandleLidSwitch = "ignore";

	programs.fish = {
enable = true;
interactiveShellInit = "set -g fish_greeting";
}

  users.users.mihir = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.fish;
  };


  environment.systemPackages = with pkgs; [
fastfetch
	vim 
	gh
	git
  ];

   services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  time.timeZone = "America/New_York";
  system.stateVersion = "25.11";

}
