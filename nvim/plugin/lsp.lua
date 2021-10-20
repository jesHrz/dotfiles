local nvim_lsp = require('lspconfig')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {'documentation', 'detail', 'additionalTextEdits'}
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false
    }
)

local servers = {"rust_analyzer", "clangd"}
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        capabilities = capabilities,
        on_attach = function()
            require"lsp_signature".on_attach({
                bind = true,
                use_lspsaga = false,
                floating_window = true,
                fix_pos = true,
                hint_enable = true,
                hi_parameter = "Search",
                handler_opts = {"double"}
            })
        end
    }
end
