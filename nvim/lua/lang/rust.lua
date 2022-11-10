local status, rust_tools = pcall(require, "rust-tools")

if not status then
  vim.notify("Can not found rust-tools")
  return
end

return {
  on_setup = function(_, keymaps)
    local opts = {
      capabilities = require("cmp_nvim_lsp").default_capabilities(),
      flags = {
        debounce_text_changes = 150,
      },
      on_attach = function(client, bufnr)
        client.server_capabilities.document_formatting = false
        client.server_capabilities.document_range_formatting = false
        keymaps(bufnr)
      end,
      standalone = true,
    }

    rust_tools.setup({
      server = opts,
    })
  end,
}
