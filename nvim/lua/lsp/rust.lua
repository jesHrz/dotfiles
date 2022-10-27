local status, rust_tools = pcall(require, "rust-tools")

if not status then
  vim.notify("Can not found rust-tools")
end

return {
  on_setup = function(server, keymaps)
    local status
    local opts = {
      --[[ capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()), ]]
      capabilities = require("cmp_nvim_lsp").default_capabilities(),
      flags = {
        debounce_text_changes = 150,
      },
      on_attach = function(client, bufnr)
        --[[ client.resolved_capabilities.document_formatting = false ]]
        --[[ client.resolved_capabilities.document_range_formatting = false ]]
        client.server_capabilities.document_formatting = false
        client.server_capabilities.document_range_formatting = false
        keymaps(bufnr)
      end,
      standalone = true,
    }

    rust_tools.setup({
      server = vim.tbl_deep_extend("force", server:get_default_options(), opts)
    })
    server:attach_buffers()
  end,
}
