require("plugins")
require("settings")
require("colorscheme")
require("keymappings")
require("autocommands")

require("lsp")

require("nv-compe")
require("nv-treesitter")
require("nv-ts-rainbow")
require("nv-autopairs")
require("nv-lualine")
require("nv-gitsigns")
require("nv-barbar")
require("nv-tree")
require("nv-telescope")
require("nv-dap")
require("nv-comment")

vim.cmd("source ~/.config/nvim/vimscript/functions.vim")
