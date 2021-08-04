vim.o.completeopt = "menuone,noselect"

require"compe".setup {
    enabled = true,
    autocomplete = true,
    debug = false,
    min_length = 1,
    preselect = "enable",
    throttle_time = 80,
    source_timeout = 200,
    incomplete_delay = 400,
    max_abbr_width = 100,
    max_kind_width = 100,
    max_menu_width = 100,
    documentation = true,

    source = {path = true, buffer = true, calc = true, nvim_lsp = true, nvim_lua = true, vsnip = true}
}

local replace_termcodes = function(str) return vim.api.nvim_replace_termcodes(str, true, true, true) end

local check_back_space = function()
    local col = vim.fn.col(".") - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
end

_G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return replace_termcodes "<C-n>"
    elseif vim.fn.call("vsnip#available", {1}) == 1 then
        return replace_termcodes "<Plug>(vsnip-expand-or-jump)"
    elseif check_back_space() then
        return replace_termcodes "<Tab>"
    else
        return vim.fn["compe#complete"]()
    end
end

_G.shift_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return replace_termcodes "<C-p>"
    elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
        return replace_termcodes "<Plug>(vsnip-jump-prev)"
    else
        return replace_termcodes "<S-Tab>"
    end
end

vim.api.nvim_set_keymap("i", "<C-Space>", "compe#complete()", {silent = true, noremap = true, expr = true})
vim.api.nvim_set_keymap("i", "<CR>", "compe#confirm('require 'nvim-autopairs'.autopairs_cr()')",
                        {silent = true, noremap = true, expr = true})
vim.api.nvim_set_keymap("i", "<C-e>", "compe#close('<C-e>')", {silent = true, noremap = true, expr = true})
vim.api.nvim_set_keymap("i", "<C-f>", "compe#scroll({ 'delta': +4 })", {silent = true, noremap = true, expr = true})
vim.api.nvim_set_keymap("i", "<C-d>", "compe#scroll({ 'delta': -4 })", {silent = true, noremap = true, expr = true})
vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.shift_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.shift_tab_complete()", {expr = true})
