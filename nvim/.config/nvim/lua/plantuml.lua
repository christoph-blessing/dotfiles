local M = {}

M.show_diagram = function()
	vim.cmd("!plantuml %")
	local plantuml_filename = vim.fn.expand("%:t")
	local extension = vim.fn.expand("%:e")
	local diagram_filename, _ = string.gsub(plantuml_filename, extension, "png")
	vim.cmd("!sxiv " .. diagram_filename)
end

return M
