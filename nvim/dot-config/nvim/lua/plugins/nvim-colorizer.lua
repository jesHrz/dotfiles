return {
  "norcalli/nvim-colorizer.lua",
  config = function()
    require("colorizer").setup({
      "css",
      "javascript",
      "html",
    }, {
      RGB = true, -- #RGB hex codes
      RRGGBB = true, -- #RRGGBB hex codes
      names = true, -- "Name" codes like Blue
      RRGGBBAA = true, -- #RRGGBBAA hex codes
      rgb_fn = true, -- CSS rgb() and rgba() functions
      hsl_fn = true, -- CSS hsl() and hsla() functions
      css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
      css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
      -- Available modes: foreground, background
      mode = "background", -- Set the display mode.
    })
  end,
  vscode = true,
}
-- return {
--   "brenoprata10/nvim-highlight-colors",
--   opts = {
--     ---Render style
--     ---@usage 'background'|'foreground'|'virtual'
--     render = "background",
--
--     ---Set virtual symbol (requires render to be set to 'virtual')
--     virtual_symbol = "■",
--
--     ---Set virtual symbol suffix (defaults to '')
--     virtual_symbol_prefix = "",
--
--     ---Set virtual symbol suffix (defaults to ' ')
--     virtual_symbol_suffix = " ",
--
--     ---Set virtual symbol position()
--     ---@usage 'inline'|'eol'|'eow'
--     ---inline mimics VS Code style
--     ---eol stands for `end of column` - Recommended to set `virtual_symbol_suffix = ''` when used.
--     ---eow stands for `end of word` - Recommended to set `virtual_symbol_prefix = ' ' and virtual_symbol_suffix = ''` when used.
--     virtual_symbol_position = "inline",
--
--     ---Highlight hex colors, e.g. '#FFFFFF'
--     enable_hex = true,
--
--     ---Highlight short hex colors e.g. '#fff'
--     enable_short_hex = true,
--
--     ---Highlight rgb colors, e.g. 'rgb(0 0 0)'
--     enable_rgb = true,
--
--     ---Highlight hsl colors, e.g. 'hsl(150deg 30% 40%)'
--     enable_hsl = true,
--
--     ---Highlight CSS variables, e.g. 'var(--testing-color)'
--     enable_var_usage = false,
--
--     ---Highlight named colors, e.g. 'green'
--     enable_named_colors = false,
--
--     ---Highlight tailwind colors, e.g. 'bg-blue-500'
--     enable_tailwind = true,
--   },
-- }
