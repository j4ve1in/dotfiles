set fish_greeting
set -g fish_key_bindings fish_hybrid_key_bindings

# color
set fish_color_end          '#885ead' '--bold'
set fish_color_search_match 'white' '--background=#005FFF'

set fish_pager_color_description '#767676'
set fish_pager_color_prefix      '#00AFFF' '--bold'
set fish_pager_color_progress    '#00AFFF'

# git prompt
set __fish_git_prompt_showdirtystate yes
set __fish_git_prompt_showstashstate yes
set __fish_git_prompt_showupstream   yes

set __fish_git_prompt_color_branch      '#767676'
set __fish_git_prompt_color_dirtystate  '#00FF87'
set __fish_git_prompt_color_stagedstate '#5FAFFF'
set __fish_git_prompt_color_stashstate  '#5FAFFF'

set __fish_git_prompt_char_untrackedfiles  '?'
set __fish_git_prompt_char_stashstate      \u254d
set __fish_git_prompt_char_upstream_ahead  \u2191
set __fish_git_prompt_char_upstream_behind \u2193
set __fish_git_prompt_char_upstream_equal  ''
