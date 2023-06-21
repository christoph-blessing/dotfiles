vim.diagnostic.config({ float = { source = "always" }, virtual_text = { prefix = "💡" } })

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = { "documentation", "detail", "additionalTextEdits" },
}
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

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
