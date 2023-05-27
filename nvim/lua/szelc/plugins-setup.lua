local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- essential plugins
	"nvim-lua/plenary.nvim",
	-- shorthand
	{
		"tpope/vim-surround",
		event = "VeryLazy",
	},
	-- file explorer
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			{
				"mskelton/termicons.nvim",
				dependencies = {
					"nvim-tree/nvim-web-devicons",
				},
			},
		},
		cmd = { "NvimTreeToggle", "NvimTreeFocus" },
		tag = "nightly",
		config = function()
			require("szelc.plugins.nvim-tree")
		end,
	},

	-- general
	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("better_escape").setup({
				mapping = { "jk" },
				timeout = vim.o.timeoutlen,
			})
		end,
	},
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup({
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			})
		end,
	},
	{
		"echasnovski/mini.bufremove",
		version = "*",
	},
	{
		"NvChad/nvim-colorizer.lua",
		config = function(_, opts)
			require("colorizer").setup(opts)

			-- execute colorizer as soon as possible
			vim.defer_fn(function()
				require("colorizer").attach_to_buffer(0)
			end, 0)
		end,
	},
	{
		"folke/todo-comments.nvim",
		config = true,
		cmd = { "TodoTrouble", "TodoTelescope" },
		event = { "BufReadPost", "BufNewFile" },
	},
	-- appearance
	{
		"navarasu/onedark.nvim",
		priority = 1000, -- Ensure it loads first
		config = function()
			require("onedark").setup({
				style = "deep",
				cmp_itemkind_reverse = false,
				transparent = true,
				toggle_style_key = "<leader>ts",
				toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" },
				diagnostics = {
					undercrul = false,
					background = false,
				},
				lualine = {
					transparent = true, -- lualine center bar transparency
				},
				colors = {
					purple = "#c678dd",
				},
				highlights = {},
			})
			-- vim.cmd([[colorscheme onedark]])
		end,
	},
	{
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		config = function()
			require("szelc.plugins.catppuccin")
			vim.cmd([[colorscheme catppuccin]])
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufNewFile" },
		opts = {
			char = "│",
		},
	},
	{
		"echasnovski/mini.indentscope",
		version = false, -- wait till new 0.7.0 release to put it back on semver
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			-- symbol = "▏",
			symbol = "│",
			options = { try_as_border = true },
		},
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
					"help",
					"alpha",
					"dashboard",
					"Trouble",
					"lazy",
					"mason",
				},
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
		end,
		config = function(_, opts)
			require("mini.indentscope").setup(opts)
		end,
	},
	-- status line
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("szelc.plugins.lualine")
		end,
	},
	{
		"akinsho/bufferline.nvim",
		after = "catppuccin",
		event = "VeryLazy",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("szelc.plugins.bufferline")
		end,
	},

	-- telescope
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		tag = "0.1.0",
		config = function()
			require("szelc.plugins.telescope")
		end,
	},
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

	-- LSP stuff
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{
				"jose-elias-alvarez/null-ls.nvim",
				event = { "BufReadPre", "BufNewFile" },
			},
			{
				-- Optional
				"williamboman/mason.nvim",

				event = { "BufReadPost", "BufNewFile" },
				build = function()
					pcall(vim.cmd, "MasonUpdate")
				end,
				cmd = "Mason",
			},
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{
				"hrsh7th/nvim-cmp",
				event = "InsertEnter",
				dependencies = {
					"L3MON4D3/LuaSnip",
					dependencies = "rafamadriz/friendly-snippets",
				},
			},
			{ "hrsh7th/cmp-nvim-lsp", event = "VeryLazy" }, -- Required
			{ "saadparwaiz1/cmp_luasnip", event = "VeryLazy" },
			{ "hrsh7th/cmp-nvim-lua", event = "VeryLazy" },
			{ "hrsh7th/cmp-buffer", event = "VeryLazy" },
			{ "hrsh7th/cmp-path", event = "VeryLazy" },
		},
		config = function()
			require("szelc.plugins.lsp.lsp-zero")
		end,
	},
	{
		"onsails/lspkind.nvim",
		event = "VeryLazy",
	},
	{
		"j-hui/fidget.nvim",
		event = "VeryLazy",
		config = true,
	},

	-- formatting & linting
	"jayp0521/mason-null-ls.nvim",

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("szelc.plugins.treesitter")
		end,
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
			{ "HiPhish/nvim-ts-rainbow2", event = "VeryLazy" },
		},
	},
	-- auto closing
	{
		"windwp/nvim-autopairs",
		event = "VeryLazy",
		opts = {
			fast_wrap = {},
			disable_filetype = { "TelescopePrompt", "vim" },
		},
		config = function(_, opts)
			require("szelc.plugins.autopairs")
		end,
	},
	{ "windwp/nvim-ts-autotag" },

	-- git
	{
		"lewis6991/gitsigns.nvim",
		ft = "gitcommit",
		event = { "BufReadPre", "BufNewFile" },
		init = function()
			-- load gitsigns only when a git file is opened
			vim.api.nvim_create_autocmd({ "BufRead" }, {
				group = vim.api.nvim_create_augroup("GitSignsLazyLoad", { clear = true }),
				callback = function()
					vim.fn.system("git -C " .. vim.fn.expand("%:p:h") .. " rev-parse")
					if vim.v.shell_error == 0 then
						vim.api.nvim_del_augroup_by_name("GitSignsLazyLoad")
						vim.schedule(function()
							require("lazy").load({ plugins = { "gitsigns.nvim" } })
						end)
					end
				end,
			})
		end,
		config = function(_, opts)
			require("gitsigns").setup(opts)
		end,
	},
	{
		"tpope/vim-fugitive",
	},

	-- copilot
	{
		"github/copilot.vim",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			vim.g.copilot_filetypes = {
				["chatgpt"] = false,
				["*"] = true,
			}
		end,
	},

	-- fancy
	{
		"ianding1/leetcode.vim",
		event = "VeryLazy",
		config = function()
			vim.g.leetcode_browser = "firefox"
			vim.g.leetcode_solution_filetype = "cpp"
			vim.g.leetcode_root_dir = "~/dev/leetcode"
		end,
	},
}, {
	defaults = { lazy = false },
	checker = { enabled = false },
	change_detection = {
		notify = false,
	},
	ui = {
		icons = {
			ft = "",
			lazy = "鈴 ",
			loaded = "",
			not_loaded = "",
		},
	},
	performance = {
		rtp = {
			disabled_plugins = {
				"2html_plugin",
				"tohtml",
				"getscript",
				"getscriptPlugin",
				"gzip",
				"logipat",
				"netrw",
				"netrwPlugin",
				"netrwSettings",
				"netrwFileHandlers",
				"matchit",
				"tar",
				"tarPlugin",
				"rrhelper",
				"spellfile_plugin",
				"vimball",
				"vimballPlugin",
				"zip",
				"zipPlugin",
				"tutor",
				"rplugin",
				"synmenu",
				"optwin",
				"compiler",
				"bugreport",
			},
		},
	},
})
