{ pkgs, ... }:

{
  imports = [
    ./services
    ./hardware-configuration.nix
  ];
  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    trusted-users = [
      "root"
      "mihir"
    ];
  };

  boot.loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot.enable = true;
  };

  networking = {
    hostName = "nixos-server";
    networkmanager.enable = true;
  };

  services = {
    logind.settings.Login.HandleLidSwitch = "ignore";
    openssh.enable = true;
  };

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
