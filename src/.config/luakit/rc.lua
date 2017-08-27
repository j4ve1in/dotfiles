------------------------------------------------------------------------------
-- luakit configuration file, more information at https://luakit.github.io/ --
------------------------------------------------------------------------------

require "lfs"

require "unique_instance"

-- Set the number of web processes to use. A value of 0 means 'no limit'.
luakit.process_limit = 4
-- Set the cookie storage location
soup.cookies_storage = luakit.data_dir .. "/cookies.db"

-- Load library of useful functions for luakit
local lousy = require "lousy"

-- Load users theme
-- ("$XDG_CONFIG_HOME/luakit/theme.lua" or "/etc/xdg/luakit/theme.lua")
lousy.theme.init(lousy.util.find_config("theme.lua"))
assert(lousy.theme.get(), "failed to load theme")

-- Load users window class
-- ("$XDG_CONFIG_HOME/luakit/window.lua" or "/etc/xdg/luakit/window.lua")
local window = require "window"

-- Hide status bar
window.methods.update_sbar_visibility = function (w)
    if w.ibar.prompt_text or w.ibar.input_text then
        w.ibar.ebox:show()
    else
        w.ibar.ebox:hide()
    end
    w.sbar.ebox:hide() w.sbar.hidden = true
end

-- Load users webview class
-- ("$XDG_CONFIG_HOME/luakit/webview.lua" or "/etc/xdg/luakit/webview.lua")
local webview = require "webview"

-- Add luakit;//log/ chrome page
local log_chrome = require "log_chrome"

window.add_signal("build", function (w)
    local widgets, l, r = require "lousy.widget", w.sbar.l, w.sbar.r

    -- Left-aligned status bar widgets
    l.layout:pack(widgets.uri())
    l.layout:pack(widgets.hist())
    l.layout:pack(widgets.progress())

    -- Right-aligned status bar widgets
    r.layout:pack(widgets.buf())
    r.layout:pack(log_chrome.widget())
    r.layout:pack(widgets.ssl())
    r.layout:pack(widgets.tabi())
    r.layout:pack(widgets.scroll())
end)

-- Load luakit binds and modes
local modes = require "modes"
local binds = require "binds"

modes.add_binds("normal", {
    -- Yanking
    { "yy", "Yank current URI to clipboard.", function (w)
        local uri = string.gsub(w.view.uri or "", " ", "%%20")
        luakit.selection.clipboard = uri
        w:notify("Yanked uri: " .. uri)
    end },
    -- Tab
    { "<Control-h>", "Go to previous tab.", function (w) w:prev_tab() end },
    { "<Control-l>", "Go to next tab (or `[count]` nth tab).",
        function (w, _, m)
            if not w:goto_tab(m.count) then w:next_tab() end
    end, {count=0} },
    { "x", "Close current tab (or `[count]` tabs).",
        function (w, m) for _=1,m.count do w:close_tab() end end, {count=1} },
    { "<Control-s>", "Stop loading the current tab.", function (w) w.view:stop() end },
    -- Window
    { "<Control-n>", "Open one or more URLs in a new window.", {
        func = function (w, o) window.new{w:search_open(o.arg)} end,
        format = "{uri}",
    }},
    -- Clipboard
    { "<Control-c>", "Copy",
        function (w) luakit.selection.clipboard = luakit.selection.primary end },
    -- Status bar
    { "gs", "Toggle status bar",
        function (w)
            if true == w.sbar.hidden then
                w.sbar.ebox:show() w.sbar.hidden = false
            else
                w.sbar.ebox:hide() w.sbar.hidden = true
            end
        end},
})
modes.remove_binds("normal", { "y", "Y", "d" })

modes.add_cmds({
    { ":qa[ll]", "Close all window.", function (w, o)
        local force = o.bang
        if not force and not w:can_quit() then return end
        for _, ww in pairs(window.bywidget) do
            ww:close_win(true)
        end
    end },
})

