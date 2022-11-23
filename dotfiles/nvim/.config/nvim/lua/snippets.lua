local function join_paths(...)
	local result = table.concat({ ... }, "/")
	return result
end

local M = {}

M.setup = function()
	local paths = { join_paths(vim.fn.stdpath("data"), "site", "pack", "packer", "opt", "friendly-snippets") }
	require("luasnip.loaders.from_vscode").lazy_load({ paths = paths })
end

return M
