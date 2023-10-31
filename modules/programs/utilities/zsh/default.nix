{ pkgs, ... }: {
  environment.shells = with pkgs; [ zsh ];
  environment.pathsToLink = [ "/share/zsh" ];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh = {
    enable = true;
    loginShellInit = ''
       if [[ "$(tty)" == "/dev/tty1" ]]
       then
        # Hyprland
        startx
      fi
    '';
  };
  home-manager.users.xenoxanite.programs = {
    zsh = {
      enable = true;
      autocd = true;
      enableAutosuggestions = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
      oh-my-zsh.enable = true;
      shellAliases = {
        nrs = "sudo nixos-rebuild switch --flake /home/xenoxanite/Flakes";
        ncg =
          "nix-collect-garbage -d && sudo nix-collect-garbage -d && sudo rm /nix/var/nix/gcroots/auto/*";
        lsa = "eza -l --icons";
        cat = "bat -p";
        record =
          "wf-recorder --audio=alsa_output.pci-0000_08_00.6.analog-stereo.monitor -f $HOME/Videos/$(date +'%Y%m%d%H%M%S_1.mp4')";
      };
    };
    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
