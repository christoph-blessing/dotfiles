M = {}

M.setup = function()
	local dap = require("dap")
	dap.adapters.python = {
		type = "executable",
		command = "python",
		args = { "-m", "debugpy.adapter" },
	}

	dap.configurations.python = {
		{
			type = "python",
			request = "launch",
			name = "Launch file",
			program = "${file}",
			pythonPath = function()
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
