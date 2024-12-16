return {
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = true,
  },
  {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup()
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