local settings = require "settings"

settings.window.home_page = "luakit://newtab/"
settings.window.search_engines["default"] = "https://www.google.com/search?q=%s"
settings.window.search_engines["i"] = "https://www.google.com/images?q=%s"
settings.window.search_engines["h"] = "https://github.com/search?q=%s"
settings.on["all"].webview.serif_font_family = "Migu 1C"
settings.on["all"].webview.pictograph_font_family = "Migu 1C"
settings.on["all"].webview.fantasy_font_family = "Migu 1C"
settings.on["all"].webview.cursive_font_family = "Migu 1C"
settings.on["all"].webview.default_font_size = 16
settings.on["all"].webview.sans_serif_font_family = "Migu 1C"
settings.on["all"].webview.enable_webgl = true
settings.on["all"].webview.monospace_font_family = "Migu 1M"
settings.on["all"].webview.default_font_family = "Migu 1C"

----------------------------------
-- Optional user script loading --
----------------------------------

local webinspector = require "webinspector"

-- Add uzbl-like form filling
local formfiller = require "formfiller"

-- Add proxy support & manager
local proxy = require "proxy"

-- Add quickmarks support & manager
local quickmarks = require "quickmarks"

-- Add session saving/loading support
local session = require "session"

-- Add command to list closed tabs & bind to open closed tabs
local undoclose = require "undoclose"

-- Add command to list tab history items
local tabhistory = require "tabhistory"

-- Add greasemonkey-like javascript userscript support
local userscripts = require "userscripts"

-- Add bookmarks support
local bookmarks = require "bookmarks"
local bookmarks_chrome = require "bookmarks_chrome"

-- Add download support
local downloads = require "downloads"
local downloads_chrome = require "downloads_chrome"

-- Set download location
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

-- Add automatic PDF downloading and opening
local viewpdf = require "viewpdf"

-- Example using xdg-open for opening downloads / showing download folders
downloads.add_signal("open-file", function (file)
    luakit.spawn(string.format("xdg-open %q", file))
    return true
end)

-- Add vimperator-like link hinting & following
local follow = require "follow"

follow.stylesheet = [===[
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
      font-family: "Migu 1M";
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

local select = require "select"
select.label_maker = function (s)
    return s.sort(s.reverse(s.charset("asdfghjkl;")))
end

-- Add command history
local cmdhist = require "cmdhist"

-- Add search mode & binds
local search = require "search"

-- Add ordering of new tabs
local taborder = require "taborder"

-- Save web history
local history = require "history"
local history_chrome = require "history_chrome"

local help_chrome = require "help_chrome"
local introspector_chrome = require "introspector_chrome"

-- Add command completion
local completion = require "completion"

-- Press Control-E while in insert mode to edit the contents of the currently
-- focused <textarea> or <input> element, using `xdg-open`
local open_editor = require "open_editor"

-- NoScript plugin, toggle scripts and or plugins on a per-domain basis.
-- `,ts` to toggle scripts, `,tp` to toggle plugins, `,tr` to reset.
-- If you use this module, don't use any site-specific `enable_scripts` or
-- `enable_plugins` settings, as these will conflict.
--require "noscript"

local follow_selected = require "follow_selected"
local go_input = require "go_input"
local go_next_prev = require "go_next_prev"
local go_up = require "go_up"

-- Filter Referer HTTP header if page domain does not match Referer domain
require_web_module("referer_control_wm")

local error_page = require "error_page"

-- Add userstyles loader
local styles = require "styles"

-- Hide scrollbars on all pages
local hide_scrollbars = require "hide_scrollbars"

-- Add a stylesheet when showing images
local image_css = require "image_css"

-- Add a new tab page
local newtab_chrome = require "newtab_chrome"

-- Add tab favicons mod
local tab_favicons = require "tab_favicons"

-- Add :view-source command
local view_source = require "view_source"

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

-- vim: et:sw=4:ts=8:sts=4:tw=80
