{
  config,
  ...
}:
{
  services.nfs.server.enable = true;

  fileSystems."/export/tank" = {
    depends = [
      "/srv/media/tank"
    ];

    device = "/srv/media/tank";

    fsType = "none";
    options = [ "bind" ];
  };

  systemd.tmpfiles.settings."export-tank" = {
    "/export/tank" = {
      d = {
        user = "root";
        group = "media";
        mode = "2775";
      };
      # ensure media group gets rwx permissions
      "a+media-perms" = {
        type = "a";
        argument = "group:media:rwX";
      };
      # default permissions
      "a+default-perms" = {
        type = "a";
        argument = "d:user::rwX,d:group::rwX,d:other::r-X";
      };
    };
  };

  services.nfs.server.exports = ''
    /export  192.168.8.0/24(ro,fsid=0,no_subtree_check)
    /export/tank 192.168.8.0/24(rw,nohide,no_subtree_check,root_squash)
  '';
}
