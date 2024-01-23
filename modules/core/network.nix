{ pkgs, lib, ... }:
let
  hosts = pkgs.fetchurl {
    url =
      "https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn-social/hosts";
    hash = "sha256-Ro2zClGV52eqRcr6muwVSHkAGhsSFr4p5zD8rfghnCM=";
  };

in {
  environment.etc."hosts" = { source = lib.mkForce hosts; };
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    nameservers = [ "1.1.1.1" ];
    firewall.enable = false;
  };
}
