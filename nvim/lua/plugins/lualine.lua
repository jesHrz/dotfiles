local status, lualine = pcall(require, "lualine")

if not status then
  vim.notify("plugin lualine not found")
end

lualine.setup{
  options = {
    icons_enabled = true,
    theme = "auto",
    component_separators = {left = '', right = '' },
    section_separators = { left = '', right = '' },
    -- component_separators = { left = "|", right = "|" },
    -- https://github.com/ryanoasis/powerline-extra-symbols
    -- section_separators = { left = " ", right = "" },
    disabled_filetypes = {},
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {
      'filename',
      {
        "lsp_progress",
        spinner_symbols = { " ", " ", " ", " ", " ", " " },
      }
    },
    lualine_x = {
      'filesize', 
      {
        'fileformat',
        symbols = {
          unix = "LF",
          dos = "CRLF",
          mac = "CR",
        },
      },
      'encoding', 
      'filetype'
    },
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = { "nvim-tree", "toggleterm" },
}
