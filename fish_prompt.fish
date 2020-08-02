function fish_prompt
  # Cache exit status
  set -l last_status $status

  # Just calculate these once, to save a few cycles when displaying the prompt
  if not set -q __fish_prompt_hostname
    set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
  end

  # Setup colors
  set -l normal (set_color normal)
  set -l white (set_color FFFFFF)
  set -l aubergine (set_color 571845)
  set -l burgundy (set_color 900C3E)
  set -l crimson (set_color C70039)
  set -l orange (set_color FF5733)
  set -l yellow (set_color FFC300)

  # Configure __fish_git_prompt
  set -g __fish_git_prompt_char_stateseparator ' '
  set -g __fish_git_prompt_color FF5733
  set -g __fish_git_prompt_color_flags FF5733
  set -g __fish_git_prompt_color_prefix white
  set -g __fish_git_prompt_color_suffix white
  set -g __fish_git_prompt_showdirtystate true
  set -g __fish_git_prompt_showuntrackedfiles true
  set -g __fish_git_prompt_showstashstate true
  set -g __fish_git_prompt_show_informative_status true

  set -l current_user (whoami)

  # Empty line 1
  echo " "

  # User, host, path and git on line 2
  echo -n $white'╭─'$burgundy$current_user$white' at '$crimson$__fish_prompt_hostname$white' in '$yellow(pwd|sed "s=$HOME=⌁=")$yellow
  __fish_git_prompt " (%s)"
  echo

  # Commands on line 3
  echo -n $white"╰─Δ "$normal
end
