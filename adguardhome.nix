{
  services.adguardhome = {
    enable = true;
    openFirewall = true;
    settings = {
      dns.upstream_dns = [
        "1.1.1.1"
        "1.0.0.1"
      ];
    };
  };
}
