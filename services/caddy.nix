{
  services.caddy = {
    enable = true;
    virtualHosts."adguard.home.arpa" = {
      extraConfig = ''
        reverse_proxy localhost:3000
        tls internal
      '';
    };
  };
  networking.firewall.allowedTCPPorts = [
    80
    443
  ];
}
