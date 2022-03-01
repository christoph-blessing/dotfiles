local parse_failures = function(raw)
	local failures = {}
	for module_path, test_path in string.gmatch(raw, "FAILED ([%a/_]+%.py)::([%a:_]+)") do
		if failures[module_path] == nil then
			failures[module_path] = {}
		end
		table.insert(failures[module_path], test_path)
	end
	return failures
end

local M = {}

M.parse = function(raw)
	local parsed = {}
	parsed["n_passed"] = string.match(raw, "(%d+) passed")
	parsed["n_failed"] = string.match(raw, "(%d+) failed")
	parsed["time"] = string.match(raw, "in (%d+%.%d%ds)")

	if parsed["n_failed"] ~= nil then
		parsed["failures"] = parse_failures(raw)
	end

	return parsed
end

return M
