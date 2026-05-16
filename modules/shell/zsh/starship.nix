{ inputs, pkgs, ... }:

{
  home-manager.users.dhanvanth = {
     programs.starship = {
      enable = false;
      enableZshIntegration = true;
      enableFishIntegration = false;	
      settings = {
        format = "$directory$git_branch$git_status$fill$time\n$character";
        directory = {
          format = "[$path]($style)";
          style = "bold cyan";
          truncation_length = 0;
          truncate_to_repo = false;
        };
        fill = {
          symbol = " ";
        };
        time = {
          disabled = false;
          format = "[$time]($style)";
          style = "bold yellow";
          time_format = "%H:%M:%S";
        };
        character = {
          success_symbol = "[❯](bold green) ";
          error_symbol = "[❯](bold red) ";
        };
        git_branch = {
        symbol = "󰊢 ";
        format = " on [$symbol$branch]($style) ";
        style = "bold purple";
        };
        git_status = {
        format = "([\\[$all_status$ahead_behind\\]]($style) )";
        style = "bold red";
        conflicted = "=";
        ahead = "⇡";
        behind = "⇣";
        diverged = "⇕";
        untracked = "?";
        stashed = "$";
        modified = "!";
        staged = "+";
        renamed = "»";
        deleted = "✘";
        };
      };
    };
  };
}
