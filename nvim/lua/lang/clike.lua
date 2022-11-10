local capabilities = require("cmp_nvim_lsp").default_capabilities()

return {
  on_setup = function(server, keymaps)
    server.setup({
      single_file_support = true,
      capabilities = capabilities,
      on_attach = function(_, bufnr)
        --[[ client.server_capabilities.document_formatting = false ]]
        --[[ client.server_capabilities.document_range_formatting = false ]]
        keymaps(bufnr)
      end,
    })
  end
}
