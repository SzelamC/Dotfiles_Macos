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
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = true,
    },
    -- file explorer
    {
        "mskelton/termicons.nvim",
        config = true,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        }
    },
    {
        "nvim-tree/nvim-tree.lua",
        cmd = { "NvimTreeToggle", "NvimTreeFocus" },
        tag = "nightly",
        keys = {
            { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Nvim Tree Toggle" },
        },
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
        keys = {
            { "gcc", mode = "n",          desc = "Comment toggle current line" },
            { "gc",  mode = { "n", "o" }, desc = "Comment toggle linewise" },
            { "gc",  mode = "x",          desc = "Comment toggle linewise (visual)" },
            { "gbc", mode = "n",          desc = "Comment toggle current block" },
            { "gb",  mode = { "n", "o" }, desc = "Comment toggle blockwise" },
            { "gb",  mode = "x",          desc = "Comment toggle blockwise (visual)" },
        },
        config = function()
            require("Comment").setup({
                pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
            })
        end,
    },
    {
        "echasnovski/mini.bufremove",
        version = "*",
        keys = {
            {
                "<leader>c",
                "<cmd>lua require('mini.bufremove').delete(0, true)<cr>",
                desc = "Comment toggle blockwise",
            },
        },
        config = true,
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
        keys = {
            { "<leader>ff", "<cmd>Telescope find_files<cr>",  desc = "Telescope find files" },
            { "<leader>fs", "<cmd>Telescope live_grep<cr>",   desc = "Telescope live grep" },
            { "<leader>fc", "<cmd>Telescope grep_string<cr>", desc = "Telescope grep string" },
            { "<leader>fb", "<cmd>Telescope buffers<cr>",     desc = "Telescope buffers" },
            { "<leader>fh", "<cmd>Telescope help_tags<cr>",   desc = "Telescope help_tags" },
        },
        cmd = { "TodoTrouble", "TodoTelescope" },
        event = { "BufReadPost", "BufNewFile" },
    },
    -- appearance
    {
        "AlexvZyl/nordic.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("szelc.plugins.colorscheme.nordic")
        end,
    },
    {
        "stevearc/dressing.nvim",
        config = function()
            require("szelc.plugins.dressing")
        end,
        event = "VeryLazy",
    },
    -- {
    --     "sam4llis/nvim-tundra",
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         require("szelc.plugins.colorscheme.tundra")
    --     end,
    -- },
    -- {
    --     "folke/tokyonight.nvim",
    --     lazy = false,
    --     priority = 1000,
    --     opts = {},
    --     config = function()
    --         require("szelc.plugins.colorscheme.tokyonight")
    --     end,
    -- },
    -- {
    --     "rose-pine/neovim",
    --     name = "rose-pine",
    --     config = function()
    --         require("szelc.plugins.colorscheme.rose-pine")
    --     end,
    -- },
    -- {
    --     "catppuccin/nvim",
    --     name = "catppuccin",
    --     priority = 1000,
    --     config = function()
    --         require("szelc.plugins.colorscheme.catppuccin")
    --     end,
    -- },
    -- {
    --     "rebelot/kanagawa.nvim",
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         require("szelc.plugins.colorscheme.kanagawa")
    --     end,
    -- },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = { "BufReadPost", "BufNewFile" },
    },
    -- status line
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        config = function()
            require("szelc.plugins.lualine")
        end,
    },
    {
        "akinsho/bufferline.nvim",
        event = "VeryLazy",
        keys = {
            { "H", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
            { "L", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
        },
        config = function()
            require("szelc.plugins.bufferline")
        end,
    },

    -- telescope
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        config = function()
            require("szelc.plugins.telescope")
        end,
    },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    -- LSP stuff
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            -- LSP Support
            {
                "neovim/nvim-lspconfig",
                event = {
                    "BufReadPre",
                    "BufNewFile",
                },
            }, -- Required
            {
                "neovim-stuff/null-ls.nvim",
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
            -- formatting & linting
            "jayp0521/mason-null-ls.nvim",

            -- Autocompletion
        },
        config = function()
            require("szelc.plugins.lsp.lsp-zero")
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            {
                "L3MON4D3/LuaSnip",
                dependencies = {
                    "rafamadriz/friendly-snippets",
                },
            },
            {
                "windwp/nvim-autopairs",
                opts = {
                    fast_wrap = {},
                    disable_filetype = { "TelescopePrompt", "vim" },
                },
                config = function(_, opts)
                    require("nvim-autopairs").setup(opts)
                    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
                    require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
                end,
            },
            {
                "saadparwaiz1/cmp_luasnip",
                "hrsh7th/cmp-nvim-lua",
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
            },
        },
    },
    {
        "onsails/lspkind.nvim",
        event = "VeryLazy",
    },
    {
        "j-hui/fidget.nvim",
        event = "LspAttach",
        config = true,
        tag = "legacy",
    },
    -- Treesitter
    {
        "windwp/nvim-ts-autotag",
        config = true,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = "BufRead",
        config = function()
            require("szelc.plugins.treesitter")
        end,
        dependencies = {
            -- {
            -- 	"HiPhish/rainbow-delimiters.nvim",
            -- 	event = "VeryLazy",
            -- 	config = function()
            -- 		require("szelc.plugins.rainbow-delimiters")
            -- 	end,
            -- },
            "JoosepAlviste/nvim-ts-context-commentstring",
        },
    },

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
        config = function()
            require("szelc.plugins.gitsigns")
        end,
    },
    {
        "NeogitOrg/neogit",
        dependencies = {
            "sindrets/diffview.nvim", -- optional
        },
        keys = {
            { "<leader>G", "<cmd>Neogit<cr>", desc = "Neogit" },
        },
        config = true,
    },
    {
        "simrat39/rust-tools.nvim",
        event = "VeryLazy",
    },
    {
        "ThePrimeagen/harpoon",
        config = function()
            require("szelc.plugins.harpoon")
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
            lazy = " ",
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
