require("formatter").setup({
    logging = false,
    filetype = {
        python = {
            function() return {exe = "black", args = {"--quiet", "-"}, stdin = true} end,
            function() return {exe = "isort", args = {"--quiet", "-"}, stdin = true} end
        },
        rust = {function() return {exe = "rustfmt", args = {"--emit=stdout"}, stdin = true} end},
        lua = {function() return {exe = "lua-format", args = {"-i", "--column-limit", "120"}, stdin = true} end},
        markdown = {
            function()
                return {exe = "pandoc", args = {"-f", "markdown", "-t", "gfm", "-sp", "--tab-stop", "2"}, stdin = true}
            end
        }
    }
})
