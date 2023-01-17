local plugins = {
	{ "neovim/nvim-lspconfig" },
	{ "williamboman/nvim-lsp-installer" },
	{
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = { { "nvim-lua/plenary.nvim" }, { "neovim/nvim-lspconfig" } },
	},
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("b-treesitter").setup()
		end,
		build = ":TSUpdate",
	},
	{
		"L3MON4D3/LuaSnip",
		config = function()
			require("snippets").setup()
		end,
	},
	{ "rafamadriz/friendly-snippets", event = "InsertCharPre" },
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons", opt = true },
		config = function()
			require("statusline").setup()
		end,
	},
	{
		"akinsho/bufferline.nvim",
		dependencies = "kyazdani42/nvim-web-devicons",
		config = function()
			require("b-bufferline").setup()
		end,
	},
	{
		"kyazdani42/nvim-tree.lua",
		config = function()
			require("b-tree").setup()
		end,
	},
	{ "tpope/vim-surround" },
	{
		"windwp/nvim-autopairs",
		config = function()
			require("b-autopairs").setup()
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme gruvbox]])
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "hrsh7th/cmp-cmdline" },
			{ "saadparwaiz1/cmp_luasnip" },
		},
	},
	{ "kyazdani42/nvim-web-devicons" },
	{
		"lewis6991/gitsigns.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("b-gitsigns").setup()
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-telescope/telescope-fzf-native.nvim", "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim" },
		config = function()
			require("finder").setup()
		end,
		cmd = "Telescope",
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
		lazy = true,
	},
	{
		"mfussenegger/nvim-dap",
		config = function()
			require("b-dap").setup()
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap" },
		config = function()
			require("b-dap-ui").setup()
		end,
	},
	{ "lukas-reineke/indent-blankline.nvim" },
	{
		"numToStr/Comment.nvim",
		event = "BufRead",
		config = function()
			require("b-comment").setup()
		end,
	},
	{
		"akinsho/toggleterm.nvim",
		event = "BufWinEnter",
		config = function()
			require("b-toggleterm").setup()
		end,
	},
	{
		"folke/which-key.nvim",
		config = function()
			require("b-which-key").setup()
		end,
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("b-colorizer").setup()
		end,
	},
	{
		"rcarriga/nvim-notify",
		config = function()
			require("b-notify").setup()
		end,
	},
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("b-neotest").setup()
		end,
	},
	{
		"nvim-neotest/neotest-python",
		dependencies = {
			"nvim-neotest/neotest",
		},
	},
	{
		"RRethy/vim-illuminate",
		config = function()
			require("b-illuminate").setup()
		end,
	},
	{
		"SmiteshP/nvim-navic",
	},
	{
		"ja-ford/delaytrain.nvim",
		config = function()
			require("b-delaytrain").setup()
		end,
	},
	{ "nvim-treesitter/nvim-treesitter-textobjects" },
}

return plugins
