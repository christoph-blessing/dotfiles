require("settings")
require("keymappings")
require("autocommands")
require("commands")
require("breadcrumbs").create_winbar()

require("lsp")

vim.cmd("source ~/.config/nvim/vimscript/functions.vim")
