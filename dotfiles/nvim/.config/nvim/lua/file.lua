local function file_exists(file)
	local handle = io.open(file, "rb")
	if handle then
		handle:close()
	end
	return handle ~= nil
end

local M = {}

M.file_exists = function(file)
	file_exists(file)
end

M.lines_from = function(file)
	if not file_exists(file) then
		return {}
	end
	local lines = {}
	for line in io.lines(file) do
		lines[#lines + 1] = line
	end
	return lines
end

return M
