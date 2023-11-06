local capabilities = require("cmp_nvim_lsp").default_capabilities()


require("lspconfig")["lua_ls"].setup({
    capabilities = capabilities,
    settings = { Lua = { diagnostics = { globals = { "vim", "use" } } } },
})
require("lspconfig")["pyright"].setup({
    capabilities = capabilities,
    handlers = { ["textDocument/publishDiagnostics"] = function() end },
})
require("lspconfig")["bashls"].setup({})
require("lspconfig")["rust_analyzer"].setup({})
require("lspconfig")["fsautocomplete"].setup({ capabilities = capabilities })

require("lsp.b-null-ls").setup()
