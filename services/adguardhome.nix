{
  services.adguardhome = {
    enable = true;
    settings = {
      dns = {
        upstream_dns = [
          "1.1.1.1"
          "1.0.0.1"
        ];
      };
      filtering.rewrites =
        map
          (domain: {
            inherit domain;
            # Assuming there is a static DHCP lease, this should never change.
            answer = "192.168.1.90";
            enabled = true;
          })
          [
            "adguard.home.arpa"
            "transmission.home.arpa"
            "prowlarr.home.arpa"
            "radarr.home.arpa"
            "sonarr.home.arpa"
            "bazarr.home.arpa"
            "jellyfin.home.arpa"
            "seerr.home.arpa"
          ];
    };
  };
  networking.firewall = {
    allowedTCPPorts = [ 53 ];
    allowedUDPPorts = [ 53 ];
  };
}
