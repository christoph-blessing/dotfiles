local join = function(parts)
	local joined = ""
	for i, part in pairs(parts) do
		if i == 1 then
			joined = part .. joined
		else
			joined = part .. ", " .. joined
		end
	end
	return joined
end

local get_level = function(report)
	local level = "INFO"
	if report["n_failed"] ~= nil then
		level = "ERROR"
	end
	return level
end

local M = {}

M.display = function(report)
	local parts = {}
	if report["n_passed"] ~= nil then
		table.insert(parts, report["n_passed"] .. " passed")
	end
	if report["n_failed"] ~= nil then
		table.insert(parts, report["n_failed"] .. " failed")
	end

	local message = join(parts) .. " in " .. report["time"]

	vim.notify(message, get_level(report), { title = "pytest" })
end

return M
