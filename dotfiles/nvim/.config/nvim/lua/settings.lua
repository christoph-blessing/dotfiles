vim.opt["clipboard"] = "unnamedplus"
vim.opt["updatetime"] = 100
vim.opt["timeoutlen"] = 200
vim.opt["termguicolors"] = true
vim.opt["hidden"] = true
vim.opt["splitbelow"] = true
vim.opt["splitright"] = true
vim.opt["showmode"] = false
vim.opt["shortmess"] = vim.o.shortmess .. "c"
vim.opt["shell"] = "zsh"

vim.opt["spell"] = true
vim.opt["number"] = true
vim.opt["relativenumber"] = true
vim.opt["wrap"] = false
vim.opt["cursorline"] = true
vim.opt["signcolumn"] = "yes"

vim.opt["expandtab"] = true
vim.opt["spelllang"] = "en_us"
vim.opt["shiftwidth"] = 4
vim.opt["tabstop"] = 4
vim.opt["smartindent"] = true

vim.opt["foldmethod"] = "expr"
vim.opt["foldexpr"] = "nvim_treesitter#foldexpr()"
