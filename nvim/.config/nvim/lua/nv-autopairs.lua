M = {}

M.setup = function()
	local npairs = require("nvim-autopairs")
	local Rule = require("nvim-autopairs.rule")

	npairs.setup()

	npairs.add_rule(Rule("|", "|", "rust"))
end

return M({})
