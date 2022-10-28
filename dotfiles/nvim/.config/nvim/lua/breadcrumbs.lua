local navic = require("nvim-navic")

local M = {}

M.get_filename = function()
	return vim.fn.expand("%:t")
end

M.get_location = function()
	if not navic.is_available() then
		return ""
	end
	local location = navic.get_location()
	if location == "" then
		return ""
	end
	return ">" .. " " .. location
end

M.get_winbar = function()
	local value = M.get_filename()
	local location = M.get_location()
	value = value .. " " .. location
	vim.api.nvim_set_option_value("winbar", value, {})
end

M.create_winbar = function()
	vim.api.nvim_create_autocmd(
		{ "CursorMoved", "CursorHold", "BufWinEnter", "BufFilePost", "InsertEnter", "BufWritePost", "TabClosed" },
		{
			callback = function()
				require("breadcrumbs").get_winbar()
			end,
		}
	)
end

return M
