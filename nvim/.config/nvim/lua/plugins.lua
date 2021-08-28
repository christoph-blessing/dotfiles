vim.cmd("autocmd BufWritePost plugins.lua PackerCompile")

return require("packer").startup(function()
	use("wbthomason/packer.nvim")

	use("neovim/nvim-lspconfig")
	use("kabouzeid/nvim-lspinstall")
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = { { "nvim-lua/plenary.nvim" }, { "neovim/nvim-lspconfig" } },
	})

	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

	use("hrsh7th/vim-vsnip")
	use("rafamadriz/friendly-snippets")

	use({ "shadmansaleh/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } })
	use("romgrk/barbar.nvim")
	use("kyazdani42/nvim-tree.lua")

	use("tpope/vim-surround")
	use("windwp/nvim-autopairs")
	use({ "p00f/nvim-ts-rainbow", requires = { "nvim-treesitter/nvim-treesitter" } })

	use("morhetz/gruvbox")

	use({
		"hrsh7th/nvim-cmp",
		requires = {
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "hrsh7th/cmp-vsnip" },
		},
	})

	use("kyazdani42/nvim-web-devicons")

	use({ "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" } })

	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
	})

	use("mfussenegger/nvim-dap")

	use({ "lukas-reineke/indent-blankline.nvim" })

	use("terrortylor/nvim-comment")

	use({
		"weirongxu/plantuml-previewer.vim",
		requires = { "tyru/open-browser.vim" },
	})

	use({
		"ellisonleao/glow.nvim",
		run = function()
			require("glow").download_glow()
		end,
	})
end)
