local M = {}

M.setup = function()
	require("copilot").setup({ panel = { enabled = false }, suggestion = { auto_trigger = true } })
end

return M
