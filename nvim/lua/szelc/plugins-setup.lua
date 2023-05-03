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
      "nvim-tree/nvim-web-devicons",
    },
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    tag = "nightly",
    config = function()
      require("szelc.plugins.nvim-tree")
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
  { "lukas-reineke/indent-blankline.nvim", event = { "BufReadPost", "BufNewFile" } },
  -- appearance
  {
    "folke/tokyonight.nvim",
    event = "VeryLazy",
    config = function()
      require("szelc.plugins.tokyonight")
    end,
  },
  { "bluz71/vim-nightfly-colors",          name = "nightfly",                      lazy = false, priority = 1000 },
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
      vim.cmd([[colorscheme onedark]])
    end,
  },
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    config = function()
      require("szelc.plugins.catppuccin")
      -- vim.cmd([[colorscheme catppuccin]])
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      -- char = "▏",
      char = "│",
      filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy" },
      show_trailing_blankline_indent = false,
      show_current_context = false,
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
        pattern = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason", "markdown" },
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
  -- autocompletion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      {
        -- snippet plugin
        "L3MON4D3/LuaSnip",
        dependencies = "rafamadriz/friendly-snippets",
      },

      -- autopairing of (){}[] etc
      {
        "windwp/nvim-autopairs",
        event = "VeryLazy",
        opts = {
          fast_wrap = {},
          disable_filetype = { "TelescopePrompt", "vim" },
        },
        config = function(_, opts)
          require("nvim-autopairs").setup(opts)

          -- setup cmp for autopairs
          local cmp_autopairs = require("nvim-autopairs.completion.cmp")
          require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
      },

      -- cmp sources plugins
      {
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
      },
    },
    config = function(_, opts)
      require("cmp").setup(opts)
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    config = function()
      require("szelc.plugins.nvim-cmp")
    end,
  },
  -- LSP

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      {
        "jose-elias-alvarez/null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
          require("szelc.plugins.lsp.null-ls")
        end,
      },
      {
        "williamboman/mason.nvim",
        cmd = "Mason",
        config = function()
          require("szelc.plugins.lsp.mason")
        end,
      },
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("szelc.plugins.lsp.lspconfig")
    end,
  },
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "glepnir/lspsaga.nvim",
    event = "VeryLazy",
    branch = "main",
    config = function()
      require("szelc.plugins.lsp.lspsaga")
    end,
  },
  {
    "onsails/lspkind.nvim",
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
  {
    "nvim-treesitter/playground",
  },
  -- auto closing
  {
    "windwp/nvim-autopairs",
    config = function()
      require("szelc.plugins.autopairs")
    end,
  },
  { "windwp/nvim-ts-autotag" },
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("szelc.plugins.bufferline")
    end,
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
    config = function(_, opts)
      require("gitsigns").setup(opts)
    end,
  },
  {
    "tpope/vim-fugitive",
  },

  -- -- playground
  -- "ThePrimeagen/vim-be-good",

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
  {
    "ianding1/leetcode.vim",
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
