{
  services.adguardhome = {
    enable = true;

    port = 3000;
    openFirewall = true;

    settings = {
      dns = {
        bind_hosts = [ "0.0.0.0" ];
        port = 53;
      };
    };
  };
}
