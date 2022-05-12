local M = {}

M.nvim_create_augroups = function(definitions)
	for augroup_name, definition in pairs(definitions) do
		local augroup = vim.api.nvim_create_augroup(augroup_name, {})
		vim.api.nvim_clear_autocmds({ group = augroup })
		for _, def in ipairs(definition) do
			vim.api.nvim_create_autocmd(def.event, {
				group = augroup,
				pattern = def.pattern,
				callback = def.callback,
			})
		end
	end
end

return M
