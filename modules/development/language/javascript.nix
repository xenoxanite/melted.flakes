{ pkgs, ... }: {
  home-manager.users.fahim = {
    home.packages = with pkgs; [ nodejs yarn ];
  };
}
