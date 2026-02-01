return {
  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    opts = {
      -- configuration goes here
      arg = "leet",
      lang = "python3",
      injector = { ---@type table<lc.lang, lc.inject>
        ["python3"] = {
          imports = {},
        },
        ["golang"] = {
          before = { "package main" },
        },
      },
    },
  },
}
