-- Global variables for luakit

local globals = {
    homepage            = "luakit://newtab/",
    scroll_step         = 40,
    zoom_step           = 0.1,
    max_cmd_history     = 100,
    max_srch_history    = 100,
    default_window_size = "800x600",
    vertical_tab_width  = 200,
    default_zoom_level  = 100,
}

-- List of search engines. Each item must contain a single %s which is
-- replaced by URI encoded search terms. All other occurances of the percent
-- character (%) may need to be escaped by placing another % before or after
-- it to avoid collisions with lua's string.format characters.
-- See: http://www.lua.org/manual/5.1/manual.html#pdf-string.format
globals.search_engines = {
    h = "https://github.com/search?q=%s",
    g = "https://www.google.com/search?q=%s",
    i = "https://www.google.com/images?q=%s",
}

-- Set google as fallback search engine
globals.search_engines.default = globals.search_engines.g
-- Use this instead to disable auto-searching
--search_engines.default = "%s"

-- Per-domain webview properties
-- https://webkitgtk.org/reference/webkit2gtk/stable/WebKitWebView.html
-- https://webkitgtk.org/reference/webkit2gtk/stable/WebKitSettings.html
globals.domain_props = {
    ["all"] = {
        default_font_family        = "Migu 1C",
        sans_serif_font_family     = "Migu 1C",
        serif_font_family          = "Migu 1C",
        monospace_font_family      = "Migu 1M",
        cursive_font_family        = "Migu 1C",
        fantasy_font_family        = "Migu 1C",
        pictograph_font_family     = "Migu 1C",
        default_font_size          = 16,
        enable_webgl               = true,
        -- enable_scripts          = false,
        -- enable_plugins          = false,
        -- zoom_text_only          = true,
    }, --[[
    ["youtube.com"] = {
        enable_scripts = true,
        enable_plugins = true,
    }, ]]
}

-- Cookie acceptance policy
-- Acceptable values: "always", "never", "no_third_party"
soup.accept_policy = "no_third_party"

-- Cookie storage location
-- Remove this line or set to nil to disable cookie persistence
soup.cookies_storage = luakit.data_dir .. "/cookies.db"

return globals

-- vim: et:sw=4:ts=8:sts=4:tw=80
