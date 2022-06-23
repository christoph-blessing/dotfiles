local M = {}

M.setup = function()
	require("neotest").setup({
		adapters = { require("neotest-python") },
		icons = { passed = "✅", failed = "❌", running = "⚙", skipped = "⛔", unknown = "❓" },
	})
end

return M
