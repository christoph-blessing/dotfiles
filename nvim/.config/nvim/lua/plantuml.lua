local M = {}

local get_buffer = function()
	local content = vim.api.nvim_buf_get_lines(0, 0, vim.api.nvim_buf_line_count(0), false)
	return table.concat(content, "\n")
end

local save_diagram = function(path)
	vim.api.nvim_cmd({ cmd = "!", args = { "plantuml", path }, mods = { silent = true } }, {})
end

local show_diagram = function()
	local path = os.tmpname()
	local file, error = io.open(path, "w")
	if file then
		file:write(get_buffer())
		file:close()
	else
		print("Error opening file: " .. error)
	end
	save_diagram(path)
	os.remove(path)
	local image_path = path .. ".png"
	vim.api.nvim_cmd({ cmd = "! ", args = { "sxiv", image_path }, mods = { silent = true } }, {})
	os.remove(path .. image_path)
end

M.setup = function()
	vim.api.nvim_buf_create_user_command(0, "SaveDiagram", function()
		save_diagram(vim.fn.expand("%"))
	end, {})
	vim.api.nvim_buf_create_user_command(0, "ShowDiagram", show_diagram, {})
	require("which-key").register({
		r = { "<cmd>ShowDiagram<cr>", "Show Diagram" },
	}, {
		prefix = "<leader>",
	})
end

return M
