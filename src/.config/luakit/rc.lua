-- luakit configuration file

require "lfs"

if unique then
    unique.new("org.luakit")
    -- Check for a running luakit instance
    if unique.is_running() then
        if uris[1] then
            for _, uri in ipairs(uris) do
                if lfs.attributes(uri) then uri = os.abspath(uri) end
                unique.send_message("tabopen " .. uri)
            end
        else
            unique.send_message("winopen")
        end
        luakit.quit()
    end
end

-- Set the number of web processes to use. A value of 0 means 'no limit'.
luakit.process_limit = 4

-- Load library of useful functions for luakit
local lousy = require "lousy"

-- Load users global config
-- ("$XDG_CONFIG_HOME/luakit/globals.lua" or "/etc/xdg/luakit/globals.lua")
require "globals"

-- Load users theme
-- ("$XDG_CONFIG_HOME/luakit/theme.lua" or "/etc/xdg/luakit/theme.lua")
lousy.theme.init(lousy.util.find_config("theme.lua"))
assert(lousy.theme.get(), "failed to load theme")

-- Load users window class
-- ("$XDG_CONFIG_HOME/luakit/window.lua" or "/etc/xdg/luakit/window.lua")
local window = require "window"

-- Load users webview class
-- ("$XDG_CONFIG_HOME/luakit/webview.lua" or "/etc/xdg/luakit/webview.lua")
local webview = require "webview"

window.add_signal("build", function (w)
    local widgets, l, r = require "lousy.widget", w.sbar.l, w.sbar.r

    -- Left-aligned status bar widgets
    l.layout:pack(widgets.uri())
    l.layout:pack(widgets.hist())
    l.layout:pack(widgets.progress())

    -- Right-aligned status bar widgets
    r.layout:pack(widgets.buf())
    r.layout:pack(widgets.ssl())
    r.layout:pack(widgets.tabi())
    r.layout:pack(widgets.scroll())
end)

-- Load users mode configuration
-- ("$XDG_CONFIG_HOME/luakit/modes.lua" or "/etc/xdg/luakit/modes.lua")
require "modes"

-- Load users keybindings
-- ("$XDG_CONFIG_HOME/luakit/binds.lua" or "/etc/xdg/luakit/binds.lua")
require "binds"

----------------------------------
-- Optional user script loading --
----------------------------------

require "adblock"
require "adblock_chrome"
require "webinspector"
require "formfiller"
require "proxy"
require "quickmarks"
require "undoclose"
require "tabhistory"
require "userscripts"
require "bookmarks"
require "bookmarks_chrome"
require "viewpdf"
require "cmdhist"
require "search"
require "taborder"
require "history"
require "history_chrome"
require "help_chrome"
require "introspector_chrome"
require "open_editor"
require "noscript"
require "follow_selected"
require "go_input"
require "go_next_prev"
require "go_up"
require "error_page"
require "domain_props"
require "image_css"
require "newtab_chrome"
require "tab_favicons"
require "view_source"

require_web_module("referer_control_wm")

-- Add session saving/loading support
local session = require "session"

-- Set download location
local downloads = require "downloads"
require "downloads_chrome"
downloads.default_dir = os.getenv("HOME") .. "/Downloads"
downloads.add_signal("download-location", function (uri, file)
    if not file or file == "" then
        file = (string.match(uri, "/([^/]+)$")
            or string.match(uri, "^%w+://(.+)")
            or string.gsub(uri, "/", "_")
            or "untitled")
    end
    return downloads.default_dir .. "/" .. file
end)

-- Example using xdg-open for opening downloads / showing download folders
downloads.add_signal("open-file", function (file)
    luakit.spawn(string.format("xdg-open %q", file))
    return true
end)

-- Add vimperator-like link hinting & following
local select = require "select"
select.label_maker = function (s)
    return s.sort(s.reverse(s.charset("asdfghjkl;")))
end

local follow = require "follow"
follow.stylesheet = follow.stylesheet .. [===[
  #luakit_select_overlay {
      position: absolute;
      left: 0;
      top: 0;
      z-index: 2147483647; /* Maximum allowable on WebKit */
  }
  #luakit_select_overlay .hint_overlay {
      display: block;
      position: absolute;
      background-color: transparent;
      border: 1px none #000;
      opacity: 0.3;
  }
  #luakit_select_overlay .hint_label {
    display: block;
    position: absolute;
    background-color: #1b1d1e;
    border: 1px solid #0000ff;
    border-radius: 2px;
    color: #ddd;
    font-size: 11px;
    font-weight: 700;
    box-shadow: 2px 2px 1px rgba(0,0,0,0.25);
    padding: 0.8px;
    opacity: 1;
    text-transform: uppercase;
  }
  #luakit_select_overlay .hint_overlay_body {
      background-color: #ff0000;
  }
  #luakit_select_overlay .hint_selected {
      background-color: blue !important;
  }
]===]

local completion = require "completion"
completion.order = {
    completion.funcs.command,
    completion.funcs.bookmarks,
    completion.funcs.history,
}

-----------------------------
-- End user script loading --
-----------------------------

-- Restore last saved session
local w = (not luakit.nounique) and (session and session.restore())
if w then
    for i, uri in ipairs(uris) do
        w:new_tab(uri, { switch = i == 1 })
    end
else
    -- Or open new window
    window.new(uris)
end

-------------------------------------------
-- Open URIs from other luakit instances --
-------------------------------------------

if unique then
    unique.add_signal("message", function (msg, screen)
        local cmd, arg = string.match(msg, "^(%S+)%s*(.*)")
        local ww = lousy.util.table.values(window.bywidget)[1]
        if cmd == "tabopen" then
            ww:new_tab(arg)
        elseif cmd == "winopen" then
            ww = window.new((arg ~= "") and { arg } or {})
        end
        ww.win.screen = screen
        ww.win.urgency_hint = true
    end)
end

-- vim: et:sw=4:ts=8:sts=4:tw=80
