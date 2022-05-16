local function sync_host(host)
	if not string.find(host, ":") then
		host = host .. ":"
	end
	local cmd = string.format(
		[[rsync -av --delete --exclude=".git" --filter="dir-merge,- .gitignore" %s %s]],
		vim.fn.getcwd(),
		host
	)
	vim.cmd(string.format("TermExec open=0 cmd='%s'", cmd))
end

local M = {}

M.sync = function()
	local hosts = require("utils.file").lines_from(".hosts")
	for _, host in pairs(hosts) do
		sync_host(host)
	end
end

return M
