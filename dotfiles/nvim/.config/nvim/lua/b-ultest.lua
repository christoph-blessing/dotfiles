M = {}

M.setup = function()
    vim.g["test#python#pytest#executable"] = "pytest"
    vim.g.ultest_use_pty = 1
    vim.g.ultest_pass_sign = "✅"
    vim.g.ultest_fail_sign = "❌"
    vim.g.ultest_running_sign = "⚙"
    vim.g.ultest_not_run_sign = "❓"
end

return M
