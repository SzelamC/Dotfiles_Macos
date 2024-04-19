return {
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
}
