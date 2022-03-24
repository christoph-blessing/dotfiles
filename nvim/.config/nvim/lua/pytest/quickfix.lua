local M = {}

M.set = function(report)
	local locs = {}
	for _, failure in pairs(report["failures"]) do
		table.insert(locs, {
			filename = failure["module_path"],
			pattern = failure["test_path"][#failure["test_path"]],
		})
	end
	vim.fn.setqflist(locs)
end

return M
