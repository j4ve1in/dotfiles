function fish_prompt
  set_color "$fish_color_cwd"
  printf (prompt_pwd)

  set git_prompt (__fish_git_prompt)
  if test ! -z "$git_prompt"
    set git_glyph \ue0a0
    set_color "$fish_color_git"
    printf " $git_glyph"(__fish_git_prompt | sed 's/[()]//g')
  end

  set prompt_glyph \u25b6
  set_color "$fish_color_prompt"
  printf "\n$prompt_glyph$prompt_glyph$prompt_glyph "
  set_color normal
end
