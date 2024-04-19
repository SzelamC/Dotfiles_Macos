return {
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
          sorting_strategy = "ascending",
          layout_strategy = "flex",
          layout_config = {
            horizontal = { preview_cutoff = 80, preview_width = 0.55 },
            vertical = { mirror = true, preview_cutoff = 25 },
            prompt_position = "top",
            width = 0.87,
            height = 0.80,
          },
        },
      }
    end,
  },
}
