local capabilities = require("cmp_nvim_lsp").default_capabilities()

local on_attach = function(client, bufnr)
	if client.server_capabilities.documentSymbolProvider then
		require("nvim-navic").attach(client, bufnr)
	end
end

require("lspconfig")["lua_ls"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = { Lua = { diagnostics = { globals = { "vim", "use" } } } },
})
require("lspconfig")["pyright"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
	handlers = { ["textDocument/publishDiagnostics"] = function() end },
})
require("lspconfig")["bashls"].setup({})
require("lspconfig")["rust_analyzer"].setup({})
require("lspconfig")["fsautocomplete"].setup({ on_attach = on_attach, capabilities = capabilities })

require("lsp.b-null-ls").setup()
