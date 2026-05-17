{ inputs, pkgs, ... }:
{
  home-manager.users.dhanvanth = {
    programs.fish = {
      functions = {
        fish_prompt = ''
          set -l last_status $status
          echo ""
          set -l cwd (pwd | string replace -- $HOME '~')
          set -l git_branch (git branch --show-current 2>/dev/null)
          set -l git_status ""
          if test -n "$git_branch"
            set -l untracked (git ls-files --others --exclude-standard 2>/dev/null | wc -l | string trim)
            set -l modified (git diff --name-only 2>/dev/null | wc -l | string trim)
            set -l staged (git diff --cached --name-only 2>/dev/null | wc -l | string trim)
            set -l ahead_behind (git rev-list --left-right --count HEAD...@{upstream} 2>/dev/null)
            set -l status_str ""
            if test $staged -gt 0
              set status_str "$status_str+"
            end
            if test $modified -gt 0
              set status_str "$status_str!"
            end
            if test $untracked -gt 0
              set status_str "$status_str?"
            end
            if test -n "$ahead_behind"
              set -l ahead (string split \t "$ahead_behind")[1]
              set -l behind (string split \t "$ahead_behind")[2]
              if test $ahead -gt 0
                set status_str "$status_str⇡"
              end
              if test $behind -gt 0
                set status_str "$status_str⇣"
              end
            end
            if test -n "$status_str"
              set git_status "[$status_str]"
            end
          end

          set -l time_str (date "+%H:%M:%S")

          # build left side with duration after cwd
          set -l left (set_color cyan)(set_color --bold)"$cwd"(set_color normal)
          if test -n "$duration"
            set left "$left "(set_color brblack)"$CMD_DURATION ms"(set_color normal)
          end
          if test -n "$git_branch"
            set left "$left "(set_color magenta)(set_color --bold)"󰊢 $git_branch"(set_color normal)
            if test -n "$git_status"
              set left "$left "(set_color red)(set_color --bold)"$git_status"(set_color normal)
            end
          end

          set -l right (set_color yellow)(set_color --bold)"$time_str"(set_color normal)

          # calculate lengths
          set -l left_len (string length --visible "$cwd")
          if test -n "$duration"
            set left_len (math $left_len + 1 + $duration_len)
          end
          if test -n "$git_branch"
            set left_len (math $left_len + (string length --visible " 󰊢 $git_branch"))
            if test -n "$git_status"
              set left_len (math $left_len + (string length --visible " $git_status"))
            end
          end
          set -l right_len (string length --visible "$time_str")
          set -l fill_len (math $COLUMNS - $left_len - $right_len)
          set -l fill (string repeat -n $fill_len " ")

          echo -n $left$fill$right
          echo ""
          if test $last_status -eq 0
            echo -n (set_color green)(set_color --bold)"  "(set_color normal)
          else
            echo -n (set_color red)(set_color --bold)"  "(set_color normal)
          end
        '';
      };
    };
  };
}
