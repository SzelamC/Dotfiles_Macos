return {
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = true,
  },
  {
    "LunarVim/bigfile.nvim",
    config = true,
  },
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    opts = function()
      return {
        mapping = { "jk" },
        timeout = vim.o.timeoutlen,
      }
    end,
  },
  {
    "numToStr/Comment.nvim",
    keys = {
      { "gcc", mode = "n", desc = "Comment toggle current line" },
      { "gc", mode = { "n", "o" }, desc = "Comment toggle linewise" },
      { "gc", mode = "x", desc = "Comment toggle linewise (visual)" },
      { "gbc", mode = "n", desc = "Comment toggle current block" },
      { "gb", mode = { "n", "o" }, desc = "Comment toggle blockwise" },
      { "gb", mode = "x", desc = "Comment toggle blockwise (visual)" },
    },
    opts = {
      pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
    },
  },
  {
    "NvChad/nvim-colorizer.lua",
    config = function(_, opts)
      require("colorizer").setup({
        filetypes = {
          "*", -- Highlight all files, but customize some others.
          "!NvimTree", -- Exclude vim from highlighting.
          -- Exclusion Only makes sense if '*' is specified!
        },
      })
    end,
  },
  {
    "gbprod/cutlass.nvim",
    config = true,
  },
}
