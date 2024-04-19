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
    "NvChad/nvim-colorizer.lua",
    config = function(_, opts)
      require("colorizer").setup({
        user_default_options = {
          names = false, -- "Name" codes like Blue or blue
          mode = "virtualtext", -- Set the display mode.
          virtualtext = "■",
        },
      })
    end,
  },
  {
    "gbprod/cutlass.nvim",
    config = true,
  },
  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    opts = {
      -- configuration goes here
      arg = "leet",
      lang = "golang",
      injector = { ---@type table<lc.lang, lc.inject>
        ["golang"] = {
          before = { "package main" },
        },
      },
    },
  },
}
