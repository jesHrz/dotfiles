local status, mason = pcall(require, "mason")
if not status then
  vim.notify("plugin mason not found")
  return
end

local status, mason_config = pcall(require, "mason-lspconfig")
if not status then
  vim.notify("plugin mason-lspconfig not found")
  return
end

local status, lspconfig = pcall(require, "lspconfig")
if not status then
  vim.notify("plugin nvim-lspconfig not found")
  return
end

mason.setup()
mason_config.setup({
  ensure_installed = {
    "rust_analyzer",
    "clangd",
    "pyright",
    "bashls",
    "sumneko_lua"
  }
})

local servers = {
  clangd = require("lang.clike"),
  rust_analyzer = require("lang.rust"),
  sumneko_lua = require("lang.lua"),
}

local mapbuf = require("keymaps").mapbuf

local function lsp_keymaps(bufnr)
  -- Without Lspsaga
  -- mapbuf(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
  -- -- code action
  -- mapbuf(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
  -- -- goto xx
  mapbuf(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
  -- mapbuf(bufnr, "n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>")
  -- mapbuf(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
  -- mapbuf(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
  -- mapbuf(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
  -- -- diagnostic
  -- mapbuf(bufnr, "n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>")
  -- mapbuf(bufnr, "n", "d[", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
  -- mapbuf(bufnr, "n", "d]", "<cmd>lua vim.diagnostic.goto_next()<CR>")
  -- -- format
  -- mapbuf(bufnr, "n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>")

  -- Lspsaga enabled
  -- rename
  mapbuf(bufnr, "n", "<leader>rn", "<cmd>Lspsaga rename<CR>")
  -- code action
  mapbuf(bufnr, "n", "<leader>ca", "<cmd>Lspsaga code_action<CR>")
  -- hover
  mapbuf(bufnr, "n", "gh", "<cmd>Lspsaga hover_doc<CR>")
  -- reference
  mapbuf(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
  -- diagnostic
  mapbuf(bufnr, "n", "gp", "<cmd>Lspsaga show_line_diagnostics<CR>")
  mapbuf(bufnr, "n", "d[", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
  mapbuf(bufnr, "n", "d]", "<cmd>Lspsaga diagnostic_jump_next()<CR>")
end

local installed_servers = mason_config.get_installed_servers()

if #installed_servers > 0 then
  for _, name in ipairs(installed_servers) do
    local config = servers[name]
    if config then
      config.on_setup(lspconfig[name], lsp_keymaps)
    else
      lspconfig[name].setup({})
    end
  end
end
