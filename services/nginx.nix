{
  services.nginx = {
    enable = true;
    virtualHosts = {
      "adguard.home" = {
        proxyPass = "http://127.0.0.1:3000";
      };
    };
  };

  networking.firewall.allowedTCPPorts = [ 80 ];
}
