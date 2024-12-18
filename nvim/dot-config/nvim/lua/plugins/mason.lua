return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "clangd",
      "rust-analyzer",
      "pyright",
      "bash-language-server",
    },
  },
}
