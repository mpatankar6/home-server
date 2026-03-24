{ pkgs, ... }:

{
  imports = [
    ./adguardhome.nix
    ./hardware-configuration.nix
  ];
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos-server";
  networking.networkmanager.enable = true;

  services.openssh.enable = true;
  services.logind.settings.Login.HandleLidSwitch = "ignore";

  programs.fish = {
    enable = true;
    interactiveShellInit = "set -g fish_greeting";
  };

  users.users.mihir = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.fish;
    packages = with pkgs; [
      dig
      fastfetch
      gh
      git
      lsof
      vim
    ];
  };

  security.sudo.wheelNeedsPassword = false;
  time.timeZone = "America/New_York";
  system.stateVersion = "25.11";
}
