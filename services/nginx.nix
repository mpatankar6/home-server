{
  services.nginx = {
    enable = true;
    virtualHosts = {
      "adguard.home.arpa".locations."/" = {
        proxyPass = "http://127.0.0.1:3000";
        proxyWebsockets = true;
      };
    };
  };

  networking.firewall.allowedTCPPorts = [ 80 ];
}
