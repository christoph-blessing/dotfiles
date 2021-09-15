local function starts_with(str, start)
	return str:sub(1, #start) == start
end

local M = {}

M.run_test_under_cursor = function()
	local ts_utils = require("nvim-treesitter.ts_utils")

	local node = ts_utils.get_node_at_cursor()
	local parts = {}
	while node ~= nil do
		local node_type = node:type()
		if node_type == "function_definition" or node_type == "class_definition" then
			local ident = ts_utils.get_node_text(node:named_child(0))[1]:lower()
			if not starts_with(ident, "test") then
				break
			end
			table.insert(parts, ident)
		end
		node = node:parent()
	end

	local pytest_expr = table.concat(parts, " and ")

	if pytest_expr ~= "" then
		require("toggleterm").exec("pytest -k '" .. pytest_expr .. "' " .. vim.fn.expand("%"))
	end
end

return M
