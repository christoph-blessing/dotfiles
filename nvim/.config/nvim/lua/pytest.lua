local function starts_with(str, start)
	return str:lower():sub(1, #start) == start
end

local function reverse(list)
	local n = #list
	local i = 1
	while i < n do
		list[i], list[n] = list[n], list[i]
		i = i + 1
		n = n - 1
	end
end

local M = {}

M.run_test_under_cursor = function()
	local ts_utils = require("nvim-treesitter.ts_utils")

	local node = ts_utils.get_node_at_cursor()
	local parts = {}
	while node ~= nil do
		local node_type = node:type()
		if node_type == "function_definition" or node_type == "class_definition" then
			local ident = ts_utils.get_node_text(node:named_child(0))[1]
			if not starts_with(ident, "test") then
				break
			end
			table.insert(parts, ident)
		end
		node = node:parent()
	end

	reverse(parts)
	local path = table.concat(parts, "::")

	if path ~= "" then
		require("toggleterm").exec("pytest " .. vim.fn.expand("%") .. "::" .. path)
	end
end

return M
