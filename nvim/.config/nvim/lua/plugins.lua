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
    use {"p00f/nvim-ts-rainbow", requires = {"nvim-treesitter/nvim-treesitter"}}
    use "glepnir/galaxyline.nvim"
    use "kyazdani42/nvim-web-devicons"
    use {"lewis6991/gitsigns.nvim", requires = {"nvim-lua/plenary.nvim"}}
    use "romgrk/barbar.nvim"
    use "kyazdani42/nvim-tree.lua"
    use "voldikss/vim-floaterm"
    use {"nvim-telescope/telescope.nvim", requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}}}
    use "mfussenegger/nvim-dap"
    use {"lukas-reineke/indent-blankline.nvim", branch = "lua"}
    use "sheerun/vim-polyglot"
    use "kabouzeid/nvim-lspinstall"
    use "terrortylor/nvim-comment"
end)
