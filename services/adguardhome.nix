let
  # Assuming there is a static DHCP lease, this should never change.
  local-ip = "192.168.1.90";
in
{
  services.adguardhome = {
    enable = true;
    openFirewall = true;
    settings = {
      dns = {
        upstream_dns = [
          "1.1.1.1"
          "1.0.0.1"
        ];
        rewrites = [
          {
            domain = "adguard.home";
            answer = local-ip;
          }
        ];
      };
    };
  };
}
