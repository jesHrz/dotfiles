local wezterm = require('wezterm')
local gpu_adapters = require('utils.gpu_adapters')
local colors = require('colors.dracula')

local font = "JetBrainsMono NF"
local font_size = 12

-- -- get the current run programs for display on tab bar
-- -- Equivalent to POSIX basename(3)
-- -- Given "/foo/bar" returns "bar"
-- -- Given "c:\\foo\\bar" returns "bar"
-- function Basename(s)
--     return string.gsub(s, "(.*[/\\])(.*)", "%2")
-- end

-- wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
--     local pane = tab.active_pane
--     local title = Basename(pane.foreground_process_name)
--     return {{
--         Text = " " .. title .. " "
--     }}
-- end)

return {
    term = "xterm-256color",

    animation_fps = 60,
    max_fps = 60,
    front_end = 'WebGpu',
    webgpu_power_preference = 'HighPerformance',
    webgpu_preferred_adapter = gpu_adapters:pick_best(),

    colors = colors,
    font = wezterm.font(font),
    font_size = font_size,

    enable_scroll_bar = true,
    enable_tab_bar = true,
    use_fancy_tab_bar = false,
    tab_bar_at_bottom = true,
    -- hide_tab_bar_if_only_one_tab = true,
    -- tab_max_width = 24,
    -- show_tab_index_in_tab_bar = false,
    -- switch_to_last_tab_after_closing_current = true,

    -- window_decorations = "INTEGRATED_BUTTONS | RESIZE",
    window_close_confirmation = 'NeverPrompt',
    window_frame = {
        active_titlebar_bg = '#090909',
        -- font = fonts.font,
        -- font_size = fonts.font_size,
    },
    inactive_pane_hsb = {
        hue = 1.0,
        saturation = 1.0,
        brightness = 1.0,
    },

    --ref: https://wezfurlong.org/wezterm/config/lua/config/freetype_pcf_long_family_names.html#why-doesnt-wezterm-use-the-distro-freetype-or-match-its-configuration
    freetype_load_target = "Normal", ---@type 'Normal'|'Light'|'Mono'|'HorizontalLcd'
    freetype_render_target = "Normal", ---@type 'Normal'|'Light'|'Mono'|'HorizontalLcd'
}
