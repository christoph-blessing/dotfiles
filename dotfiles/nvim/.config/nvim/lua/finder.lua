M = {}

M.setup = function()
	require("telescope").setup({
		pickers = {
			find_files = {
				find_command = { "fd", "--type=file" },
				hidden = true,
			},
			live_grep = {
				additional_args = { "--hidden" },
			},
		},
	})

	require("telescope").load_extension("fzf")
end

return M
