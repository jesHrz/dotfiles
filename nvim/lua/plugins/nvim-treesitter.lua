local status, treesitter = pcall(require, "nvim-treesitter.configs")

if not status then
  vim.notify("plugin nvim-treesitter not found")
  return
end

treesitter.setup({
  ensure_installed = {"c", "cpp", "rust", "bash", "lua", "python"},
  highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
    disable = {}
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lens = nil,
  }
})
