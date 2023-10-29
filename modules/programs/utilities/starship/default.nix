{
  home-manager.users.xenoxanite = {
    programs.starship = {
      enable = true;
      settings = {
        scan_timeout = 10;
        add_newline = false;
        line_break.disabled = true;
        cmd_duration.disabled = true;

        format = "$directory$git_branch$status\n$character";

        right_format = "$status";

        character = {
          success_symbol = "[󰧂](#1161cb)";
          error_symbol = "[󰧂](#c01c28)";
          vimcmd_symbol = "[󰧀](#8ff0a4)";
        };

        directory = {
          format = "[$path]($style)( [$read_only]($read_only_style)) ";
          style = "#9a9996";
          disabled = false;
        };
        time = {
          format = "[$time]($style)";
          style = "#9a9996";
          disabled = false;
        };

        status = {
          format = "[$symbol]($style)";
          symbol = "[](red)";
          success_symbol = "[](green)";
          disabled = true;
        };

        git_branch = {
          style = "purple";
          symbol = "";
        };

        git_metrics = {
          disabled = false;
          added_style = "bold yellow";
          deleted_style = "bold red";
        };

        aws.symbol = "  ";
        conda.symbol = " ";
        dart.symbol = " ";
        directory.read_only = " ";
        docker_context.symbol = " ";
        elixir.symbol = " ";
        elm.symbol = " ";
        gcloud.symbol = " ";
        golang.symbol = " ";
        java.symbol = " ";
        julia.symbol = " ";
        lua.symbol = " ";
        memory_usage.symbol = " ";
        nim.symbol = " ";
        nix_shell.symbol = " ";
        nodejs.symbol = " ";
        package.symbol = " ";
        perl.symbol = " ";
        php.symbol = " ";
        python.symbol = " ";
        ruby.symbol = " ";
        rust.symbol = " ";
        scala.symbol = " ";
        swift.symbol = "ﯣ ";
        terraform.symbol = "行 ";
      };
    };
  };
}
