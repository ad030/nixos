{
  fileSystems."/srv/media/tank" = {
    device = "tank";
    fsType = "zfs";
  };

  fileSystems."/srv/media/wd-blue-1tb" = {
    device = "/dev/disk/by-uuid/35EFA427397E8837";
    fsType = "ntfs3";
  };

  systemd.tmpfiles.settings."mount-tank" = {
    "/srv/media/tank" = {
      d = {
        user = "root";
        group = "media";
        mode = "2775";
      };
      # ensure media group gets rwx permissions
      "a+media-perms" = {
        type = "a+";
        argument = "group:media:rwX,default:group:media:rwX";
      };
      # acl default permissions
      "a+default-perms" = {
        type = "a+";
        argument = "d:user::rwX,d:group::rwX,d:other::r-X";
      };
    };
  };
}
