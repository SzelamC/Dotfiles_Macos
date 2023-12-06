return {
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    tag = "nightly",
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Nvim Tree Toggle" },
    },
    opts = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
      return {
        view = {
          side = "right",
          number = true,
          relativenumber = true,
          signcolumn = "yes",
          adaptive_size = true,
          preserve_window_proportions = true,
          mappings = {
            custom_only = false,
            list = {
              -- user mappings go here
              { key = { "l", "CR", "o" }, action = "edit", mode = "n" },
              { key = { "r" }, action = "rename_basename", mode = "n" },
            },
          },
        },
        renderer = {
          add_trailing = false,
          group_empty = false,
          highlight_git = true,
          icons = {
            show = {
              file = true,
              folder = true,
              folder_arrow = true,
              git = true,
            },
            git_placement = "after",
            glyphs = {
              default = "󰈚",
              symlink = "",
              bookmark = "",
              folder = {
                default = "",
                empty = "",
                empty_open = "",
                open = "",
                symlink = "",
                symlink_open = "",
                arrow_open = "",
                arrow_closed = "",
              },
              git = {
                unstaged = "✗",
                staged = "✓",
                unmerged = "",
                renamed = "➜",
                untracked = "★",
                deleted = "",
                ignored = "◌",
              },
            },
          },
        },
        git = {
          ignore = false,
        },
      }
    end,
  },
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "H", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
      { "L", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    },
    opts = function()
      local bufferline = require("bufferline")
      return {
        options = {
          mode = "buffers",
          style_preset = bufferline.style_preset.no_italic,
          diagnostics = "nvim_lsp",
          offsets = {
            {
              filetype = "NvimTree",
              text = "File Explorer",
              text_align = "left",
              separator = true,
            },
          },

          separator_style = { "", "" },
          hover = {
            enabled = true,
            delay = 200,
            reveal = { "close" },
          },
        },
      }
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader>fs", "<cmd>Telescope live_grep<cr>", desc = "Telescope live grep" },
      { "<leader>fc", "<cmd>Telescope grep_string<cr>", desc = "Telescope grep string" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Telescope buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Telescope help_tags" },
    },
    opts = function()
      local actions = require("telescope.actions")
      return {
        defaults = {
          mappings = {
            i = {
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
              ["qq"] = actions.close,
            },
          },
        },
      }
    end,
  },
}
