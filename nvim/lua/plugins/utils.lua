return {
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
  },
  {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup()
    end,
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
