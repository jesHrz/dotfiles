return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  opts = {
    ensure_installed = {
      "bash",
      "c",
      "cpp",
      "python",
      "rust",
      "lua",
    },
  },
}
