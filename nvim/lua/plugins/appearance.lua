return {
  {
    "stevearc/dressing.nvim",
    init = function() end,
    lazy = false,
    opts = {
      input = {
        -- Set to false to disable the vim.ui.input implementation
        enabled = true,
        -- Default prompt string
        default_prompt = "Input:",

        -- Can be 'left', 'right', or 'center'
        title_pos = "center",

        -- When true, <Esc> will close the modal
        insert_only = true,

        -- When true, input will start in insert mode.
        start_in_insert = true,

        -- These are passed to nvim_open_win
        border = "rounded",
        -- 'editor' and 'win' will default to being centered
        relative = "editor",

        -- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
        prefer_width = 40,
        width = nil,
        -- min_width and max_width can be a list of mixed types.
        -- min_width = {20, 0.2} means "the greater of 20 columns or 20% of total"
        max_width = { 140, 0.9 },
        min_width = { 80, 0.2 },

        buf_options = {},
        win_options = {
          -- Window transparency (0-100)
          winblend = 0,
          -- Disable line wrapping
          wrap = false,
          -- Indicator for when text exceeds window
          list = true,
          listchars = "precedes:…,extends:…",
          -- Increase this for more context when text scrolls off the window
          sidescrolloff = 0,
        },

        -- Set to `false` to disable
        mappings = {
          n = {
            ["<Esc>"] = "Close",
            ["q"] = "Close",
            ["<CR>"] = "Confirm",
            [":w<CR>"] = "Confirm",
          },
        },
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      return {
        options = {
          theme = "catppuccin",
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
        },

        sections = {
          lualine_a = {
            {
              "mode",
            },
          },
        },
      }
    end,
  },
  {
    "folke/noice.nvim",
    opts = {
      messages = {
        enabled = false,
      },
      notify = {
        enabled = false,
      },
    },
  },
}
