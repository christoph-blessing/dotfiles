local M = { is_enabled = {} }

function M.toggle_buffer_diagnostics(bufnr)
	local bufname = vim.api.nvim_buf_get_name(bufnr)
	if M.is_enabled[bufname] == nil then
		M.is_enabled[bufname] = true
	end
	if M.is_enabled[bufname] == true then
		vim.diagnostic.disable(bufnr)
		M.is_enabled[bufname] = false
	elseif M.is_enabled[bufname] == false then
		vim.diagnostic.enable(bufnr)
		M.is_enabled[bufname] = true
	end
end

return M
