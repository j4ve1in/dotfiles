function fish_prompt
  set_color '#767676'
  printf (prompt_pwd)

  set git_prompt (__fish_git_prompt)
  if test ! -z "$git_prompt"
    set git_glyph \ue0a0
    set_color '#767676'
    printf " $git_glyph"(__fish_git_prompt | sed 's/[()]//g')
  end

  set prompt_glyph \u25b6
  set_color '#005FFF'
  printf "\n$prompt_glyph$prompt_glyph$prompt_glyph "
  set_color normal
end
