set fish_greeting
set --global fish_key_bindings fish_hybrid_key_bindings

# color
set fish_color_autosuggestion  '#767676'
set fish_color_cancel          '#767676'
set fish_color_command         normal
set fish_color_comment         '#767676'
set fish_color_end             '#005fd7' --bold
set fish_color_error           '#ff0000'
set fish_color_escape          '#00afff' --bold
set fish_color_history_current --bold
set fish_color_match           --background='#005FFF'
set fish_color_normal          normal
set fish_color_operator        '#00afff'
set fish_color_param           '#00afff'
set fish_color_quote           '#767676'
set fish_color_redirection     '#00afff'
set fish_color_search_match    --background='#005FFF'
set fish_color_valid_path      --underline

set fish_pager_color_description '#767676'
set fish_pager_color_prefix      '#00AFFF' --bold
set fish_pager_color_progress    '#00AFFF'

# prompt
set fish_color_cwd    '#767676'
set fish_color_git    '#767676'
set fish_color_prompt '#005FFF'

# git prompt
set __fish_git_prompt_showdirtystate yes
set __fish_git_prompt_showstashstate yes
set __fish_git_prompt_showupstream   yes

set __fish_git_prompt_color_branch      '#767676'
set __fish_git_prompt_color_dirtystate  '#00FF87'
set __fish_git_prompt_color_stagedstate '#5FAFFF'
set __fish_git_prompt_color_stashstate  '#5FAFFF'

set __fish_git_prompt_char_untrackedfiles  '?'
set __fish_git_prompt_char_stashstate      '╍'
set __fish_git_prompt_char_upstream_ahead  '↑'
set __fish_git_prompt_char_upstream_behind '↓'
set __fish_git_prompt_char_upstream_equal  ''
