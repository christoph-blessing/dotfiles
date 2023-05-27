local M = {}

M.setup = function()
    local null_ls = require("null-ls")
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    local on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format()
                end,
            })
        end
    end

    local create_condition = function(name)
        return function(utils)
            if not utils.root_has_file("pyproject.toml") then
                return false
            end
            local pipe = io.open("pyproject.toml")
            for line in pipe:lines() do
                if line == "[tool." .. name .. "]" then
                    return true
                end
            end
        end
    end

    local sources = {
        null_ls.builtins.formatting.black.with({
            condition = create_condition("black"),
        }),
        null_ls.builtins.formatting.isort.with({
            condition = create_condition("isort"),
        }),
        null_ls.builtins.formatting.rustfmt,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.shellcheck,
        null_ls.builtins.diagnostics.flake8.with({
            condition = function(utils)
                return utils.root_has_file(".flake8")
            end,
        }),
        null_ls.builtins.diagnostics.mypy.with({
            condition = create_condition("mypy"),
            args = function(params)
                return {
                    "--hide-error-codes",
                    "--hide-error-context",
                    "--no-color-output",
                    "--show-column-numbers",
                    "--show-error-codes",
                    "--no-error-summary",
                    "--no-pretty",
                    "--shadow-file",
                    params.bufname,
                    params.temp_path,
                }
            end,
        }),
        null_ls.builtins.diagnostics.pylint.with({
            condition = create_condition("pylint.master"),
        }),
    }

    null_ls.setup({ sources = sources, diagnostics_format = "[#{c}] #{m} (#{s})", on_attach = on_attach, debug = false })

    require("which-key").register({
        n = {
            name = "Null-LS",
            d = {
                function()
                    null_ls.toggle({ method = null_ls.methods.DIAGNOSTICS })
                end, "Toggle Diagnostic Sources",
            },
            r = {
                function()
                    for i = 1, #sources do
                        null_ls.register({ sources[i] })
                    end
                end,
                "Register All Sources",
            },
        },
    }, {
        prefix = "<leader>",
    })
end

return M
