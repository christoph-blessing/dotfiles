M = {}

M.setup = function()
	require("telescope").setup({
		pickers = {
			find_files = {
				find_command = { "fd", "--type=file", "--hidden" },
			},
		},
	})
end

return M
