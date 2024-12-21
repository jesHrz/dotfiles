return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "clangd",
      "rust-analyzer",
      "pyright",
      "autopep8",
      "bash-language-server",
    },
  },
}
