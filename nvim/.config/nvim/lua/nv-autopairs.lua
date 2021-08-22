local npairs = require("nvim-autopairs")
local Rule = require("nvim-autopairs.rule")

npairs.setup()

require("nvim-autopairs.completion.compe").setup({
	map_cr = true, --  map <CR> on insert mode
	map_complete = true, -- it will auto insert `(` after select function or method item
	auto_select = true, -- auto select first item
})

npairs.add_rule(Rule("|", "|", "rust"))
