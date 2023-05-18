local plugins = {
	{
		"williamboman/mason.nvim",
		config = function()
			require("b-mason").setup()
		end,
	},
	{ "williamboman/mason-lspconfig.nvim", lazy = true, dependencies = { "williamboman/mason.nvim" } },
	{ "neovim/nvim-lspconfig", lazy = true, dependencies = { "williamboman/mason-lspconfig.nvim" } },
	{
		"jose-elias-alvarez/null-ls.nvim",
		lazy = true,
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
		event = "InsertEnter",
		dependencies = { "friendly-snippets" },
	},
	{ "rafamadriz/friendly-snippets", lazy = true },
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons", opt = true },
		config = function()
			require("statusline").setup()
		end,
	},
	{
		"windwp/nvim-autopairs",
		config = function()
			require("b-autopairs").setup()
		end,
		event = "InsertEnter",
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
		event = { "InsertEnter", "CmdlineEnter" },
	},
	{ "hrsh7th/cmp-nvim-lsp", lazy = true },
	{ "saadparwaiz1/cmp_luasnip", lazy = true },
	{ "hrsh7th/cmp-buffer", lazy = true },
	{ "hrsh7th/cmp-path", lazy = true },
	{ "hrsh7th/cmp-cmdline", lazy = true },
	{ "hrsh7th/cmp-nvim-lua", lazy = true },
	{ "kyazdani42/nvim-web-devicons" },
	{
		"lewis6991/gitsigns.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("b-gitsigns").setup()
		end,
		event = "BufRead",
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
	{ "nvim-treesitter/nvim-treesitter-textobjects" },
	{
		"ggandor/leap.nvim",
		config = function()
			require("b-leap").setup()
		end,
	},
	{
		"ThePrimeagen/harpoon",
		config = function()
			require("b-harpoon").setup()
		end,
	},
	{
		"sindrets/diffview.nvim",
		config = function()
			require("b-diffview").setup()
		end,
	},
}

return plugins
