{
  pkgs,
  inputs,
  ...
}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    userSettings = {
      "editor.cursorBlinking" = "expand";
      "editor.cursorSmoothCaretAnimation" = "on";
      "editor.cursorStyle" = "line";
      "editor.fontFamily" = "JetbrainsMono nerd font";
      "editor.fontSize" = 16;
      "editor.lineHeight" = 2.3;
      "editor.minimap.enabled" = false;
      "editor.mouseWheelZoom" = false;
      "tabnine.experimentalAutoImports" = true;
      "terminal.integrated.fontFamily" = "JetbrainsMono nerd font";
      "terminal.integrated.fontSize" = 16;
      "window.menuBarVisibility" = "hidden";
      "window.zoomLevel" = 0.3;
      "workbench.colorTheme" = "Wal";
      "workbench.iconTheme" = "catppuccin-mocha";
      "workbench.productIconTheme" = "material-product-icons";
      "workbench.sideBar.location" = "left";
      "workbench.startupEditor" = "none";
      "workbench.statusBar.visible" = false;
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nil";
    };
    keybindings = [
      {
        "key" = "ctrl+shift+i";
        "command" = "editor.action.formatDocument";
        "when" = "editorHasDocumentFormattingProvider && editorTextFocus && !editorReadonly && !inCompositeEditor";
      }
    ];
    extensions = with pkgs.vscode-extensions;
      [
        kamadorueda.alejandra
        bbenoist.nix
        jnoortheen.nix-ide
        pkief.material-product-icons
        catppuccin.catppuccin-vsc-icons
        tabnine.tabnine-vscode
        ms-python.python
      ]
      ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          publisher = "dlasagno";
          name = "wal-theme";
          version = "1.1.2";
          sha256 = "vO9FjzA3+5VTgnBY12eawPCfDzKap07Tgf5jqz/IgN0=";
        }
      ];
  };
  home.packages = with pkgs; [
    inputs.alejandra.defaultPackage.${system}
  ];
}