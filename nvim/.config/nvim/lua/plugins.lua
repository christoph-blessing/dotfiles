vim.cmd("autocmd BufWritePost plugins.lua PackerCompile")

return require("packer").startup(function()
	use("wbthomason/packer.nvim")
	use("morhetz/gruvbox")
	use("tpope/vim-surround")
	use("neovim/nvim-lspconfig")
	use("hrsh7th/nvim-compe")
	use("windwp/nvim-autopairs")
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("hrsh7th/vim-vsnip")
	use("rafamadriz/friendly-snippets")
	use({ "p00f/nvim-ts-rainbow", requires = { "nvim-treesitter/nvim-treesitter" } })
	use({ "shadmansaleh/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } })
	use("kyazdani42/nvim-web-devicons")
	use({ "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" } })
	use("romgrk/barbar.nvim")
	use("kyazdani42/nvim-tree.lua")
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
	})
	use("mfussenegger/nvim-dap")
	use({ "lukas-reineke/indent-blankline.nvim" })
	use("kabouzeid/nvim-lspinstall")
	use("terrortylor/nvim-comment")
	use({
		"weirongxu/plantuml-previewer.vim",
		requires = { "tyru/open-browser.vim" },
	})
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = { { "nvim-lua/plenary.nvim" }, { "neovim/nvim-lspconfig" } },
	})
end)
