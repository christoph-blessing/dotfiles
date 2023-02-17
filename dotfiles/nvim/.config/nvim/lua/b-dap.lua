local M = {}

M.setup = function()
	local dap = require("dap")
	dap.adapters.python = {
		type = "executable",
		command = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python",
		args = { "-m", "debugpy.adapter" },
	}

	dap.configurations.python = {
		{
			type = "python",
			request = "launch",
			name = "Launch file",
			program = "${file}",
			pythonPath = function()
				if vim.fn.executable(os.getenv("VIRTUAL_ENV") .. "/bin/python") == 1 then
					return os.getenv("VIRTUAL_ENV") .. "/bin/python"
				end
				return "/usr/bin/python"
			end,
		},
	}

	vim.fn.sign_define("DapBreakpoint", { text = "😠" })
	vim.fn.sign_define("DapBreakpointCondition", { text = "😤" })
	vim.fn.sign_define("DapLogPoint", { text = "👀" })
	vim.fn.sign_define("DapStopped", { text = "👉" })
	vim.fn.sign_define("DapBreakpointRejected", { text = "🤬" })
end

return M
