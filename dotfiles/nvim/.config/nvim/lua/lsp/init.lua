local on_attach = function(client, bufnr)
	if client.supports_method("textDocument/documentHighlight") then
		local augroup = vim.api.nvim_create_augroup("LspDocumentHighlight", {})
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd(
			"CursorHold",
			{ group = augroup, buffer = bufnr, callback = vim.lsp.buf.document_highlight }
		)
		vim.api.nvim_create_autocmd(
			"CursorHoldI",
			{ group = augroup, buffer = bufnr, callback = vim.lsp.buf.document_highlight }
		)
		vim.api.nvim_create_autocmd(
			"CursorMoved",
			{ group = augroup, buffer = bufnr, callback = vim.lsp.buf.clear_references }
		)
		vim.api.nvim_set_hl(0, "LspReferenceRead", { fg = "#282828", bg = "#fabd2f", reverse = false })
		vim.api.nvim_set_hl(0, "LspReferenceText", { fg = "#282828", bg = "#b8bb26", reverse = false })
		vim.api.nvim_set_hl(0, "LspReferenceWrite", { fg = "#282828", bg = "#83a598", reverse = false })
	end
end

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
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local lsp_installer = require("nvim-lsp-installer")

lsp_installer.on_server_ready(function(server)
	local config = require("lsp.configs." .. server.name)
	config.on_attach = on_attach
	config.capabilities = capabilities
	server:setup(config)
end)

vim.diagnostic.config({ virtual_text = { prefix = "💡" } })

require("lsp.b-null-ls")
