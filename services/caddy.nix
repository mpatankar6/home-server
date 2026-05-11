let
  mkProxy = port: {
    extraConfig = ''
      reverse_proxy localhost:${toString port}
    '';
  };
in
{
  services.caddy = {
    enable = true;
    virtualHosts = {
      "http://adguard.home.arpa" = mkProxy 3000;
      "http://transmission.home.arpa" = mkProxy 9091;
      "http://prowlarr.home.arpa" = mkProxy 9696;
      "http://radarr.home.arpa" = mkProxy 7878;
      "http://sonarr.home.arpa" = mkProxy 8989;
      "http://bazarr.home.arpa" = mkProxy 6767;
      "http://jellyfin.home.arpa" = mkProxy 8096;
      "http://seerr.home.arpa" = mkProxy 5055;
    };
  };
  networking.firewall.allowedTCPPorts = [
    80
    443
  ];
}
