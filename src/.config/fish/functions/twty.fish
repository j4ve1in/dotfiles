function twty
  trap 'rm -f ~/.config/twty/settings.json >/dev/null ^/dev/null' SIGINT
  cat ~/.config/twty/settings.json.tpl | \
    envchain ytet5uy4/twitter envsubst >~/.config/twty/settings.json
  command twty $argv
  rm -f ~/.config/twty/settings.json >/dev/null ^/dev/null
end
