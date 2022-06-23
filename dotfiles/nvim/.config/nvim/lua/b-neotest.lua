local M = {}

local hi = vim.api.nvim_set_hl

M.setup = function()
	hi(0, "NeotestPassed", { fg = "#b8bb26" })
	hi(0, "NeotestFailed", { fg = "#fb4934" })
	hi(0, "NeotestRunning", { fg = "#fabd2f" })
	hi(0, "NeotestSkipped", { fg = "#83a598" })
	hi(0, "NeotestNamespace", { fg = "#d3869b" })
	hi(0, "NeotestFocused", { underline = true, bold = true })
	hi(0, "NeotestFile", { fg = "#8ec07c" })
	hi(0, "NeotestDir", { fg = "#8ec07c" })
	hi(0, "NeotestIndent", { fg = "#928374" })
	hi(0, "NeotestExpandMarker", { fg = "#928374" })
	hi(0, "NeotestAdapterName", { fg = "#fe8019" })

	require("neotest").setup({
		adapters = { require("neotest-python") },
		icons = { passed = "✅", failed = "❌", running = "⚙", skipped = "⛔", unknown = "❓" },
	})
end

return M
