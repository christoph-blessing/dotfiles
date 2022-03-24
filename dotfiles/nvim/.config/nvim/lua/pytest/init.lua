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

local function run(args)
	local command = "pytest"
	if args ~= nil then
		command = command .. " " .. args
	end
	local output = vim.fn.system(command)
	local parsed = require("pytest.parse").parse(output)
	require("pytest.display").display(parsed)
	require("pytest.quickfix").set(parsed)
end

local M = {}

M.run_tests = function()
	run()
end

M.run_tests_in_file = function()
	run(vim.fn.expand("%"))
end

M.run_test_under_cursor = function()
	local ts_utils = require("nvim-treesitter.ts_utils")

	local node = ts_utils.get_node_at_cursor()
	local parts = {}
	while node ~= nil do
		local node_type = node:type()
		if node_type == "function_definition" or node_type == "class_definition" then
			local ident = ts_utils.get_node_text(node:named_child(0))[1]
			if starts_with(ident, "test") then
				table.insert(parts, ident)
			end
		end
		node = node:parent()
	end

	reverse(parts)
	local path = table.concat(parts, "::")

	if path ~= "" then
		run(vim.fn.expand("%") .. "::" .. path)
	end
end

return M