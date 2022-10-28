require("settings")
require("colorscheme")
require("keymappings")
require("autocommands")
require("commands")
require("breadcrumbs").create_winbar()

require("lsp")

require("b-cmp")

vim.cmd("source ~/.config/nvim/vimscript/functions.vim")
