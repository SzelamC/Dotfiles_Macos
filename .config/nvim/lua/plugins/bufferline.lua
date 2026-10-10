return {
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "H", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
      { "L", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    },
    dependencies = {
      "catppuccin",
    },
    opts = function()
      return {
        highlights = require("catppuccin.groups.integrations.bufferline").get(),
        options = {
          mode = "buffers",
          diagnostics = "nvim_lsp",
          offsets = {
            {
              filetype = "NvimTree",
              text = "File Explorer",
              text_align = "left",
              separator = true,
            },
          },
        },
      }
    end,
  },
}
