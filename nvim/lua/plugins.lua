vim.cmd("autocmd BufWritePost plugins.lua PackerCompile")

return require"packer".startup(function()
    use "wbthomason/packer.nvim"
    use "morhetz/gruvbox"
    use "tpope/vim-surround"
    use "neovim/nvim-lspconfig"
    use "hrsh7th/nvim-compe"
    use "windwp/nvim-autopairs"
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
    use "hrsh7th/vim-vsnip"
    use "p00f/nvim-ts-rainbow"
end)
