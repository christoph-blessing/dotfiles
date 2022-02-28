vim.cmd("autocmd BufWritePost plugins.lua PackerCompile")

return require("packer").startup(function()
	use("wbthomason/packer.nvim")

	use("neovim/nvim-lspconfig")
	use("williamboman/nvim-lsp-installer")
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

	use({
		"nvim-treesitter/playground",
		config = function()
			require("nv-treesitter-playground").setup()
		end,
		run = ":TSInstall query",
		after = "nvim-treesitter",
	})

	use("L3MON4D3/LuaSnip")
	use({ "rafamadriz/friendly-snippets", event = "InsertCharPre" })

	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		config = function()
			require("nv-lualine").setup()
		end,
	})
	use({
		"akinsho/bufferline.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("b-bufferline").setup()
		end,
	})
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

	use("ellisonleao/gruvbox.nvim")

	use({
		"hrsh7th/nvim-cmp",
		requires = {
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "saadparwaiz1/cmp_luasnip" },
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
		"numToStr/Comment.nvim",
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

	use({
		"folke/which-key.nvim",
		config = function()
			require("nv-which-key").setup()
		end,
	})

	use({
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("nv-colorizer").setup()
		end,
	})

	use({
		"ahmedkhalf/project.nvim",
		config = function()
			require("project").setup()
		end,
	})
end)
