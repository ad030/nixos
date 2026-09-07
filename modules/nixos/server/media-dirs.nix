{
  flake.modules.nixos.media-dirs = {
    # create directories where media is mounted at
    systemd.tmpfiles.settings."homelab-dirs" = {
      "/srv/downloads" = {
        d = {
          user = "root";
          group = "root";
          mode = "2755";
        };
        # acl default permissions
        "a+media-perms" = {
          type = "a+";
          argument = "group:media:rwX";
        };
        "a+default-perms" = {
          type = "a+";
          argument = "d:user::rwX,d:group::rwX,d:other:r-X";
        };
      };
      "/srv/media" = {
        d = {
          user = "root";
          group = "root";
          mode = "2755";
        };
        # acl default permissions
        "a+media-perms" = {
          type = "a+";
          argument = "group:media:rwX";
        };
        "a+default-perms" = {
          type = "a+";
          argument = "d:user::rwX,d:group::rwX,d:other:r-X";
        };
      };
    };
  };
}
