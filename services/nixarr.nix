{
  services.prowlarr.settings.auth.required = "DisabledForLocalAddresses";
  services.radarr.settings.auth.required = "DisabledForLocalAddresses";
  services.sonarr.settings.auth.required = "DisabledForLocalAddresses";
  nixarr = {
    enable = true;
    mediaDir = "/data/media";
    stateDir = "/data/media/.state/nixarr";

    jellyfin.enable = true;
    seerr.enable = true;

    transmission = {
      enable = true;
      peerPort = 50005;
      extraSettings = {
        rpc-host-whitelist-enabled = false;
      };
    };

    prowlarr = {
      enable = true;
      settings-sync = {
        enable-nixarr-apps = true;
        indexers = [
          {
            sort_name = "cinemaz";
            name = "CinemaZ";
            fields = {
              username.secret = "/data/.secret/cinemaz-username";
              password.secret = "/data/.secret/cinemaz-password";
              pid.secret = "/data/.secret/cinemaz-pid";
            };
          }
        ];
      };
    };

    sonarr = {
      enable = true;
      settings-sync = {
        transmission.enable = true;
      };
    };

    radarr = {
      enable = true;
      settings-sync = {
        transmission.enable = true;
      };
    };

    bazarr = {
      enable = true;
      settings-sync = {
        sonarr.enable = true;
        sonarr.config = {
          sync_only_monitored_series = true;
          sync_only_monitored_episodes = true;
        };
        radarr.enable = true;
        radarr.config = {
          sync_only_monitored_movies = true;
        };
      };
    };
  };
}
