{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
  environment.variables.EDITOR = "nvim";
  home-manager.users.fahim = { pkgs, ... }: {
    imports = [ ./theme.nix ];
    programs.neovim = {
      enable = true;
      defaultEditor = true;
    };
    home.packages = with pkgs; [
      # utilities
      ripgrep
      fd
      neovide

      # language server
      rust-analyzer
      clang-tools
      nil
      lua-language-server
      nodePackages_latest.typescript-language-server
      nodePackages_latest.svelte-language-server

      # formatter
      stylua
      rustfmt
      nixfmt
    ];
    home.sessionVariables = { EDITOR = "nvim"; };
  };
}
