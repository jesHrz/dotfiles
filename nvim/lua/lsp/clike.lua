return {
  on_setup = function(server, keymaps)
    server:setup{
      on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
        keymaps(bufnr)
      end,
    }
  end
}
