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
    use "glepnir/galaxyline.nvim"
    use "kyazdani42/nvim-web-devicons"
    use {"lewis6991/gitsigns.nvim", requires = {"nvim-lua/plenary.nvim"}}
    use "norcalli/nvim-colorizer.lua"
    use "unblevable/quick-scope"
    use "romgrk/barbar.nvim"
    use "phaazon/hop.nvim"
    use "norcalli/nvim_utils"
    use "tpope/vim-fugitive"
    use "kyazdani42/nvim-tree.lua"
end)
