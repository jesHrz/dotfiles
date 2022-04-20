local status, treesitter = pcall(require, "nvim-treesitter.configs")

if not status then
  vim.notify("plugin nvim-treesitter not found")
end

treesitter.setup({
  ensure_installed = {"c", "cpp", "rust", "bash", "lua", "python"},
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lens = nil,
  }
})
