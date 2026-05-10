{
  services.caddy = {
    enable = true;
    virtualHosts."http://adguard.home.arpa" = {
      extraConfig = ''
        reverse_proxy localhost:3000
      '';
    };
  };
  networking.firewall.allowedTCPPorts = [
    80
    443
  ];
}
