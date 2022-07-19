vim.cmd("autocmd BufWritePost plugins.lua PackerCompile")

return function(use)
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
			require("b-treesitter").setup()
		end,
		run = ":TSUpdate",
	})

	use({
		"nvim-treesitter/playground",
		config = function()
			require("b-treesitter-playground").setup()
		end,
		after = "nvim-treesitter",
		run = ":TSInstall query",
	})

	use("L3MON4D3/LuaSnip")
	use({ "rafamadriz/friendly-snippets", event = "InsertCharPre" })

	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		config = function()
			require("b-lualine").setup()
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
			require("b-tree").setup()
		end,
	})

	use("tpope/vim-surround")
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("b-autopairs").setup()
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
			{ "hrsh7th/cmp-cmdline" },
			{ "saadparwaiz1/cmp_luasnip" },
		},
	})

	use("kyazdani42/nvim-web-devicons")

	use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("b-gitsigns").setup()
		end,
	})

	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
		config = function()
			require("b-telescope").setup()
		end,
	})

	use({
		"mfussenegger/nvim-dap",
		config = function()
			require("b-dap").setup()
		end,
	})

	use({ "lukas-reineke/indent-blankline.nvim" })

	use({
		"numToStr/Comment.nvim",
		event = "BufRead",
		config = function()
			require("b-comment").setup()
		end,
	})

	use({
		"akinsho/toggleterm.nvim",
		event = "BufWinEnter",
		config = function()
			require("b-toggleterm").setup()
		end,
	})

	use({
		"folke/which-key.nvim",
		config = function()
			require("b-which-key").setup()
		end,
	})

	use({
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("b-colorizer").setup()
		end,
	})

	use({
		"rcarriga/nvim-notify",
		config = function()
			require("b-notify").setup()
		end,
	})

	use({
		"github/copilot.vim",
		config = function()
			require("b-copilot").setup()
		end,
	})

	use({ "antoinemadec/FixCursorHold.nvim" })

	use({
		"nvim-neotest/neotest",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
		},
		config = function()
			require("b-neotest").setup()
		end,
	})

	use({
		"nvim-neotest/neotest-python",
		requires = {
			"nvim-neotest/neotest",
		},
	})
end
