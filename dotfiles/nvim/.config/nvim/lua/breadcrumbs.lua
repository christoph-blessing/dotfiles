local navic = require("nvim-navic")
local f = require("utils.functions")

local M = {}

M.winbar_excluded_filetypes = {
	"toggleterm",
	"lazy",
	"help",
	"NvimTree",
	"dap-repl",
	"dap-terminal",
	"dapui_console",
}

M.get_filename = function()
	return vim.fn.expand("%:t")
end

M.get_location = function()
	if not navic.is_available() then
		return ""
	end
	local location = navic.get_location()
	if f.isempty(location) then
		return ""
	end
	return ">" .. " " .. location
end

local filetype_is_excluded = function()
	return vim.tbl_contains(M.winbar_excluded_filetypes, vim.bo.filetype)
end

M.get_winbar = function()
	if filetype_is_excluded() then
		return
	end
	local value = M.get_filename()
	if f.isempty(value) then
		return
	end
	local location = M.get_location()
	value = value .. " " .. location
	return vim.api.nvim_set_option_value("winbar", value, { scope = "local" })
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
