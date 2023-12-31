local status, treesitter = pcall(require, "nvim-treesitter.configs")

if not status then
  vim.notify("plugin nvim-treesitter not found")
  return
end

treesitter.setup({
  ensure_installed = {"c", "cpp", "rust", "bash", "lua", "python"},
  highlight = {
    enable = true,
    disable = function(lang, buf)
      local max_filesize = 100 * 1024 -- 100 KB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        return true
      end
    end,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
    disable = {}
  },
  rainbow = {
    enable = true,
    query = "rainbow-parens",
    strategy = require("ts-rainbow").strategy.global,
  }
})
