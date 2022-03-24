M = {}

M.setup = function()
	require("project_nvim").setup()
	require("telescope").load_extension("projects")
end

return M
