local M = {}

local get_buffer = function()
	local content = vim.api.nvim_buf_get_lines(0, 0, vim.api.nvim_buf_line_count(0), false)
	return table.concat(content, "\n")
end

M.show_diagram = function()
	local path = os.tmpname()
	local file, error = io.open(path, "w")
	if file then
		file:write(get_buffer())
		file:close()
	else
		print("Error opening file: " .. error)
	end
	vim.api.nvim_cmd({ cmd = "!", args = { "plantuml", path }, mods = { silent = true } }, {})
	os.remove(path)
	local image_path = path .. ".png"
	vim.api.nvim_cmd({ cmd = "! ", args = { "sxiv", image_path }, mods = { silent = true } }, {})
	os.remove(path .. image_path)
end

return M
