vim.cmd("autocmd BufWritePost plugins.lua PackerCompile")

return require("packer").startup(function()
	use("wbthomason/packer.nvim")

	use("neovim/nvim-lspconfig")
	use("kabouzeid/nvim-lspinstall")
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = { { "nvim-lua/plenary.nvim" }, { "neovim/nvim-lspconfig" } },
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("nv-treesitter").setup()
		end,
		run = ":TSUpdate",
	})

	use({ "hrsh7th/vim-vsnip", event = "InsertEnter" })
	use({ "rafamadriz/friendly-snippets", event = "InsertCharPre" })

	use({
		"shadmansaleh/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		config = function()
			require("nv-lualine").setup()
		end,
	})
	use("romgrk/barbar.nvim")
	use({
		"kyazdani42/nvim-tree.lua",
		config = function()
			require("nv-tree").setup()
		end,
	})

	use("tpope/vim-surround")
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nv-autopairs").setup()
		end,
	})
	use({
		"p00f/nvim-ts-rainbow",
		requires = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("nv-ts-rainbow").setup()
		end,
	})

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

	use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("nv-gitsigns").setup()
		end,
	})

	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
		config = function()
			require("nv-telescope").setup()
		end,
	})

	use({
		"mfussenegger/nvim-dap",
		config = function()
			require("nv-dap").setup()
		end,
	})

	use({ "lukas-reineke/indent-blankline.nvim" })

	use({
		"terrortylor/nvim-comment",
		event = "BufRead",
		config = function()
			require("nv-comment").setup()
		end,
	})

	use({
		"weirongxu/plantuml-previewer.vim",
		ft = { "plantuml" },
		requires = { "tyru/open-browser.vim" },
	})

	use({
		"ellisonleao/glow.nvim",
		ft = { "markdown" },
		run = function()
			require("glow").download_glow()
		end,
	})

	use({
		"akinsho/toggleterm.nvim",
		event = "BufWinEnter",
		config = function()
			require("nv-toggleterm").setup()
		end,
	})
end)
