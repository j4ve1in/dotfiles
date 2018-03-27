: "Set prompt" && () {
  setopt prompt_subst
  PROMPT=''
  PROMPT+='`__abyss::prompt::path`'
  PROMPT+='`__abyss::prompt::vcs::git`'
  PROMPT+=$'\n'
  PROMPT+='`__abyss::prompt::symbol`'
}
