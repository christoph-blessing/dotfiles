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

	local neotest = require("neotest")
	local skip_slow = false
	neotest.setup({
		adapters = {
			require("neotest-python")({
				args = function()
					if skip_slow then
						return { "-m", "not slow" }
					end
					return {}
				end,
			}),
		},
		icons = { passed = "✅", failed = "❌", running = "⚙", skipped = "⛔", unknown = "❓" },
	})

	local parse_args = function(args)
		if args == "notslow" then
			return true
		elseif args == "" then
			return false
		else
			error("Invalid argument: " .. vim.inspect(args))
		end
	end

	vim.api.nvim_create_user_command("NeotestSuite", function(opts)
		local parsed_value = parse_args(opts.args)
		skip_slow = parsed_value
		neotest.run.run({ suite = true })
	end, {
		nargs = "?",
	})
end

return M
