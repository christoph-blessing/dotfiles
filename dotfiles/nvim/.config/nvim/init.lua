local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	vim.o.runtimepath = vim.fn.stdpath("data") .. "/site/pack/*/start/*," .. vim.o.runtimepath
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end

local packer = require("packer")
packer.init({ snapshot = "default", snapshot_path = table.concat({ vim.fn.stdpath("config"), "snapshots" }, "/") })
require("plugins")(packer.use)
if PACKER_BOOTSTRAP then
	require("packer").sync()
else
	require("config")
end
