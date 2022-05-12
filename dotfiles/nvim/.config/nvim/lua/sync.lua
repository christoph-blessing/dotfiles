local function sync_host(host)
	local cwd_stem = string.match(vim.fn.getcwd(), "[%w-_]+$")
	local src = vim.fn.expand("%")
	local dest = cwd_stem .. "/" .. src
	local cmd = string.format("rsync -av %s %s:%s", src, host, dest)
	vim.cmd(string.format("TermExec open=0 cmd='%s'", cmd))
end

local M = {}

M.sync = function()
	local hosts = require("file").lines_from(".hosts")
	for _, host in pairs(hosts) do
		sync_host(host)
	end
end

return M
