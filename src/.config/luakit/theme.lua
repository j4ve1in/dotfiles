-- color
local color = {}
color.white      = '#fff'
color.black      = '#000'
color.lightblack = '#292929'
color.blue       = '#00008b'
color.darkblue   = '#22254a'
color.lightblue  = '#5FAFFF'
color.cyan       = '#33AADD'
color.red        = '#F00'
color.gray       = '#888'
color.darkgray   = '#444'
color.lightgray  = '#ddd'
color.purple     = '#3d295b'

-- Base
local theme = {}
theme.font       = "Noto Sans CJK JP 14"
theme.fg         = color.white
theme.bg         = color.black
theme.success_fg = color.darkblue
theme.loaded_fg  = color.cyan
theme.error_fg   = color.white
theme.error_bg   = color.red

-- Warning
theme.warning_fg = color.red
theme.warning_bg = color.white

-- Notification
theme.notif_fg = color.white
theme.notif_bg = color.black

-- Menu
theme.menu_fg                   = color.white
theme.menu_bg                   = color.black
theme.menu_selected_fg          = color.white
theme.menu_selected_bg          = color.blue
theme.menu_title_bg             = color.black
theme.menu_primary_title_fg     = color.white
theme.menu_secondary_title_fg   = color.white
theme.menu_disabled_fg          = color.lightgray
theme.menu_disabled_bg          = theme.menu_bg
theme.menu_enabled_fg           = theme.menu_fg
theme.menu_enabled_bg           = theme.menu_bg
theme.menu_active_fg            = color.blue
theme.menu_active_bg            = theme.menu_bg

-- Proxy manager
theme.proxy_active_menu_fg      = color.black
theme.proxy_active_menu_bg      = color.white
theme.proxy_inactive_menu_fg    = color.gray
theme.proxy_inactive_menu_bg    = color.white

-- Statusbar specific
theme.sbar_fg         = color.white
theme.sbar_bg         = color.black

-- Downloadbar specific
theme.dbar_fg         = color.white
theme.dbar_bg         = color.black
theme.dbar_error_fg   = color.red

-- Input bar specific
theme.ibar_fg           = color.white
theme.ibar_bg           = color.black

-- Tab label
theme.tab_fg            = color.gray
theme.tab_bg            = color.black
theme.tab_hover_bg      = color.lightblack
theme.tab_ntheme        = color.lightgray
theme.selected_fg       = color.white
theme.selected_bg       = color.black
theme.selected_ntheme   = color.lightgray
theme.loading_fg        = color.cyan
theme.loading_bg        = color.black

theme.selected_private_tab_bg = color.purple
theme.private_tab_bg    = color.darkblue

-- Trusted/untrusted ssl
theme.trust_fg          = color.lightblue
theme.notrust_fg        = color.red

-- General colour pairings
theme.ok = { fg = color.white, bg = color.black }
theme.warn = { fg = color.red, bg = color.white }
theme.error = { fg = color.white, bg = color.red }

return theme

-- vim: et:sw=4:ts=8:sts=4:tw=80
