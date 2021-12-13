local resolve_cmd = function()
	local pipe = io.popen("docker-compose config --services")
	for line in pipe:lines() do
		if line == "dev" then
			local root_dir = vim.fn.getcwd()
			return {
				"docker-compose",
				"run",
				"--rm",
				"dev",
			}
		end
	end
	return { vim.fn.stdpath("data") .. "/lspinstall/python/node_modules/.bin/pyright-langserver", "--stdio" }
end

return {
	before_init = function(params)
		params.processId = vim.NIL
	end,
	cmd = resolve_cmd(),
	root_dir = require("lspconfig").util.root_pattern(".git", vim.fn.getcwd()),
}
