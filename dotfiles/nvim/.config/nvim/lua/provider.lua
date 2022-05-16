local M = {}

M.python = function()
	local lines = require("utils.file").lines_from(".pdm.toml")
	for _, line in pairs(lines) do
		if require("utils.string").starts_with(line, "path = ") then
			return line:sub(8):gsub('"', "")
		end
	end
	return "python"
end

return M
