local split = function(str, sep)
	local parts = {}
	for match in string.gmatch(str, "([^" .. sep .. "]+)") do
		table.insert(parts, match)
	end
	return parts
end

local parse_failures = function(raw)
	local failures = {}
	for module_path, test_path in string.gmatch(raw, "FAILED ([%a/_]+%.py)::([%a:_]+)") do
		test_path = split(test_path, "::")
		table.insert(failures, { module_path = module_path, test_path = test_path })
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
	else
		parsed["failures"] = {}
	end

	return parsed
end

return M
